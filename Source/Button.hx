package ;
import org.flixel.FlxSprite;

/**
 * ...
 * @author joekinley
 */

class Button extends FlxSprite {

  private var _type:Int;

  public function new( type:Int ) {
    super( 0, 0 );
    this.initializeType( type );
  }

  private function get_type():Int {
    return _type;
  }

  private function set_type(value:Int):Int {
    return _type = value;
  }

  public var type(get_type, set_type):Int;

  private function initializeType( type:Int ):Void {
    var posX:Int = 0, posY:Int = 0;
    this.type = type;
    this.scrollFactor.x = 0;
    this.scrollFactor.y = 0;

    switch( type ) {
      case Globals.BUTTON_NONE:
        return;

      case Globals.BUTTON_ATTACK_BALL:
        this.makeGraphic( 64, 64, 0xFFCCCCCC );
        this.x = 128;
        this.y = 128;

      case Globals.BUTTON_TIME_PAUSE:
        this.makeGraphic( 64, 64, 0xFFCCCCCC );
        this.y = Globals.GAME_HEIGHT - 64;
        this.x = Globals.GAME_WIDTH - 3 * ( 64 + 5 );

      case Globals.BUTTON_TIME_SLOW:
        this.makeGraphic( 64, 64, 0xFFCCCCCC );
        this.y = Globals.GAME_HEIGHT - 64;
        this.x = Globals.GAME_WIDTH - 2 * ( 64 + 5 );

      case Globals.BUTTON_TIME_NORMAL:
        this.makeGraphic( 64, 64, 0xFFCCCCCC );
        this.y = Globals.GAME_HEIGHT - 64;
        this.x = Globals.GAME_WIDTH - 1 * ( 64 + 5 );

      case Globals.BUTTON_GOTO:
        this.makeGraphic( 64, 64, 0xFFCCCCCC );
        this.x = 128 + 65 + 5;
        this.y = 128;

      case Globals.BUTTON_OVERVIEW:
        this.makeGraphic( 64, 64, 0xFFCCCCCC );
        this.y = Globals.GAME_HEIGHT - 64;
        this.x = Globals.GAME_WIDTH - 4 * ( 64 + 5 );
    }
  }

}