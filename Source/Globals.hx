package ;
import org.flixel.FlxGroup;
import org.flixel.plugin.photonstorm.FlxCollision;

/**
 * ...
 * @author joekinley
 */

class Globals {

  public static var STATE_GAME:GameState = null;
  public static var STATE_OVERVIEW:OverviewState = null;

  public static inline var GAME_WIDTH:Int = 640;
  public static inline var GAME_HEIGHT:Int = 480;
  public static inline var GAME_SCALE:Float = 1;

  public static var GAME_PAUSE:Bool = false;

  public static var CAMERA_SPEED:Float = 20.0;

  //public static var LAYER_PLAYER:FlxGroup = null;

  public static var PLAYER_MANAGER:PlayerManager = null;

  public static inline var PLAYER_COUNT:Int = 5; // amount of players in a team
  public static inline var PLAYER_WIDTH:Int = 64;
  public static inline var PLAYER_HEIGHT:Int = 64;
  //public static var PLAYER:Player = null;

  public static inline var BUTTON_NONE:Int = 0;
  public static inline var BUTTON_ATTACK_BALL:Int = 1;
  public static inline var BUTTON_TIME_PAUSE:Int = 2;
  public static inline var BUTTON_TIME_SLOW:Int = 3;
  public static inline var BUTTON_TIME_NORMAL:Int = 4;
  public static inline var BUTTON_GOTO:Int = 5;
  public static inline var BUTTON_OVERVIEW:Int = 6;

  public static inline var BALL_WIDTH:Int = 15;
  public static inline var BALL_HEIGHT:Int = 15;
  public static inline var BALL_DECELERATION:Float = 0.6;
  public static var BALL:Ball = null;

  public static inline var WORLD_WIDTH:Int = 768;
  public static inline var WORLD_HEIGHT:Int = 1088;
  public static var WORLD:World = null;

  public static inline var FIELD_WIDTH:Int = 640;
  public static inline var FIELD_HEIGHT:Int = 960;
  public static inline var FIELD_OFFSET:Int = 64;
  public static var FIELD:Field = null;

  public function new() {

  }

}