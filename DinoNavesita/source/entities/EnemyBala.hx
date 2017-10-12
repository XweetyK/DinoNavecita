package entities;

import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Reg;
import flixel.FlxG;

class EnemyBala extends FlxSprite 
{
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.enemyshot__png, true, 16, 16);
		animation.add("disp", [0, 1, 2], 12, true);
		animation.play("disp");
		
		velocity.x = -30;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	public function ebalaColision():Bool
	{
		if (this.x < FlxG.camera.scroll.x || this.y < FlxG.camera.scroll.y || this.x > FlxG.camera.scroll.x + FlxG.camera.width - this.width || this.y > FlxG.camera.scroll.y + FlxG.camera.height- this.height) 
		{
			return true;
		} else 
		{
			return false;
		}
	}
	
	
	
}