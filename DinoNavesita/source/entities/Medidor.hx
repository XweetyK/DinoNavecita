package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.text.FlxText;
/**
 * ...
 * @author Tomás Mugetti
 */
class Medidor extends FlxSprite
{

	public function new() 
	{
		super();
		loadGraphic(AssetPaths.power0__png, true, 344, 32);
		scale.set(0.5, 0.5);
		y = FlxG.camera.height - this.height+4;
		x = FlxG.camera.scroll.x - this.width / 8;
		scrollFactor.x = 0;
	}
	override public function update(elapsed:Float):Void
	{
		//	x = FlxG.camera.scroll.x - this.width/8;
	}
	public function contar(poder:Int):Void
	{
		switch (poder) 
		{
			case 0:
				loadGraphic(AssetPaths.power0__png, true, 344, 32);
			case 1:
				loadGraphic(AssetPaths.power1__png, true, 344, 32);
			case 2:
				loadGraphic(AssetPaths.power2__png, true, 344, 32);
			case 3:
				loadGraphic(AssetPaths.power3__png, true, 344, 32);
			case 4:
				loadGraphic(AssetPaths.power4__png, true, 344, 32);
			default:
				
		}
	}
}