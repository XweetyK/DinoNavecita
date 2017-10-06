package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;
import entities.Powerup;
/**
 * ...
 * @author Tomás Mugetti
 */
class Enemy extends FlxSprite
{

	private var powerupRef:FlxTypedGroup<Powerup>;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		FlxG.state.add(powerupRef);
	}
	
	
}