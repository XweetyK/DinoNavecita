package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;

class Enemy3 extends Enemy
{
	private var originalY:Float;
	private var unaVez:Bool;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.YEE3__png, true, 30, 30);
		animation.add("e3", [0, 1], 12, true);
		animation.play("e3");
		puntaje = 75;
		velocity.x = -10;
		velocidad = 30;
		unaVez = true;
	}
	override private function movimiento():Void
	{
		if (unaVez) 
		{
			originalY = this.y;
			unaVez = false;
		}
		if (velocity.y == 0) 
		{
			velocity.y = velocidad;
		}
		if (velocity.x == 0) 
		{
			velocity.x = velocidad;
		}
		if (this.y<= originalY - 30) 
		{
			velocity.y = velocidad;
		} else if (this.y >= originalY + 30) 
		{
			velocity.y = -velocidad;
		}
	}
}