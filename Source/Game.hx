package;

import org.flixel.FlxGame;

class Game extends FlxGame
{
	public function new()
	{
		super( Globals.GAME_WIDTH, Globals.GAME_HEIGHT, GameState, Globals.GAME_SCALE );
	}
}