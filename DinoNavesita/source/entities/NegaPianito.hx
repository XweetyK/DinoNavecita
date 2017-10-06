package entities;
import flixel.FlxBasic.FlxType;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;
/**
 * ...
 * @author Tomás Mugetti
 */
class NegaPianito extends FlxSprite
{
	private var activo:Bool;
	private var r:FlxRandom;
	public function new(X:Float, Y:Float) 
	{
		super(X, Y);
		activo = false;
		r = new FlxRandom();
	}
	public function activar():Void
	{
		if (x <= FlxG.camera.scroll.x + FlxG.camera.width - 30) 
		{
			activo = true;
		}
		
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movimiento();
	}
	
	private function movimiento():Void
	{
		if (activo) 
		{
			velocity.x = 0;
			var randomY:Float = r.float(0, (FlxG.camera.height - this.height));
			if (y > randomY) 
			{
				velocity.y = -Reg.velocidadY;
			} else if 
			{
				velocity.y = Reg.velocidadY;
			}
		} else 
		{
			velocity.x = -10;
		}
	}
}