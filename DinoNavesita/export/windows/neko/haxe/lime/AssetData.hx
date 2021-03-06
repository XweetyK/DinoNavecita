package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/1.png", "assets/data/1.png");
			type.set ("assets/data/1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/2.png", "assets/data/2.png");
			type.set ("assets/data/2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/3.png", "assets/data/3.png");
			type.set ("assets/data/3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/dinonivel.oel", "assets/data/dinonivel.oel");
			type.set ("assets/data/dinonivel.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/dinonivel.oep", "assets/data/dinonivel.oep");
			type.set ("assets/data/dinonivel.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/floor.png", "assets/data/floor.png");
			type.set ("assets/data/floor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/levelv2.oel", "assets/data/levelv2.oel");
			type.set ("assets/data/levelv2.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/levelv2.oep", "assets/data/levelv2.oep");
			type.set ("assets/data/levelv2.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/Background.png", "assets/images/Background.png");
			type.set ("assets/images/Background.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/barfill.png", "assets/images/barfill.png");
			type.set ("assets/images/barfill.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/barfill2.png", "assets/images/barfill2.png");
			type.set ("assets/images/barfill2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/barfill3.png", "assets/images/barfill3.png");
			type.set ("assets/images/barfill3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/barfill4.png", "assets/images/barfill4.png");
			type.set ("assets/images/barfill4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/barfill5.png", "assets/images/barfill5.png");
			type.set ("assets/images/barfill5.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/barside.png", "assets/images/barside.png");
			type.set ("assets/images/barside.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Dinopianito.png", "assets/images/Dinopianito.png");
			type.set ("assets/images/Dinopianito.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/dinoshot.png", "assets/images/dinoshot.png");
			type.set ("assets/images/dinoshot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/enemyshot.png", "assets/images/enemyshot.png");
			type.set ("assets/images/enemyshot.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/FRUTITA.png", "assets/images/FRUTITA.png");
			type.set ("assets/images/FRUTITA.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/gameover.png", "assets/images/gameover.png");
			type.set ("assets/images/gameover.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/Negapianito.png", "assets/images/Negapianito.png");
			type.set ("assets/images/Negapianito.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/option.png", "assets/images/option.png");
			type.set ("assets/images/option.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/portada.png", "assets/images/portada.png");
			type.set ("assets/images/portada.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/power0.png", "assets/images/power0.png");
			type.set ("assets/images/power0.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/power1.png", "assets/images/power1.png");
			type.set ("assets/images/power1.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/power2.png", "assets/images/power2.png");
			type.set ("assets/images/power2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/power3.png", "assets/images/power3.png");
			type.set ("assets/images/power3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/power4.png", "assets/images/power4.png");
			type.set ("assets/images/power4.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/shield.png", "assets/images/shield.png");
			type.set ("assets/images/shield.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/YEE.png", "assets/images/YEE.png");
			type.set ("assets/images/YEE.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/YEE2.png", "assets/images/YEE2.png");
			type.set ("assets/images/YEE2.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/YEE3.png", "assets/images/YEE3.png");
			type.set ("assets/images/YEE3.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/YOUWIN.png", "assets/images/YOUWIN.png");
			type.set ("assets/images/YOUWIN.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/death.wav", "assets/music/death.wav");
			type.set ("assets/music/death.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/dinopianito.wav", "assets/music/dinopianito.wav");
			type.set ("assets/music/dinopianito.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/menu.wav", "assets/music/menu.wav");
			type.set ("assets/music/menu.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/mercury.wav", "assets/music/mercury.wav");
			type.set ("assets/music/mercury.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/negasound.wav", "assets/music/negasound.wav");
			type.set ("assets/music/negasound.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/relife.wav", "assets/music/relife.wav");
			type.set ("assets/music/relife.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/shoot.wav", "assets/music/shoot.wav");
			type.set ("assets/music/shoot.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/music/yee.wav", "assets/music/yee.wav");
			type.set ("assets/music/yee.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
