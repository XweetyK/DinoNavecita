package source.entities;

import cpp.Void;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Reg;
/**
 * ...
 * @author ChikoritasTeam
 */
class Player extends FlxSprite
{
	private var misil:Bool;
	private var escudo:Bool;
	private var boost:Bool;
	private var vidas:Int;
	private var velocidad:Int;
	
	public function new(?X:Float=0, ?Y:Float=0,?simpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, simpleGraphic);
		//loadGraphic();
		//animation.add();
		//animation.play();
		vidas = 3;
		misil = false;
		escudo = false;
		boost = false;
		velocidad = Reg.velocidadCamara;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		velocity.set(velocidad, 0);
		movimiento();
	}
	
	public function tieneMisil():Bool
	{
		return misil;
	}
	public function tieneBoost():Bool
	{
		return boost;
	}
	public function tieneEscudo():Bool
	{
		return escudo;
	}
	public function pierdeEscudo():Void
	{
		if (escudo) 
		{
			escudo = false;
		}
	}
	private function movimiento():Void
	{
		if (FlxG.keys.pressed.RIGHT) 
			velocity.x += velocidad;
		if (FlxG.keys.pressed.LEFT) 
			velocity.x -= velocidad;
		if (FlxG.keys.pressed.DOWN) 
			velocity.y += velocidad;
		if (FlxG.keys.pressed.UP) 
			velocity.y -= velocidad;
		OOB();
	}
	
	private function OOB():Void
	{
		if (this.x < 0) 
			this.x = 0;
		if (this.y < 0)
			this.y = 0;
		if (this.x > FlxG.width)
			this.x = FlxG.width;
		if (this.y > FlxG.height)
			this.y = FlxG.height;
	}
}