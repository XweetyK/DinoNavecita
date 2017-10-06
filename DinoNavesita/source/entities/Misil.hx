package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Reg;
import flixel.FlxG;


class Misil extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, detenido:Bool) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.dinoshot__png, true, 16, 16);
		this.angle = 270;
		animation.add("Brillo", [0, 1, 2], 12, true);
		animation.play("Brillo");
		velocity.y = 30;
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		MisilColision();
	}
	
	public function MisilColision():Void
	{
		if (this.x < FlxG.camera.scroll.x || this.y < FlxG.camera.scroll.y || this.x > FlxG.camera.scroll.x + FlxG.camera.width - this.width || this.y > FlxG.camera.scroll.y + FlxG.camera.height- this.height) 
		{
			this.destroy();
		}
	}
}