package ;
import org.flixel.FlxSprite;

/**
 * ...
 * @author joekinley
 */

class Field extends FlxSprite {

  public function new() {
    super( 64, 64 );
    this.makeGraphic( Globals.FIELD_WIDTH, Globals.FIELD_HEIGHT, 0xFF00FF00 );
  }

}