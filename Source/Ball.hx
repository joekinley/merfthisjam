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
    this.elasticity = 1;
  }

  override public function update( ):Void {
    trace( this.velocity.x + ' ' + this.velocity.y + ' ' + this.acceleration.x + ' ' + this.acceleration.y );
    super.update( );

    this.handleBorders( );
    this.handleDeceleration( );
  }

  private function handleBorders( ):Void {
    if ( this.x < 0 || this.x > Globals.WORLD_WIDTH ) {
      this.velocity.x = -this.velocity.x;
      this.acceleration.x = -this.acceleration.x;
    }
    if ( this.y < 0 || this.y > Globals.WORLD_HEIGHT ) {
      this.velocity.y = -this.velocity.y;
      this.acceleration.y = -this.acceleration.y;
    }
  }

  private function handleDeceleration( ):Void {
    // x velocity deceleration
    if ( this.velocity.x > 0 ) {
      this.velocity.x -= Globals.BALL_DECELERATION;
      // if we changed direction, we better nullify it
      if ( this.velocity.x < 0 ) this.velocity.x = 0;
    } else if ( this.velocity.x < 0 ) {
      this.velocity.x += Globals.BALL_DECELERATION;
      // if we changed direction, we better nullify it
      if ( this.velocity.x > 0 ) this.velocity.x = 0;
    }
    // y velocity deceleration
    if ( this.velocity.y > 0 ) {
      this.velocity.y -= Globals.BALL_DECELERATION;
      // if we changed direction, we better nullify it
      if ( this.velocity.y < 0 ) this.velocity.y = 0;
    } else if ( this.velocity.y < 0 ) {
      this.velocity.y += Globals.BALL_DECELERATION;
      // if we changed direction, we better nullify it
      if ( this.velocity.y > 0 ) this.velocity.y = 0;
    }
  }

}