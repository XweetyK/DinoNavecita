package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import entities.GuiaCamara;
import entities.Player;
import entities.Reg;
import entities.PlayerBala;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	private var cantVidas:Int;
	private var gameOver:Bool;
	private var guide:GuiaCamara; //guía de la camara.
	private var player:Player;
	private var balasJugador:FlxTypedGroup<PlayerBala>; 
	private var a:PlayerBala;
	
	override public function create():Void
	{
		super.create();
		balasJugador = new FlxTypedGroup<PlayerBala>();
		cantVidas = Reg.cantVidasMax;
		gameOver = false;
		guide = new GuiaCamara(FlxG.width / 2, FlxG.height / 2);
		add(guide);
		FlxG.camera.follow(guide);
		//add() el fondo
		player = new Player(null,null,null,balasJugador);
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