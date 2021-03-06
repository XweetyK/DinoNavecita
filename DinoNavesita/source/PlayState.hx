package;
import flixel.FlxState;
import entities.Compa;
import entities.Enemy;
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
import entities.EnemyBala;
import entities.NegaPianito;
import flixel.FlxObject;
import flixel.tile.FlxTilemap;
import flixel.group.FlxGroup.FlxTypedGroup;
import entities.Misil;
import entities.Powerup;
import flixel.text.FlxText;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;

class PlayState extends FlxState
{
	private var cantVidas:Int;
	private var score:Int;
	private var gameOver:Bool;
	private var guide:GuiaCamara; //guía de la camara.
	private var player:Player;
	private var nega:NegaPianito;
	private var balasJugador:FlxTypedGroup<PlayerBala>;
	private var balasEnemy:FlxTypedGroup<EnemyBala>;
	private var misilesJugador:FlxTypedGroup<Misil>;
	private var fondo:FlxSprite;
	private var tilemap:FlxTilemap;
	private var enemyGroup:FlxTypedGroup<Enemy>;
	private var compa1:Compa;
	private var compa2:Compa;
	private var cuentaCompa:Int;
	private var velGlobal:Float;
	private var medidor:Medidor;
	private var poder:Int;
	private var playerVidas:FlxText;
	private var playerScore:FlxText;
	private var r:FlxRandom;
	private var bossLife:FlxSprite;
	private var bossFrame:FlxSprite;
	private var bossLifeState:Int;
	private var bossText:FlxText;
	override public function create():Void
	{
		super.create();
		enemyGroup = new FlxTypedGroup<Enemy>();
		bossFrame = new FlxSprite(1950, 40, AssetPaths.barside__png);
		bossLife = new FlxSprite(1950, 40, AssetPaths.barfill__png);
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
		playerVidas = new FlxText (1, 1, 480, "", 10);
		playerVidas.scrollFactor.x = 0;
		playerScore = new FlxText(100, 1, 480, "", 10);
		playerScore.scrollFactor.x = 0;
		balasJugador = new FlxTypedGroup<PlayerBala>();
		balasEnemy = new FlxTypedGroup<EnemyBala>();
		misilesJugador = new FlxTypedGroup<Misil>();
		cantVidas = Reg.cantVidasMax;
		score = 0;
		bossLifeState = 6;
		gameOver = false;
		cuentaCompa = 0;
		r = new FlxRandom();
		guide = new GuiaCamara(FlxG.width / 2, FlxG.height / 2);
		add(guide);
		FlxG.camera.follow(guide);
		fondo = new FlxSprite(0, 0, AssetPaths.Background__png);
		fondo.velocity.x = 10;
		add(fondo);
		player = new Player(null, 100, null, balasJugador, misilesJugador);
		nega = new NegaPianito(2000, 100, null,balasEnemy);
		add(tilemap);
		poder = 0;
		medidor = new Medidor();
		add(medidor);
		add(player);
		add(enemyGroup);
		add(playerVidas);
		add(playerScore);
		add(nega);
		FlxG.sound.load();
		FlxG.sound.play(AssetPaths.dinopianito__wav, 0.15, true);
	}

