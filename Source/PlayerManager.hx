package ;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxObject;
import org.flixel.FlxPoint;
import org.flixel.FlxSprite;
import org.flixel.plugin.photonstorm.FlxVelocity;

/**
 * ...
 * @author joekinley
 */

class PlayerManager {

  private var formation:Array<FlxPoint>;
  private var _players:FlxGroup;
  private var selectedPlayer:Player;

  public function new() {
    this.selectedPlayer = null;
    this.initializeTeam( );
  }

  private function initializeTeam( ):Void {
    var player:Player;
    var position:FlxPoint;
    var form:Array<FlxPoint> = FormationManager.getDefensiveFormation( );
    var i:Int = 0;

    this.players = new FlxGroup( );

    //for ( i = 0; i < Globals.PLAYER_COUNT; i++ ) {
    while( i < Globals.PLAYER_COUNT ) {
      player = new Player( );

      // set position
      position = form.shift( );
      player.x = position.x;
      player.y = position.y;

      this.players.add( player );
      i++;
    }
  }

  private function get_players():FlxGroup {
    return _players;
  }

  private function set_players(value:FlxGroup):FlxGroup {
    return _players = value;
  }

  public var players(get_players, set_players):FlxGroup;

  public function update( ):Void {

    this.handleEvents( );
  }

  private function handleEvents( ):Void {
    if ( FlxG.mouse.justReleased( ) ) {
      FlxG.overlap( new FlxSprite( FlxG.mouse.getWorldPosition( ).x, FlxG.mouse.getWorldPosition( ).y ), this.players, clickPlayer );
    }
  }

  private function clickPlayer( point:FlxObject, player:FlxObject ):Void {
    var pl:Player = cast player;
    this.unselectPlayers( );
    pl.select( );
    this.selectedPlayer = pl;
  }

  private function unselectPlayers( ):Void {
    var i:Int = 0;
    var player:Player = null;
    while ( i < this.players.length ) {
      player = cast this.players.members[ i ];
      player.unselect( );
      i++;
    }
    this.selectedPlayer = null;
  }

}