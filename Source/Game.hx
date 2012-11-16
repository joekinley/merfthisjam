package;

import org.flixel.FlxGame;
#if flash
import org.flashdevelop.utils.FlashConnect;
#end

class Game extends FlxGame
{
	public function new()
	{
    #if flash
    FlashConnect.redirect();
    #end
		super( Globals.GAME_WIDTH, Globals.GAME_HEIGHT, MenuState, Globals.GAME_SCALE );
	}
}