package;
import entities.Compa;
import entities.Enemy1;
import entities.Enemy2;
import entities.Enemy3;
import entities.Medidor;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxState;
import entities.GuiaCamara;
import entities.Player;
import entities.Reg;
import entities.PlayerBala;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup.FlxTypedGroup;
import entities.Misil;
import entities.Powerup;

class PlayState extends FlxState
{
	private var cantVidas:Int;
	private var gameOver:Bool;
	private var guide:GuiaCamara; //guía de la camara.
	private var player:Player;
	private var balasJugador:FlxTypedGroup<PlayerBala>;
	private var misilesJugador:FlxTypedGroup<Misil>;
	private var powerups:FlxTypedGroup<Powerup>;
	private var a:PlayerBala;
	private var fondo:FlxSprite;
	private var tilemap:FlxTilemap;
	var enemyGroup:FlxTypedGroup<Enemy1>;
	var enemy2Group:FlxTypedGroup<Enemy2>;
	var enemy3Group:FlxTypedGroup<Enemy3>;
	private var compa1:Compa;
	private var compa2:Compa;
	private var cuentaCompa:Int;
	private var velGlobal:Float;
	private var medidor:Medidor;
	private var poder:Int;
	
	override public function create():Void
	{
		super.create();
		enemyGroup = new FlxTypedGroup<Enemy1>();
		enemy2Group = new FlxTypedGroup<Enemy2>();
		enemy3Group = new FlxTypedGroup<Enemy3>();
		//Mapa de Ogmo
		var loader:FlxOgmoLoader = new FlxOgmoLoader (AssetPaths.levelv2__oel);
		tilemap = loader.loadTilemap(AssetPaths.floor__png, 30, 30, "Tileset");
		tilemap.setTileProperties(0, FlxObject.NONE);
		tilemap.setTileProperties(1, FlxObject.ANY);
		tilemap.setTileProperties(2, FlxObject.ANY);
		tilemap.setTileProperties(3, FlxObject.ANY);
		tilemap.setTileProperties(4, FlxObject.ANY);
		tilemap.setTileProperties(5, FlxObject.ANY);
		tilemap.setTileProperties(6, FlxObject.ANY);
		tilemap.setTileProperties(7, FlxObject.ANY);
		tilemap.setTileProperties(8, FlxObject.ANY);
		tilemap.setTileProperties(9, FlxObject.ANY);
		tilemap.setTileProperties(10, FlxObject.ANY);
		tilemap.setTileProperties(11, FlxObject.ANY);
		tilemap.setTileProperties(12, FlxObject.ANY);
		FlxG.worldBounds.set(0, 0, 3000, 240);
		FlxG.mouse.visible = false;
		velGlobal = Reg.velocidadCamara;
		
		loader.loadEntities(entityCreator, "Enemy1");
		loader.loadEntities(entity2Creator, "Enemy2");
		loader.loadEntities(entity3Creator, "Enemy3");
		
		balasJugador = new FlxTypedGroup<PlayerBala>();
		misilesJugador = new FlxTypedGroup<Misil>();
		powerups = new FlxTypedGroup<Powerup>();
		
		cantVidas = Reg.cantVidasMax;
		gameOver = false;
		cuentaCompa = 0;
		guide = new GuiaCamara(FlxG.width / 2, FlxG.height / 2);
		add(guide);
		FlxG.camera.follow(guide);
		fondo = new FlxSprite(0, 0, AssetPaths.Background__png);
		fondo.velocity.x = 10;
		add(fondo);
		player = new Player(null, 100, null, balasJugador,misilesJugador);
		add(tilemap);
		poder = 0;
		medidor = new Medidor();
		add(medidor);
		add(player);
		add(enemyGroup);
		add(enemy2Group);
		add(enemy3Group);
	}

	private function entityCreator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var e1:Enemy1 = new Enemy1(powerups);
		e1.x = x;
		e1.y = y;
		enemyGroup.add(e1);
	}
	private function entity2Creator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var e2:Enemy2 = new Enemy2(powerups);
		e2.x = x;
		enemy2Group.add(e2);
	}
	private function entity3Creator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var e3:Enemy3 = new Enemy3(powerups);
		e3.x = x;
		e3.y = y;
		enemy3Group.add(e3);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.overlap(tilemap, player);//colision con mapa
		medidor.contar(poder);
		
		for (i in 0...enemyGroup.members.length-1)
		{
			if (FlxG.overlap(player, enemyGroup.members[i]))
			{
			enemyGroup.members[i].destroy();
			playerLose();
			}
		}
		
		testearPoder();
	}
	function testearPoder():Void
	{
		if (FlxG.keys.justPressed.A) 
		{
			poder++;
		}
		if (FlxG.keys.justPressed.S) 
		{
			if (poder == 1)
			{
				player.aplicarBoost();
				poder = 0;
			}
			else
			{
				if (poder == 2)
				{
					player.aplicarEscudo();
					poder = 0;
				}
				else
				{
					if (poder == 3)
					{
						ponerCompa();
						poder = 0;
					}
					else
					{
						if (poder == 4)
						{
							player.aplicarMisiles();
							poder = 0;
						}
					}
				}
			}	
		}
	}
	
	function playerLose():Void
	{
		
		if (player.tieneEscudo())
		{
			player.pierdeEscudo();
		}
		else if (cantVidas > 0)
		{
			cantVidas--;
			perderCompa();
			player.quitarBoost();
			player.quitarMisiles();
			player.x = 1;
			player.y = camera.height / 2;
		}
		if (cantVidas <= 0)
		{
			FlxG.resetState();
		}
	}

	function ponerCompa():Void
	{
		switch (cuentaCompa)
		{
			case 0:
				compa1 = new Compa(player,balasJugador);
				add(compa1);
				cuentaCompa++;
			case 1:
				compa2 = new Compa(compa1,balasJugador);
				add(compa2);
				cuentaCompa++;
			default:
		}
	}

	function perderCompa():Void
	{
		remove(compa1);
		remove(compa2);
		cuentaCompa = 0;
	}

	function bastaChicos():Void
	{
		if (FlxG.camera.scroll.x + FlxG.camera.width == 2740)
		{
			guide.detener();
			fondo.velocity.x = 0;
			player.detener();
			compa1.detener();
			compa2.detener();
		}
	}
}