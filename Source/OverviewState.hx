package ;
import org.flixel.FlxG;
import org.flixel.FlxGroup;
import org.flixel.FlxPoint;
import org.flixel.FlxSprite;

/**
 * ...
 * @author joekinley
 */

class OverviewState {

  private var _activated:Bool;
  private var layer_overview:FlxGroup;
  private var brownField:FlxSprite;
  private var greenField:FlxSprite;
  private var playerMarker:FlxSprite;

  private var scaleX:Float;
  private var scaleY:Float;

  public function new() {
    this.activated = false;
    this.layer_overview = new FlxGroup( );
    this.initialize( );
  }

  public function initialize( ):Void {
    // calculate scale
    scaleX = Globals.GAME_WIDTH / Globals.WORLD_WIDTH;
    scaleY = Globals.GAME_HEIGHT / Globals.WORLD_HEIGHT;
    // brown field
    this.brownField = new FlxSprite( 0, 0 );
    this.brownField.makeGraphic( Math.floor( Globals.WORLD_WIDTH * scaleX ), Math.floor( Globals.WORLD_HEIGHT * scaleY ), 0xFFD1580D );
    this.brownField.scrollFactor.x = 0;
    this.brownField.scrollFactor.y = 0;
    this.layer_overview.add( this.brownField );

    // green field
    this.greenField = new FlxSprite( Globals.FIELD_OFFSET * scaleX, Globals.FIELD_OFFSET * scaleY );
    this.greenField.makeGraphic( Math.floor( Globals.FIELD_WIDTH * scaleX ), Math.floor( Globals.FIELD_HEIGHT * scaleY ), 0xFF00FF00 );
    this.greenField.scrollFactor.x = 0;
    this.greenField.scrollFactor.y = 0;
    this.layer_overview.add( this.greenField );

    // player marker
    this.playerMarker = new FlxSprite( 0, 0 );
    this.playerMarker.makeGraphic( 5, 5, 0xFFFF0000 );
    //this.layer_overview.add( this.playerMarker );
  }

  public function update( ):Void {
    // handle key events

    // draw
    this.draw( );
  }

  private function draw( ):Void {
    var player:Player;
    var point:FlxPoint;
    this.greenField.fill( 0xFF00FF00 );
    for ( pl in Globals.PLAYER_MANAGER.players.members ) {
      player = cast pl;
      point = player.getMidpoint( );
      this.greenField.stamp( this.playerMarker, Math.round( point.x * scaleX ), Math.round( point.y * scaleY ) );
    }
  }

  private function handleEvents( ):Void {

  }

  private function get_layer():FlxGroup {
    return layer_overview;
  }

  private function set_layer(value:FlxGroup):FlxGroup {
    return layer_overview = value;
  }

  public var layer(get_layer, set_layer):FlxGroup;

  private function get_activated():Bool {
    return _activated;
  }

  private function set_activated(value:Bool):Bool {
    return _activated = value;
  }

  public var activated(get_activated, set_activated):Bool;

  public function activate( ):Void {
    this.activated = true;
  }

  public function deactivate( ):Void {
    this.activated = false;
  }

}