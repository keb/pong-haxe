package source;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxCamera;
import flixel.util.FlxCollision;
import flixel.group.FlxGroup;

import source.entities.Paddle;
import source.entities.Ball;

class PlayState extends FlxState
{
	private var playerOne:Paddle;
	private var playerTwo:Paddle;

	private var ball:Ball;
	private var cameraWalls:FlxGroup;

	override public function create():Void
	{
		playerOne = new Paddle(FlxG.width / 6, FlxG.height / 2, 1);
		add(playerOne);

		// playerTwo = new Paddle((FlxG.width * 7) / 8, FlxG.height / 2, 2);
		// add(playerTwo);

		ball = new Ball(FlxG.width / 2, FlxG.height / 2);
		add(ball);

		cameraWalls = FlxCollision.createCameraWall(camera, true, 1);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(cameraWalls, playerOne);
		// FlxG.collide(cameraWalls, playerTwo);
		FlxG.collide(cameraWalls, ball);
		FlxG.collide(ball, playerOne);
		// FlxG.collide(ball, playerTwo);
	}
}
