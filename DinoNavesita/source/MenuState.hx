package;

import flixel.FlxState;
import flixel.FlxSprite;
import flixel.FlxG;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class MenuState extends FlxState 
{
	private var fondo:FlxSprite;
	private var splash:FlxSprite;

	override public function create():Void
	{
		super.create();
		
		fondo = new FlxSprite(0, 0, AssetPaths.Background__png);
		fondo.velocity.x = -10;
		add(fondo);
		
		splash = new FlxSprite(0, 0, AssetPaths.portada__png);
		add(splash);
		
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
