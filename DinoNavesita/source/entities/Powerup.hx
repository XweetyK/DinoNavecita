package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
/**
 * ...
 * @author Tomás Mugetti
 */
class Powerup extends FlxSprite
{

	public function new(X:Float, Y:Float) 
	{
		super(X,Y);
		loadGraphic(AssetPaths.FRUTITA__png, true, 32, 32);
		animation.add("flotar", [0, 1, 2, 3, 4], 12, true);
		animation.play("flotar");
	}
	
}