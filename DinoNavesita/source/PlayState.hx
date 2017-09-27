package;

import flixel.FlxState;
import Reg;

class PlayState extends FlxState
{
	var cantVidas:Int;
	var gameOver:Bool;
	override public function create():Void
	{
		super.create();
		cantVidas = Reg.cantVidasMax;
		gameOver = false;
	}
	
	function playerLose() 
	{
		if (cantVidas => 1)
		{
			cantVidas -= 1;
		}
		else
		{
			gameOver = true;
		}
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}