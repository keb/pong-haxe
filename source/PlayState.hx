package source;

import flixel.FlxState;
import flixel.FlxG;
import flixel.FlxCamera;
import flixel.util.FlxCollision;
import flixel.group.FlxGroup;
import flixel.FlxSprite;
import flixel.util.FlxColor;

import source.entities.Paddle;
import source.entities.Ball;

class PlayState extends FlxState
{
	private var playerOne:Paddle;
	private var playerTwo:Paddle;

	private var ball:Ball;
	private var cameraWalls:FlxGroup;

	private var topWall:FlxSprite;
	private var bottomWall:FlxSprite;

	override public function create():Void
	{
		topWall = new FlxSprite(0, -2);
		topWall.makeGraphic(FlxG.width, 2, FlxColor.WHITE);
		topWall.moves = false;
		topWall.immovable = true;
		add(topWall);

		bottomWall = new FlxSprite(0, FlxG.height);
		bottomWall.makeGraphic(FlxG.width, 2, FlxColor.WHITE);
		bottomWall.moves = false;
		bottomWall.immovable = true;
		add(bottomWall);

		playerOne = new Paddle(FlxG.width / 6, FlxG.height / 2, 1);
		add(playerOne);

		// playerTwo = new Paddle((FlxG.width * 7) / 8, FlxG.height / 2, 2);
		// add(playerTwo);

		ball = new Ball(FlxG.width / 2, FlxG.height / 2);
		// ball = new Ball(FlxG.width / 6, 4);
		add(ball);

		// cameraWalls = FlxCollision.createCameraWall(camera, true, 1, true);

		super.create();
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);

		FlxG.collide(ball, topWall);
		FlxG.collide(ball, bottomWall);
		FlxG.collide(ball, playerOne);

		FlxG.collide(playerOne, topWall);
		FlxG.collide(playerOne, bottomWall);

		if (FlxG.keys.pressed.R) FlxG.resetState();
	}
}
