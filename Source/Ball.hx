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

}