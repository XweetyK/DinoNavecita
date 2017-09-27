package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import entities.GuiaCamara;
import source.entities.Player;
import entities.Reg;

class PlayState extends FlxState
{
	private var cantVidas:Int;
	private var gameOver:Bool;
	private var guide:GuiaCamara; //guía de la camara.
	private var player:Player;
	
	override public function create():Void
	{
		super.create();
		cantVidas = Reg.cantVidasMax;
		gameOver = false;
		guide = new GuiaCamara(FlxG.width / 2, FlxG.height / 2);
		add(guide);
		FlxG.camera.follow(guide);
		//add() el fondo
		player = new Player();
		add(player);
		
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
	
	function playerLose() 
	{
		if (player.tieneEscudo) 
		{
			player.pierdeEscudo();
		} else if (cantVidas > 0) 
		{
			cantVidas--;
		}
		if (cantVidas =< 0) 
		{
			gameOver = true;
		}
	}
}