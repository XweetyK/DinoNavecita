package;
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
	
	override public function create():Void
	{
		super.create();
		
		//Mapa de Ogmo
		var loader:FlxOgmoLoader = new FlxOgmoLoader (AssetPaths.dinonivel__oel);
		tilemap = loader.loadTilemap(AssetPaths.floor__png, 32, 32, "tiles");
		tilemap.setTileProperties(0, FlxObject.ANY);
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
		
		balasJugador = new FlxTypedGroup<PlayerBala>();
		cantVidas = Reg.cantVidasMax;
		gameOver = false;
		guide = new GuiaCamara(FlxG.width / 2, FlxG.height / 2);
		add(guide);
		FlxG.camera.follow(guide);
		fondo = new FlxSprite(0, 0, AssetPaths.Background__png);
		fondo.velocity.x = 10;
		add(fondo);
		player = new Player(null, null, null, balasJugador);
		add(tilemap);
		add(player);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
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
}