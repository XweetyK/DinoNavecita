package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

class Enemy3 extends Enemy
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.YEE3__png, true, 30, 30);
		animation.add("e3", [0, 1], 12, true);
		animation.play("e3");
		puntaje = 75;
	}
	
}