package ;
import org.flixel.FlxPoint;

/**
 * ...
 * @author joekinley
 */

class FormationManager {

  public function new() {

  }

  public static function getDefensiveFormation( ):Array<FlxPoint> {
    var forms:Array<FlxPoint> = new Array<FlxPoint>( );

    // keeper
    forms.push( new FlxPoint( Globals.FIELD_WIDTH / 2 + Globals.FIELD_OFFSET, Globals.FIELD_OFFSET ) );
    // 2 in first line
    forms.push( new FlxPoint( Globals.FIELD_WIDTH / 2 - 2.5 * Globals.PLAYER_WIDTH, Globals.FIELD_OFFSET + Globals.PLAYER_WIDTH / 2 ) );
    forms.push( new FlxPoint( Globals.FIELD_WIDTH / 2 + 2.5 * Globals.PLAYER_WIDTH, Globals.FIELD_OFFSET + Globals.PLAYER_WIDTH / 2 ) );
    // 2 in second line
    forms.push( new FlxPoint( Globals.FIELD_WIDTH / 2 - 2.5 * Globals.PLAYER_WIDTH, Globals.FIELD_OFFSET + Globals.PLAYER_WIDTH * 2.5 ) );
    forms.push( new FlxPoint( Globals.FIELD_WIDTH / 2 + 2.5 * Globals.PLAYER_WIDTH, Globals.FIELD_OFFSET + Globals.PLAYER_WIDTH * 2.5 ) );
    return forms;
  }

}