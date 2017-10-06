package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

class Enemy2 extends Enemy
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset,_powerupRef:FlxTypedGroup<Powerup>) 
	{
		super(X, Y, SimpleGraphic,_powerupRef);
		loadGraphic(AssetPaths.YEE2__png, true, 32, 32);
		animation.add("e2", [0, 1], 10, true);
		animation.play("e2");
		puntaje = 50;
	}
	
}