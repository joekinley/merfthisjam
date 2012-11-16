package ;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxSprite;

/**
 * ...
 * @author joekinley
 */

class HUD {

  private var layer_hud:FlxGroup;

  public function new() {
    this.layer_hud = new FlxGroup( );
    this.initialize( );
  }

  private function initialize( ):Void {
    // initialize buttons
    this.layer_hud.add( new Button( Globals.BUTTON_TIME_PAUSE ) );
    this.layer_hud.add( new Button( Globals.BUTTON_TIME_SLOW ) );
    this.layer_hud.add( new Button( Globals.BUTTON_TIME_NORMAL ) );
    this.layer_hud.add( new Button( Globals.BUTTON_OVERVIEW ) );
  }

  public function update( ):Void {
    this.handleClick( );
  }

  private function handleClick( ):Void {
    if( FlxG.mouse.justPressed( ) ) {
      FlxG.overlap( new FlxSprite( FlxG.mouse.getScreenPosition( ).x, FlxG.mouse.getScreenPosition( ).y ), this.layer_hud, this.buttonClick );
    }
  }

  private function buttonClick( pos:FlxObject, btn:FlxObject ):Void {
    var button:Button = cast btn;
    switch( button.type ) {
      case Globals.BUTTON_TIME_PAUSE:
        FlxG.timeScale = 0;

      case Globals.BUTTON_TIME_SLOW:
        FlxG.timeScale = 0.3;

      case Globals.BUTTON_TIME_NORMAL:
        FlxG.timeScale = 1;

      case Globals.BUTTON_OVERVIEW:
        Globals.STATE_GAME.toggleOverview( );
    }
  }

  private function get_layer():FlxGroup {
    return layer_hud;
  }

  private function set_layer(value:FlxGroup):FlxGroup {
    return layer_hud = value;
  }

  public var layer(get_layer, set_layer):FlxGroup;

}