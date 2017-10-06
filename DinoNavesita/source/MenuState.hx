package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState 
{

	override public function create():Void
	{
		super.create();
		
		var init_x:Int = Math.floor(FlxG.width / 2 - 40);
		var butonNew = new FlxButton(init_x, 175, "Start!", onNew);
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
