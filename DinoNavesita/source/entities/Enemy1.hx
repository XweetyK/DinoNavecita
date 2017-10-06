package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

class Enemy1 extends Enemy
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.YEE__png, true, 32, 32);
		animation.add("e1", [0, 1], 12, true);
		animation.play("e1");
		puntaje = 25;
		velocity.x =-5;
	}
}