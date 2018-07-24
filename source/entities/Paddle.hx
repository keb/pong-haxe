package source.entities;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.input.keyboard.FlxKey;
import flixel.FlxG;

class Paddle extends FlxSprite
{
    private var minVelocity:Float = 200;
    private var controls:Map<String, Array<FlxKey>>;

    private var pWidth:Int;
    private var pHeight:Int;

    public function new(xco:Float = 0, yco:Float = 0, playerNo:Int, pWidth:Int = 8, pHeight:Int = 40)
    {
        super(xco - (pWidth / 2), yco - (pHeight / 2));
        this.pWidth = pWidth;
        this.pHeight = pHeight;

        if (playerNo == 1)
            this.controls = ['up' => [FlxKey.W], 'down' => [FlxKey.S], 'boost' => [FlxKey.B]];
        else if (playerNo == 2)
            this.controls = ['up' => [FlxKey.UP], 'down' => [FlxKey.DOWN], 'boost' => [FlxKey.SLASH]];

        // this.immovable = true;
        this.makeGraphic(this.pWidth, this.pHeight, FlxColor.WHITE);
    }

    override public function update(elapsed:Float):Void
    {
        movementAction();
        boostAbility();
        super.update(elapsed);
    }

    private function movementAction():Void
    {
        var up:Bool = false;
        var down:Bool = false;

        up = FlxG.keys.anyPressed(this.controls['up']);
        down = FlxG.keys.anyPressed(this.controls['down']);

        if (up) {
            this.velocity.y = -this.minVelocity;
        } else if (down) {
            this.velocity.y = this.minVelocity;
        }

        if ((up && down) || (!up && !down)) {
            this.velocity.y = 0;
            this.acceleration.y = 0;
        }
    }

    private function boostAbility():Void
    {
        var boost:Bool = false;
        boost = FlxG.keys.anyPressed(this.controls['boost']);

        if (boost) this.velocity.y *= 1.5;
    }
}