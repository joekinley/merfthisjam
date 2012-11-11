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
    if ( this.x > Globals.WORLD_WIDTH ) this.x = Globals.WORLD_WIDTH;
    if ( this.y < 0 ) this.y = 0;
    if ( this.y > Globals.WORLD_HEIGHT ) this.y = Globals.WORLD_HEIGHT;
  }

  private function handleEvents( ):Void {
    var distCur:Float;

    if ( FlxG.mouse.pressed( ) ) {
      this.running = true;
      this.destPoint = FlxG.mouse.getWorldPosition( );
      FlxVelocity.accelerateTowardsPoint( this, destPoint, 200, 400, 400 );
    }

    // check reached
    if ( this.running ) {
      distCur = FlxVelocity.distanceToPoint( this, this.destPoint );
      if( distCur < 16 || this.distLast < distCur ) {
        this.velocity.x = 0;
        this.velocity.y = 0;
        this.acceleration.x = 0;
        this.acceleration.y = 0;
        this.running = false;
      }
      this.distLast = distCur;
    }
  }

}