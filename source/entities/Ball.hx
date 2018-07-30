package source.entities;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxPoint;
import flixel.FlxG;

class Ball extends FlxSprite
{
    private var minVelocity:Float = 50;

    private var bWidth:Int;
    private var bHeight:Int;

    public function new(xco:Float = 0, yco:Float = 0, bWidth:Int = 8, bHeight:Int = 8)
    {
        super(xco - (bWidth / 2), yco - (bHeight / 2));

        this.bWidth = bWidth;
        this.bHeight = bHeight;

        var xDir = Std.random(2) == 1 ? 1 : -1;
        var yDir = Std.random(2) == 1 ? 1 : -1;

        this.velocity = FlxPoint.get(
            this.minVelocity * xDir,
            this.minVelocity * yDir
        );

        this.drag = FlxPoint.get(0, 0);
        this.elasticity = 1.0;

        this.makeGraphic(this.bWidth, this.bHeight, FlxColor.WHITE);
    }

    override public function update(elapsed:Float):Void
    {
        super.update(elapsed);
    }
}