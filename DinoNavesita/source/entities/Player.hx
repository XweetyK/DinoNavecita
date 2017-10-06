package entities;

import flixel.FlxBasic.FlxType;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Reg;
import entities.PlayerBala;
import flixel.group.FlxGroup.FlxTypedGroup;
import entities.Misil;
/**
 * ...
 * @author ChikoritasTeam
 */
class Player extends FlxSprite
{
	private var misil:Bool;
	private var escudo:Bool;
	private var vidas:Int;
	private var velocidadMin:Int;
	private var b:PlayerBala;
	private var m:Misil;
	private var intervalo:Float;
	private var velocidadAdicionalX:Int;
	private var velocidadAdicionalY:Int;
	var balasRef:FlxTypedGroup<PlayerBala>;
	var misilRef:FlxTypedGroup<Misil>;
	private var detenido:Bool;
	
	public function new(?X:Float=0, ?Y:Float=0,?simpleGraphic:FlxGraphicAsset,balas:FlxTypedGroup<PlayerBala>,?misiles:FlxTypedGroup<Misil>) 
	{
		super(X, Y, simpleGraphic);
		loadGraphic(AssetPaths.Dinopianito__png, true, 32, 32);
		animation.add("fly", [0, 1, 2, 3], 12, true);
		animation.play("fly");
		vidas = 3;
		misil = false;
		escudo = false;
		detenido = false;
		balasRef = balas;
		misilRef = misiles;
		intervalo = 0;
		velocidadMin = Reg.velocidadCamara;
		quitarBoost();
		FlxG.state.add(balasRef);
		FlxG.state.add(misilRef);
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
	
	public function disparar() 
	{
		if (FlxG.keys.pressed.Z)
		{
			b = new PlayerBala(this.x+10,this.y+10, detenido);
			balasRef.add(b);
			intervalo = 0;
			if (tieneMisil())
			{
			m = new Misil(this.x,this.y + this.height , detenido);
			misilRef.add(m);
			}
			FlxG.sound.play(AssetPaths.shoot__wav);
		}
	}
	
	public function tieneMisil():Bool
	{
		return misil;
	}
	public function tieneEscudo():Bool
	{
		return escudo;
	}
	public function pierdeEscudo():Void
	{
		escudo = false;
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
			velocity.x += velocidadAdicionalX;
		if (FlxG.keys.pressed.LEFT) 
			velocity.x -= velocidadAdicionalX;
		if (FlxG.keys.pressed.DOWN) 
			velocity.y = velocidadAdicionalY;
		if (FlxG.keys.pressed.UP) 
			velocity.y = -velocidadAdicionalY;
		
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
	
	public function aplicarBoost():Void
	{
		velocidadAdicionalX = Reg.velocidadX + 30;
		velocidadAdicionalY = Reg.velocidadY + 30;
	}
	
	public function aplicarEscudo():Void
	{
		escudo = true;
	}
	public function quitarBoost():Void
	{
		velocidadAdicionalX = Reg.velocidadX;
		velocidadAdicionalY = Reg.velocidadY;
	}
	public function obtenerVelX():Int
	{
		return velocidadAdicionalX;
	}
	public function obtenerVelY():Int
	{
		return velocidadAdicionalY;
	}
	public function detener():Void
	{
		velocidadMin = 0;
		detenido = true;
	}
}