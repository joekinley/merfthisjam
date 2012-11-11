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
  }

  private function handleEvents( ):Void {
    var distCur:Float;

    if ( FlxG.mouse.justPressed( ) ) {
      this.running = true;
      this.destPoint = FlxG.mouse.getWorldPosition( );
      FlxVelocity.accelerateTowardsMouse( this, 200, 400, 400 );
      //this.x = FlxG.mouse.x;
      //this.y = FlxG.mouse.y;
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