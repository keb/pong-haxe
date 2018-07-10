package source;

import flixel.FlxState;
import flixel.FlxG;

import source.entities.Paddle;

class PlayState extends FlxState
{
	private var playerOne:Paddle;
	private var playerTwo:Paddle;

	override public function create():Void
	{
		playerOne = new Paddle(FlxG.width / 6, FlxG.height / 2);
		// playerTwo = new Paddle((FlxG.width * 5) / 6, FlxG.height / 2);
		add(playerOne);
		// add(playerTwo);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
