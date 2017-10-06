package;
import entities.Compa;
import entities.Enemy1;
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

class PlayState extends FlxState
{
	private var cantVidas:Int;
	private var gameOver:Bool;
	private var guide:GuiaCamara; //guía de la camara.
	private var player:Player;
	private var balasJugador:FlxTypedGroup<PlayerBala>; 
	private var a:PlayerBala;
	private var fondo:FlxSprite;
	private var tilemap:FlxTilemap;
	var enemyGroup:FlxTypedGroup<Enemy1>;
	private var compa1:Compa;
	private var compa2:Compa;
	private var cuentaCompa:Int;
	
	override public function create():Void
	{
		super.create();
		
		enemyGroup = new FlxTypedGroup<Enemy1>();
		
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
		
		loader.loadEntities(entityCreator, "Enemy1");
		
		balasJugador = new FlxTypedGroup<PlayerBala>();
		cantVidas = Reg.cantVidasMax;
		gameOver = false;
		cuentaCompa = 0;
		guide = new GuiaCamara(FlxG.width / 2, FlxG.height / 2);
		add(guide);
		FlxG.camera.follow(guide);
		fondo = new FlxSprite(0, 0, AssetPaths.Background__png);
		fondo.velocity.x = 10;
		add(fondo);
		player = new Player(null, 100, null, balasJugador);
		add(tilemap);
		add(player);
		add(enemyGroup);
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

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(tilemap, player);//colision con mapa
	}
	
	function playerLose() 
	{
		if (player.tieneEscudo()) 
		{
			player.pierdeEscudo();
		} else if (cantVidas > 0) 
		{
			cantVidas--;
		}
		if (cantVidas <= 0) 
		{
			gameOver = true;
		}
	}
	
	function ponerCompa():Void
	{
		switch (cuentaCompa) 
		{
			case 0:
				compa1 = new Compa(player,balasJugador);
				add(compa1);
			case 1:
				compa2 = new Compa(compa1,balasJugador);
				add(compa2);
			default:
		}
		cuentaCompa++;
	}
	
	function perderCompa():Void
	{
		remove(compa1);
		remove(compa2);
		cuentaCompa = 0;
	}
}