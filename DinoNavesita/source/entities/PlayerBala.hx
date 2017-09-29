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

	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.dinoshot__png, true, 16, 16);
		animation.add("Brillo", [0, 1, 2], 12, true);
		animation.play("Brillo");
		velocity.x = Reg.velocidadCamara + Reg.velocidadBalaX;
		
		var r:FlxRandom = new FlxRandom();
		velocity.y = r.float( -40, 40);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
	}
	
	public function BalaColision():Bool
	{
	if (this.x < FlxG.camera.scroll.x || this.y < FlxG.camera.scroll.y || this.x > FlxG.camera.scroll.x + FlxG.camera.width - this.width || this.y > FlxG.camera.scroll.y + FlxG.camera.height- this.height) 
	{
		return true;
	}
	else
	{
		return false;
	}
	
	}
	
}