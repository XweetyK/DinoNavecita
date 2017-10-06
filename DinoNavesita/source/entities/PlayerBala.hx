package entities;

import flixel.FlxSprite;
import flixel.math.FlxRandom;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Reg;
import flixel.FlxG;
/**
 * ...
 * @author ...
 */
class PlayerBala extends FlxSprite 
{

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, detenido:Bool) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.dinoshot__png, true, 16, 16);
		animation.add("Brillo", [0, 1, 2], 12, true);
		animation.play("Brillo");
		if (detenido) 
		{
			velocity.x = Reg.velocidadBalaX;
		} else 
		{
			velocity.x = Reg.velocidadCamara + Reg.velocidadBalaX;
		}
		var r:FlxRandom = new FlxRandom();
		velocity.y = r.float( -Reg.fireInacuraccy, Reg.fireInacuraccy);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		BalaColision();
	}
	
	public function BalaColision():Void
	{
		if (this.x < FlxG.camera.scroll.x || this.y < FlxG.camera.scroll.y || this.x > FlxG.camera.scroll.x + FlxG.camera.width - this.width || this.y > FlxG.camera.scroll.y + FlxG.camera.height- this.height) 
		{
			this.destroy();
		}
	}
	
	
	
}