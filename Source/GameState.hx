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
  private var layer_hud:FlxGroup;

  private var overlayMenu:OverlayMenu;
  private var hud:HUD;
  private var overview:OverviewState;
  private var _overviewActivated:Bool;

  private var lastClick:FlxPoint;

  public function new() {
    super( );
    this.overviewActivated = false;
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
    // initialize hud
    this.initializeHUD( );
    // initialize overview
    this.initializeOverview( );
  }

  public function initializeLayers( ):Void {
    this.layer_field = new FlxGroup( );
    this.layer_player = new FlxGroup( );
    this.layer_ball = new FlxGroup( );
    this.layer_overlay = new FlxGroup( );
    this.layer_hud = new FlxGroup( );

    this.add( this.layer_field );
    this.add( this.layer_player );
    this.add( this.layer_ball );
    this.add( this.layer_overlay );
    this.add( this.layer_hud );
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

  public function initializeHUD( ):Void {
    this.hud = new HUD( );
    this.layer_hud.add( this.hud.layer );
  }

  public function initializeOverview( ):Void {
    this.overview = new OverviewState( );
  }

  /**
   * UPDATE FUNCTION
   */
  override public function update( ):Void {
    super.update( );

    this.handleMoveCamera( );
    this.handlePlayerMenu( );

    this.overlayMenu.update( );
    this.hud.update( );
    if ( this.overview.activated ) this.overview.update( );

    Globals.PLAYER_MANAGER.update( );
    FlxG.collide( this.layer_player, this.layer_ball );
    this.debug( );
  }

  private function handleMoveCamera( ):Void {
    if ( this.overviewActivated ) return;
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

    #if flash
    if ( FlxG.keys.LEFT || FlxG.keys.A ) FlxG.camera.scroll.x -= 15;
    else if ( FlxG.keys.RIGHT || FlxG.keys.D ) FlxG.camera.scroll.x += 15;
    if ( FlxG.keys.UP || FlxG.keys.W ) FlxG.camera.scroll.y -= 15;
    else if ( FlxG.keys.DOWN || FlxG.keys.S ) FlxG.camera.scroll.y += 15;
    #end
  }

  private function handlePlayerMenu( ):Void {
    if ( Globals.PLAYER_MANAGER.justClickedPlayer( ) ) {
      this.overlayMenu.activateOverlay( );
    }
  }

  public function toggleOverview( ):Void {
    if ( this.overview.activated ) this.deactivateOverview( );
    else this.activateOverview( );
  }

  public function activateOverview( ):Void {
    this.overview.activate( );
    this.layer_overlay.add( this.overview.layer );
    this.overviewActivated = true;
  }

  public function deactivateOverview( ):Void {
    this.overview.deactivate( );
    this.layer_overlay.remove( this.overview.layer );
    this.overviewActivated = false;
  }

  public function debug( ):Void {
    if ( FlxG.keys.justPressed( 'ONE' ) ) trace( 'NOT SET' );
    if ( FlxG.keys.justPressed( 'TWO' ) ) trace( 'NOT SET' );
    if ( FlxG.keys.justPressed( 'SPACE' ) ) Globals.GAME_PAUSE = !Globals.GAME_PAUSE;
    if ( FlxG.keys.justPressed( 'THREE' ) ) this.overlayMenu.toggleOverlay( );
  }

  private function get_overviewActivated():Bool {
    return _overviewActivated;
  }

  private function set_overviewActivated(value:Bool):Bool {
    return _overviewActivated = value;
  }

  public var overviewActivated(get_overviewActivated, set_overviewActivated):Bool;
}