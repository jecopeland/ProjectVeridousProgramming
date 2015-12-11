package scripts;

import haxe.xml.Fast;
import openfl.Assets;
import com.stencyl.AssetLoader;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.Engine;

class MyAssets implements AssetLoader
{
	//Game
	public static var landscape:Bool = true;
	public static var autorotate:Bool = false;
	public static var stretchToFit:Bool = false;
	public static var scaleToFit1:Bool = false;
	public static var scaleToFit2:Bool = false;
	public static var scaleToFit3:Bool = false;
	public static var stageWidth:Int = 480;
	public static var stageHeight:Int = 320;
	public static var initSceneID:Int = 0;
	public static var physicsMode:Int = 0;
	public static var gameScale:Float = 1.0;
	public static var gameImageBase:String = "1x";
	public static var antialias:Bool = false;
	public static var pixelsnap:Bool = false;
	public static var startInFullScreen = false;
	public static var scaleMode:Int = 0;

	//APIs
	public static var adPositionBottom:Bool = true;
	public static var whirlID:String = "";
	public static var cpmstarID:String = "4738QF16B2AFF";
	public static var newgroundsID:String = "";
	public static var newgroundsKey:String = "";
	
	//Other
	public static var releaseMode:Bool = false;
	public static var showConsole:Bool = false;
	public static var debugDraw:Bool = false;
	public static var always1x:Bool = false;
	public static var maxScale:Float = 4.0;
	public static var disableBackButton:Bool = false;
	
	//Keys
	public static var androidPublicKey:String = "";

	public function new()
	{
		Input.enable();
		Input.define("left", [nme.ui.Keyboard.LEFT]);
		Input.define("down", [nme.ui.Keyboard.DOWN]);
		Input.define("right", [nme.ui.Keyboard.RIGHT]);
		Input.define("up", [nme.ui.Keyboard.UP]);
		Input.define("Action 1", [nme.ui.Keyboard.A,nme.ui.Keyboard.SPACE]);
		
	}
	
	public function loadResources(resourceMap:Map<String,Dynamic>):Void
	{
		var i = 0;
		var increment = 50.0 / Math.max(1, 23);
		
		resourceMap.set("1-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-1-0.png", false));
		resourceMap.set("1-1.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-1-1.png", false));
		resourceMap.set("1-2.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-1-2.png", false));
		resourceMap.set("1-3.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-1-3.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("40-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-40-0.png", false));
		resourceMap.set("40-4.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-40-4.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("46-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-46-0.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("49-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-49-0.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("51-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-51-0.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("53-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-53-0.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("55-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-55-0.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("57-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-57-0.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("59-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-59-0.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("61-0.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/sprite-61-0.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
		resourceMap.set("31.png", Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/tileset-31.png", false));
		com.stencyl.Data.instance.updatePreloader(15 + Std.int(increment * i)); i++;
	}
	
	public function loadScenes(scenesXML:Map<Int,String>):Void
	{
		var i = 0;
		var increment = 10.0 / Math.max(1, 1);
		
		scenesXML.set(0, "Maze 1");
		com.stencyl.Data.instance.updatePreloader(90 + Std.int(increment * i)); i++;
	}
}