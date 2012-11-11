package ;
import org.flixel.plugin.photonstorm.FlxCollision;

/**
 * ...
 * @author joekinley
 */

class Globals {

  public static inline var GAME_WIDTH:Int = 640;
  public static inline var GAME_HEIGHT:Int = 480;
  public static inline var GAME_SCALE:Int = 1;

  public static inline var PLAYER_WIDTH:Int = 64;
  public static inline var PLAYER_HEIGHT:Int = 64;
  public static var PLAYER:Player = null;

  public static inline var BALL_WIDTH:Int = 15;
  public static inline var BALL_HEIGHT:Int = 15;
  public static var BALL:Ball = null;

  public static inline var WORLD_WIDTH:Int = 768;
  public static inline var WORLD_HEIGHT:Int = 1088;
  public static var WORLD:World = null;

  public static inline var FIELD_WIDTH:Int = 640;
  public static inline var FIELD_HEIGHT:Int = 960;
  public static var FIELD:Field = null;

  public function new() {

  }

}