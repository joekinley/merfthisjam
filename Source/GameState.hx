package ;
import org.flixel.FlxCamera;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxPoint;
import org.flixel.FlxRect;
import org.flixel.FlxState;

/**
 * ...
 * @author joekinley
 */

class GameState extends FlxState {

  private var layer_field:FlxGroup;
  private var layer_player:FlxGroup;
  private var layer_ball:FlxGroup;
  private var layer_overlay:FlxGroup;

  private var overlayMenu:OverlayMenu;

  private var lastClick:FlxPoint;

  public function new() {
    super( );
  }

  override public function create( ):Void {
    super.create( );
    FlxG.mouse.show( );

    // initialize layers
    this.initializeLayers( );
    // initialize world
    this.initializeWorld( );
    // initialize field
    this.initializeField( );
    // initialize playermanager
    this.initializePlayerManager( );
    // initialize ball
    this.initializeBall( );
    // initialize camera
    this.initializeCamera( );
    // initialize overlay menu
    this.initializeOverlayMenu( );
  }

  public function initializeLayers( ):Void {
    this.layer_field = new FlxGroup( );
    this.layer_player = new FlxGroup( );
    this.layer_ball = new FlxGroup( );
    this.layer_overlay = new FlxGroup( );

    this.add( this.layer_field );
    this.add( this.layer_player );
    this.add( this.layer_ball );
    this.add( this.layer_overlay );
  }

  public function initializeWorld( ):Void {
    Globals.WORLD = new World( );
    this.layer_field.add( Globals.WORLD );
  }

  public function initializeField( ):Void {
    Globals.FIELD = new Field( );
    this.layer_field.add( Globals.FIELD );
  }

  public function initializePlayerManager( ):Void {
    Globals.PLAYER_MANAGER = new PlayerManager( );
    this.layer_player.add( Globals.PLAYER_MANAGER.players );
  }

  public function initializeBall( ):Void {
    Globals.BALL = new Ball( );
    this.layer_ball.add( Globals.BALL );
  }

  public function initializeCamera( ):Void {
    lastClick = new FlxPoint( );
    //FlxG.camera.follow( Globals.BALL, FlxCamera.STYLE_TOPDOWN );
    FlxG.camera.setBounds( 0, 0, Globals.WORLD_WIDTH, Globals.WORLD_HEIGHT );
    FlxG.worldBounds = new FlxRect( 0, 0, Globals.WORLD_WIDTH, Globals.WORLD_HEIGHT );
  }

  public function initializeOverlayMenu( ):Void {
    this.overlayMenu = new OverlayMenu( );
    this.layer_overlay.add( this.overlayMenu.display );
  }

  override public function update( ):Void {
    this.debug( );
    super.update( );

    // handle game stats
    this.handleGameStatus( );
    this.handleMoveCamera( );

    Globals.PLAYER_MANAGER.update( );
    FlxG.collide( this.layer_player, this.layer_ball );
  }

  public function handleGameStatus( ):Void {
    if ( Globals.GAME_PAUSE ) FlxG.timeScale = 0;
    else FlxG.timeScale = 1;
  }

  private function handleMoveCamera( ):Void {
    if ( FlxG.mouse.justPressed( ) ) {
      lastClick.x = FlxG.mouse.screenX;
      lastClick.y = FlxG.mouse.screenY;
    }

    if ( FlxG.mouse.pressed( ) ) {
      FlxG.camera.scroll.x -= FlxG.mouse.screenX - lastClick.x;
      FlxG.camera.scroll.y -= FlxG.mouse.screenY - lastClick.y;
      lastClick.x = FlxG.mouse.screenX;
      lastClick.y = FlxG.mouse.screenY;
    }
  }

  public function debug( ):Void {
    if ( FlxG.keys.justPressed( 'ONE' ) ) FlxG.camera.zoom -= 0.2;
    if ( FlxG.keys.justPressed( 'TWO' ) ) FlxG.camera.zoom += 0.2;
    if ( FlxG.keys.justPressed( 'SPACE' ) ) Globals.GAME_PAUSE = !Globals.GAME_PAUSE;
    if ( FlxG.keys.justPressed( 'THREE' ) ) this.overlayMenu.toggleOverlay( );
  }
}