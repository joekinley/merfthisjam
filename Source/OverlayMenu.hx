package ;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxSprite;

/**
 * ...
 * @author joekinley
 */

class OverlayMenu {

  private var _hasOverlayShade:Bool;
  private var overlay:FlxSprite;
  private var _display:FlxGroup;
  private var buttons:FlxGroup;

  public function new() {
    this.hasOverlayShade = false;
    this.display = new FlxGroup( );
    // initialize overlay shade
    this.overlay = new FlxSprite( 0, 0 );
    this.overlay.makeGraphic( Globals.GAME_WIDTH, Globals.GAME_HEIGHT, 0xAA333333 );
    this.overlay.scrollFactor.x = 0;
    this.overlay.scrollFactor.y = 0;

    // initialize buttons
    this.buttons = new FlxGroup( );
    this.buttons.add( new Button( Globals.BUTTON_ATTACK_BALL ) );
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
    this.display.add( this.buttons );
    this.hasOverlayShade = true;
  }

  public function deactivateOverlay( ):Void {
    this.display.remove( this.overlay );
    this.display.remove( this.buttons );
    this.hasOverlayShade = false;
    Globals.PLAYER_MANAGER.unselectPlayers( );
  }

  public function toggleOverlay( ):Void {
    if ( this.hasOverlayShade ) this.deactivateOverlay( );
    else this.activateOverlay( );
  }

  /**
   * UPDATE FUNCTION
   */
  public function update( ):Void {
    if ( this.hasOverlayShade ) {
      this.handleEvents( );
    }
  }

  private function handleEvents( ):Void {
    if ( FlxG.mouse.justReleased( ) ) {
      if ( !FlxG.overlap( new FlxSprite( FlxG.mouse.getScreenPosition( ).x, FlxG.mouse.getScreenPosition( ).y ), this.buttons, buttonClick ) ) {
        Globals.PLAYER_MANAGER.clickAction( Globals.BUTTON_NONE );
      }
      this.deactivateOverlay( );
    }
  }

  private function buttonClick( point:FlxObject, button:FlxObject ):Void {
    trace( 'BUTTON CLICK' );
    var btn:Button = cast button;
    Globals.PLAYER_MANAGER.clickAction( btn.type );
    this.deactivateOverlay( );
  }

}