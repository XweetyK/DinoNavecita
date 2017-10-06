package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

class Enemy3 extends Enemy
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset,_powerupRef:FlxTypedGroup<Powerup>) 
	{
		super(X, Y, SimpleGraphic,_powerupRef);
		loadGraphic(AssetPaths.YEE3__png, true, 32, 32);
		animation.add("e3", [0, 1], 12, true);
		animation.play("e3");
	}
	
}