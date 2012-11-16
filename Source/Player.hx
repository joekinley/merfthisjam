package ;
import org.flixel.FlxG;
import org.flixel.FlxPoint;
import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxVelocity;

/**
 * ...
 * @author joekinley
 */

class Player extends FlxSprite {

  private var destPoint:FlxPoint;
  private var distLast:Float;
  private var running:Bool;
  private var _selected:Bool;

  public function new() {
    super( 10, 10 );
    this.makeGraphic( Globals.PLAYER_WIDTH, Globals.PLAYER_HEIGHT, 0xFF0000FF );

    this.running = false;
  }

  override public function update( ):Void {
    super.update( );
    this.handleEvents( );
    this.handleBounds( );
  }

  private function handleBounds( ):Void {
    if ( this.x < 0 ) this.x = 0;
    if ( this.x > Globals.WORLD_WIDTH - this.width ) this.x = Globals.WORLD_WIDTH - this.width;
    if ( this.y < 0 ) this.y = 0;
    if ( this.y > Globals.WORLD_HEIGHT - this.height ) this.y = Globals.WORLD_HEIGHT - this.height;
  }

  private function handleEvents( ):Void {
    var distCur:Float;

    // check reached
    if ( this.running ) {
      distCur = FlxVelocity.distanceToPoint( this, this.destPoint );
      if( distCur < 16 || this.distLast < distCur ) {
        this.running = false;
      }
      this.distLast = distCur;
    } else {
      this.velocity.x = 0;
      this.velocity.y = 0;
      this.acceleration.x = 0;
      this.acceleration.y = 0;
    }
  }

  public function calculateBallProximity( ):Void {
    var distToBall:Float = FlxVelocity.distanceBetween( this, Globals.BALL );
  }

  public function select( ):Void {
    this.color = 0xFFFF00FF;
    this.selected = true;
    this.makeGraphic( Globals.PLAYER_WIDTH, Globals.PLAYER_HEIGHT, 0xFFFF00FF );
  }

  public function unselect( ):Void {
    this.color = 0xFF0000FF;
    this.selected = false;
    this.makeGraphic( Globals.PLAYER_WIDTH, Globals.PLAYER_HEIGHT, 0xFF0000FF );
  }

  private function get_selected():Bool {
    return _selected;
  }

  private function set_selected(value:Bool):Bool {
    return _selected = value;
  }

  public var selected(get_selected, set_selected):Bool;


  public function runToPoint( ):Void {
    this.running = true;
    this.destPoint = FlxG.mouse.getWorldPosition( );
    FlxVelocity.accelerateTowardsPoint( this, destPoint, 200, 400, 400 );
    this.distLast = Globals.WORLD_WIDTH;
  }

  public function attackBall( ):Void {
    FlxVelocity.accelerateTowardsObject( this, Globals.BALL, 200, 400, 400 );
    this.running = true;
    this.destPoint = Globals.BALL.getMidpoint( );
    this.distLast = Globals.WORLD_WIDTH;
  }
}