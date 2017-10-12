package entities;
import flixel.FlxBasic.FlxType;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxRandom;
import entities.Reg;
import flixel.group.FlxGroup.FlxTypedGroup;
class NegaPianito extends Enemy
{
	public var balaCont:Float;
	private var cantMax:Float;
	var disparin:FlxTypedGroup<EnemyBala>;
	private var disp:EnemyBala;
	private var disp2:EnemyBala;
	private var disp3:EnemyBala;
	private var unaVez:Bool;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset, shoot:FlxTypedGroup<EnemyBala>) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.Negapianito__png, true, 32, 32);
		animation.add("b1", [0, 1, 2, 3], 12, true);
		animation.play("b1");
		scale.set(1.5, 1.5);
		puntaje = 25000;
		velocity.x = 0;
		velocidad = 270;
		disparin = shoot;
		balaCont = 0;
		cantMax = 3;
		unaVez = true;
		FlxG.state.add(disp);
	}
	
	override private function movimiento():Void
	{
		if (unaVez) 
		{
			velocity.y = velocidad;
			unaVez = false;	
		}
		if (this.y>= FlxG.camera.height - this.height - 40) 
		{
			velocity.y = -velocidad;
		}
		if (this.y <= 20) 
		{
			velocity.y = velocidad;
		}
	}
	public function vel():Void
	{
		velocity.x = Reg.velocidadCamara-5;
	}
	override public function update(elapsed:Float):Void 
	{
		super.update(elapsed);
		shoot();

	}
	private function shoot():Void
	{
		if (balaCont < cantMax)
		{
			balaCont += 3;
			disp = new EnemyBala(this.x - 10, this.y + 10);
			disp2 = new EnemyBala(this.x - 10, this.y + 20);
			disp3 = new EnemyBala(this.x - 10, this.y - 20);
			disp2.velocity.y = 20;
			disp3.velocity.y = -20;
			disparin.add(disp);
			disparin.add(disp2);
			disparin.add(disp3);
		}
	}
}