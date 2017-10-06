package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

class Enemy2 extends Enemy
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.YEE2__png, true, 32, 32);
		animation.add("e2", [0, 1], 10, true);
		animation.play("e2");
		puntaje = 50;
		velocity.x = 0;
	}
	
}