	private function entityCreator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var e1:Enemy1 = new Enemy1();
		e1.x = x;
		e1.y = y;
		enemyGroup.add(e1);
	}
	private function entity2Creator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var e2:Enemy2 = new Enemy2();
		e2.x = x;
		e2.y = y;
		enemyGroup.add(e2);
	}
	private function entity3Creator(entityName:String, entityData:Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var e3:Enemy3 = new Enemy3();
		e3.x = x;
		e3.y = y;
		enemyGroup.add(e3);
	}
	private function addPuntaje(num:Int):Void
	{
		score += num;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		playerVidas.text = "Vidas: " + cantVidas;
		playerScore.text = "Score: " + score;
		trace(guide.x);
		if(FlxG.collide(tilemap, player))
		{
			playerLose();
		}//colision con mapas
		if (FlxG.overlap(player, nega))
		{
			playerLose();
		}
		if (guide.x == 1900)//1900
		{
			FlxG.sound.pause();
			FlxG.sound.play(AssetPaths.negasound__wav,0.25, true);
		}
		if (guide.x == 1910)
		{
			nega.vel();
			add(bossLife);
			add(bossFrame);
			bossLife.velocity.x = Reg.velocidadCamara;
			bossFrame.velocity.x = Reg.velocidadCamara;
		}
		medidor.contar(poder);
		//colisiones
		//player y enemigo
		for (i in 0 ... enemyGroup.members.length) 
		{
			var loco:Enemy = enemyGroup.members[i];
			if (FlxG.overlap(player, loco)) 
			{
				playerLose();
				dropear(loco.x, loco.y);
				enemyGroup.remove(loco, true);
				loco.destroy();
			}
			
		}
		//bala y enemigo
		for (i in 0 ... enemyGroup.members.length -1) 
		{
			var loco:Enemy = enemyGroup.members[i];
			for (j in 0 ... balasJugador.members.length) 
			{
				var bala:PlayerBala = balasJugador.members[j];
				if (FlxG.overlap(loco,bala)) 
				{
					FlxG.sound.play(AssetPaths.yee__wav);
					addPuntaje(loco.suValor());
					dropear(loco.x, loco.y);
					enemyGroup.remove(loco, true);
					balasJugador.remove(bala, true);
				}
			}
			for (h in 0...misilesJugador.members.length)
			{
				var misil:Misil = misilesJugador.members[h];
				if (FlxG.overlap(loco, misil))
				{
					FlxG.sound.play(AssetPaths.yee__wav);
					addPuntaje(loco.suValor());
					dropear(loco.x, loco.y);
					enemyGroup.remove(loco, true);
					misilesJugador.remove(misil, true);
				}
			}
			
		}
		for (i in 0 ... balasJugador.members.length) 
			{
				var bala:PlayerBala = balasJugador.members[i];
				if (FlxG.overlap(nega,bala)) 
				{
					FlxG.sound.play(AssetPaths.yee__wav);
					balasJugador.remove(bala, true);
					bossHit();
				}
			}
		balasJugador.forEach(chequearBala,false);
		misilesJugador.forEach(chequearMisil, false);
		poder = player.getPoder();
		powerUp();
	}
	private function dropear(x:Float,y:Float):Void
	{
		var drop:Bool = r.bool();
		if (drop) 
		{
			add(new Powerup(x, y, player));
		}
	}
	private function powerUp():Void
	{
		if (FlxG.keys.pressed.X) 
		{
			switch (poder) 
			{
				case 0:
					
				case 1:
					player.aplicarBoost();
					player.pierdePoder();
				case 2:
					player.aplicarEscudo();
					player.pierdePoder();
				case 3:
					ponerCompa();
					player.pierdePoder();
				default:
					player.aplicarMisiles();
					player.pierdePoder();
			}
		}
	}
	private function chequearMisil(misil:Misil):Void
	{
		if (misil.MisilColision())
		{
			misilesJugador.remove(misil, true);
		}
	}
	private function chequearBala(bala:PlayerBala):Void
	{
		if (bala.balaColision()) 
		{
			balasJugador.remove(bala, true);
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
			if (poder>0) 
			{
				player.pierdePoder();
				player.ganaPoder();
			}
			FlxG.sound.play(AssetPaths.death__wav);
		}
		if (cantVidas <= 0)
		{
			var gameOver:QgameOver = new QgameOver();
			FlxG.switchState(gameOver);
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
	private function bossHit():Void
	{
		bossLifeState--;
		if (bossLifeState == 4)
			bossLife.loadGraphic(AssetPaths.barfill2__png);
		if (bossLifeState == 3)
			bossLife.loadGraphic(AssetPaths.barfill3__png);
		if (bossLifeState == 2)
			bossLife.loadGraphic(AssetPaths.barfill4__png);
		if (bossLifeState == 1)
			bossLife.loadGraphic(AssetPaths.barfill5__png);
		if (bossLifeState == 0)
		{
			bossLife.kill();
			nega.kill();
			camera.fade(FlxColor.BLACK, 2, false, endGame, false);
		}
	}
	private function endGame():Void
	{
		var winner:Winner = new Winner();
		FlxG.switchState(winner);
	}
}