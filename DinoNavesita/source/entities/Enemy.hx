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

	private var r:FlxRandom;
	private var puntaje:Int;
	private var velocidad:Float;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (this.isOnScreen()) 
		{
			movimiento();
		}
	}
	
	private function movimiento():Void
	{
		
	}
	
	public function suValor():Int
	{
		return puntaje;
	}
	
	
}