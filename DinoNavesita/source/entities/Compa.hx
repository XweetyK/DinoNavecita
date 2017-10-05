package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import entities.Reg;
import entities.PlayerBala;
import flixel.group.FlxGroup.FlxTypedGroup;
/**
 * ...
 * @author Tomás Mugetti
 */
class Compa extends Player
{
	private var lider:Player;
	private static inline var distancia:Int = 30;
	private var diferenciaX:Float;
	private var diferenciaY:Float;
	public function new(_lider:Player,balas:FlxTypedGroup<PlayerBala>) 
	{
		super(balas);
		loadGraphic(AssetPaths.option__png, true, 16, 16);
		lider = _lider;
		x = lider.x;
		y = lider.y + distancia;
		this.pixelPerfectPosition = false;
		diferenciaX = lider.width - this.width;
		diferenciaY = lider.height - this.height;
	}
	override private function movimiento():Void
	{
		velocidadAdicionalX = lider.obtenerVelX();
		velocidadAdicionalY = lider.obtenerVelY();
		
		if (FlxG.keys.pressed.RIGHT||FlxG.keys.pressed.LEFT||FlxG.keys.pressed.UP||FlxG.keys.pressed.DOWN) 
		{
			if (lider.x > (this.x - diferenciaX) && (lider.x - (this.x - diferenciaX)) > 3) 
			{
				velocity.x += velocidadAdicionalX;
			} else if (lider.x < (this.x - diferenciaX) && ((this.x - diferenciaX) - lider.x) > 3) 
			{
				velocity.x -= velocidadAdicionalX;
			} else 
			{
				velocity.x = velocidadMin;
			}
			
			if (lider.y > (this.y - diferenciaY) && (lider.y - (this.y - diferenciaY)) > 3) 
			{
				velocity.y =velocidadAdicionalY;
			} else if (lider.y < (this.y - diferenciaY) && ((this.y - diferenciaY) - lider.y) > 3) 
			{
				velocity.y = -velocidadAdicionalY;
			} else 
			{
				velocity.y = 0;
			}
			
			if ((lider.x > this.x) && (lider.x - this.x) < distancia || ((lider.x < this.x) && (this.x - lider.x) < distancia)) 
			{
				velocity.x = velocity.x/2;
			}
			if ((lider.y > this.y) && (lider.y - this.y) < distancia || ((lider.y < this.y) && (this.y - lider.y) < distancia)) 
			{
				velocity.y = velocity.y/2;
			}
		} else 
		{
			velocity.x = velocidadMin;
			velocity.y = 0;
		}
	}
	
}