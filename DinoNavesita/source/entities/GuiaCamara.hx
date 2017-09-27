package entities;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author ...
 */
class GuiaCamara extends FlxSprite
{

	public function new(?X:Float=0,?Y:Float=0) 
	{
		super(X,Y);
		makeGraphic(1, 1, 0x00000000);
		velocity.x = Reg.velocidadCamara;
		
	}
	
}