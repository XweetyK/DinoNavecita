package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

class Enemy2 extends FlxSprite
{
	private var powerupRef:FlxTypedGroup<Powerup>;
	private var r:FlxRandom;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset,_powerupRef:FlxTypedGroup<Powerup>) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.YEE2__png, true, 32, 32);
		animation.add("e2", [0, 1], 10, true);
		animation.play("e2");
		powerupRef = _powerupRef;
		FlxG.state.add(powerupRef);
		r = new FlxRandom();
	}
	public function morir():Void
	{
		var chance:Int = r.int( 0, 2);
		if (chance == 2) 
		{
			powerupRef.add(new Powerup(x, y));
		}
	}
	
}