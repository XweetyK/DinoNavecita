package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
/**
 * ...
 * @author Tomás Mugetti
 */
class Powerup extends FlxSprite
{
	private var player:Player;
	public function new(X:Float, Y:Float, jugador:Player) 
	{
		super(X,Y);
		loadGraphic(AssetPaths.FRUTITA__png, true, 32, 32);
		animation.add("flotar", [0, 1, 2, 3, 4], 12, true);
		animation.play("flotar");
		player = jugador;
	}
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (FlxG.overlap(this, player)) 
		{
			player.ganaPoder();
			this.destroy();
		}
	}
	
}