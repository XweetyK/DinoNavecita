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
	private var r:FlxRandom;
	private var puntaje:Int;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset,_powerupRef:FlxTypedGroup<Powerup>) 
	{
		super(X, Y, SimpleGraphic);
		FlxG.state.add(powerupRef);
	}
	public function morir():Void
	{
		var chance:Int = r.int( 0, 2);
		if (chance == 2) 
		{
			powerupRef.add(new Powerup(x, y));
		}
	}
	public function suValor():Int
	{
		return puntaje;
	}
	
	
}