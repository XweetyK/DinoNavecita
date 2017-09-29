package entities;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Reg;
import entities.PlayerBala;
import flixel.group.FlxGroup.FlxTypedGroup;
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
	private var velocidadMin:Int;
	private var b:PlayerBala;
	private var intervalo:Float;
	var balasRef:FlxTypedGroup<PlayerBala>;
	
	public function new(?X:Float=0, ?Y:Float=0,?simpleGraphic:FlxGraphicAsset,balas:FlxTypedGroup<PlayerBala>) 
	{
		super(X, Y, simpleGraphic);
		//loadGraphic();
		//animation.add();
		//animation.play();
		vidas = 3;
		misil = false;
		escudo = false;
		boost = false;
		balasRef = balas;
		intervalo = 0;
		//Reemplaza a velocity.x = 0 ya que se mueve a la velocidad de la camara.
		velocidadMin = Reg.velocidadCamara;
		FlxG.state.add(balasRef);
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		movimiento();
		if (intervalo >= Reg.fireRate)
		{
		disparar();
		}
		else
		{
		intervalo += elapsed;	
		}
	}
	
	function disparar() 
	{
		if (FlxG.keys.pressed.SPACE)
		{
			b = new PlayerBala(this.x,this.y);
			balasRef.add(b);
			intervalo = 0;
		}
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
		//Desaceleracion
		if (velocity.y >= 1 || velocity.y <= -1 )
		{
			velocity.y = velocity.y * 0.8;
			
		}
		else 
		{
		velocity.y = 0;
		}
		if (velocity.x >= 1+ velocidadMin || velocity.x <= -1 - velocidadMin )
		{
			velocity.x = velocity.x * 0.6;
		}
		else
		{
		velocity.x = velocidadMin;
		}
		
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