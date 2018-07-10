package source.entities;

import flixel.FlxSprite;
import flixel.util.FlxSpriteUtil;
import flixel.util.FlxColor;
import flixel.FlxG;

class Paddle extends FlxSprite
{
    private var speed:Float = 600;

    private var pWidth:Int;
    private var pHeight:Int;

    public function new(xco:Float = 0, yco:Float = 0, pWidth:Int = 8, pHeight:Int = 40)
    {
        super(xco - (pWidth / 2), yco - (pHeight / 2));

        this.drag.set(0, this.speed * 5);
        this.maxVelocity.set(0, this.speed);

        this.pWidth = pWidth;
        this.pHeight = pHeight;
        this.makeGraphic(this.pWidth, this.pHeight, FlxColor.WHITE);
    }

    override public function update(elapsed:Float):Void
    {
        movementAction();
        super.update(elapsed);
    }

    private function movementAction():Void
    {
        var up:Bool = false;
        var down:Bool = false;

        up = FlxG.keys.anyPressed(['UP']);
        down = FlxG.keys.anyPressed(['DOWN']);

        this.acceleration.y = 0;

        if (up) this.acceleration.y = this.drag.y;
        else if (down) this.acceleration.y = -this.drag.y;

        if (up && down) {
            up = false;
            down = false;
        }
    }
}