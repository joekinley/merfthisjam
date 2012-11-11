package ;
import org.flixel.FlxSprite;

/**
 * ...
 * @author joekinley
 */

class Ball extends FlxSprite {

  public function new() {
    super( 120, 120 );
    this.makeGraphic( Globals.BALL_WIDTH, Globals.BALL_HEIGHT, 0xFFFF0000 );
  }

  override public function update( ):Void {
    if ( this.x < 0 || this.x > Globals.WORLD_WIDTH ) {
      this.velocity.x = -this.velocity.x;
      this.acceleration.x = -this.acceleration.x;
    }
    if ( this.y < 0 || this.y > Globals.WORLD_HEIGHT ) {
      this.velocity.y = -this.velocity.y;
      this.acceleration.y = -this.acceleration.y;
    }
  }

}