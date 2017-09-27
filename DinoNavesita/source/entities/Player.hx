package entities;

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
		velocity.x = velocidad;
		if (velocity.y > 25)
		velocity.y -= 25;
		else
		velocity.y = 0;
		if (FlxG.keys.pressed.RIGHT) 
			velocity.x += Reg.velocidadX;
		if (FlxG.keys.pressed.LEFT) 
			velocity.x -= Reg.velocidadX;
		if (FlxG.keys.pressed.DOWN) 
			velocity.y = Reg.velocidadY;
		if (FlxG.keys.pressed.UP) 
			velocity.y = -Reg.velocidadY;
		OOB();
	}
	
	private function OOB():Void
	{
		if (this.x < FlxG.camera.scroll.x) 
			this.x = FlxG.camera.scroll.x;
		if (this.y < FlxG.camera.scroll.y)
			this.y = FlxG.camera.scroll.y;
		if (this.x > FlxG.camera.scroll.x + FlxG.camera.width - this.width)
			this.x = FlxG.camera.scroll.x + FlxG.camera.width - this.width;
		if (this.y > FlxG.camera.scroll.y + FlxG.camera.height- this.height)
			this.y = FlxG.camera.scroll.y + FlxG.camera.height - this.height;
	}
}