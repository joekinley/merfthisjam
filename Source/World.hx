package ;
import org.flixel.FlxSprite;

/**
 * ...
 * @author joekinley
 */

class World extends FlxSprite {

  public function new() {
    super( 0, 0 );
    this.makeGraphic( Globals.WORLD_WIDTH, Globals.WORLD_HEIGHT, 0xFFD1580D );
  }

}