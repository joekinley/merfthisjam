package ;
import org.flixel.FlxGroup;
import org.flixel.FlxSprite;

/**
 * ...
 * @author joekinley
 */

class OverlayMenu {

  private var _hasOverlayShade:Bool;
  private var overlay:FlxSprite;
  private var _display:FlxGroup;

  public function new() {
    this.hasOverlayShade = false;
    this.display = new FlxGroup( );
    // initialize overlay shade
    this.overlay = new FlxSprite( 0, 0 );
    this.overlay.makeGraphic( Globals.GAME_WIDTH, Globals.GAME_HEIGHT, 0xAA333333 );
  }

  private function get_display():FlxGroup {
    return _display;
  }

  private function set_display(value:FlxGroup):FlxGroup {
    return _display = value;
  }

  public var display(get_display, set_display):FlxGroup;

  private function get_hasOverlayShade():Bool {
    return _hasOverlayShade;
  }

  private function set_hasOverlayShade(value:Bool):Bool {
    return _hasOverlayShade = value;
  }

  public var hasOverlayShade(get_hasOverlayShade, set_hasOverlayShade):Bool;

  public function activateOverlay( ):Void {
    this.display.add( this.overlay );
    this.hasOverlayShade = true;
  }

  public function deactivateOverlay( ):Void {
    this.display.remove( this.overlay );
    this.hasOverlayShade = false;
  }

  public function toggleOverlay( ):Void {
    if ( this.hasOverlayShade ) this.deactivateOverlay( );
    else this.activateOverlay( );
  }

}