package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class QgameOver extends FlxState 
{
	private var fondo:FlxSprite;
	private var end:FlxSprite;

	override public function create():Void
	{
		super.create();
		
		FlxG.mouse.visible = true;
		fondo = new FlxSprite(0, 0, AssetPaths.Background__png);
		fondo.velocity.x = -10;
		add(fondo);
		
		end = new FlxSprite(0, 0, AssetPaths.gameover__png);
		add(end);
		
		var init_x:Int = Math.floor(FlxG.width / 2 - 40);
		var butonNew = new FlxButton(init_x, 150, "Try Again", onNew);
		add(butonNew);
	}
	
	private function onNew(): Void
	{
		var playState:PlayState = new PlayState();
		FlxG.switchState(playState);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}
}
