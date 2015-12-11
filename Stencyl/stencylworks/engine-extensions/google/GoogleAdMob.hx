package;

#if cpp
import cpp.Lib;
#elseif neko
import neko.Lib;
#else
import openfl.Lib;
#end

#if android
import openfl.utils.JNI;
#end

import scripts.MyAssets;
import com.stencyl.Engine;
import com.stencyl.event.EventMaster;
import com.stencyl.event.StencylEvent;

import openfl.utils.ByteArray;
import openfl.display.BitmapData;
import openfl.geom.Rectangle;

class GoogleAdMob
{	
	//Universal
	private static var initialized:Bool = false;
	
	//Android-Only
    #if android
	public static var adwhirlCode:String = "none";
	private static inline var ANDROID_CLASS:String = "com/stencyl/GoogleServices/AdMob";
	private static var _init_func:Dynamic;
	private static var _show_func:Dynamic;
	private static var _hide_func:Dynamic;
    #end
	
	//Ad Events only happen on iOS. AdMob provides no out-of-the-box way.
	private static function notifyListeners(inEvent:Dynamic)
	{
		
	}

	public static function initialize(apiCode:String = "none", position:Int = 0):Void 
	{
		if(initialized)
		{
			return;
		}
		
		#if android
		if(apiCode == "none" || apiCode == "")
		{
			return;
		}
		
		adwhirlCode = apiCode;
		
		if(_init_func == null)
		{
			_init_func = JNI.createStaticMethod("com/stencyl/GoogleServices/AdMob", "initBanner", "(Ljava/lang/String;I)V", true);
		}
	
		var args = new Array<Dynamic>();
		args.push(adwhirlCode);
		args.push(MyAssets.adPositionBottom ? 0 : 1);
		_init_func(args);
			
		initialized = true;
		#end
	}

	public static function showAd(onBottom:Bool = true):Void
	{		
		#if android
		if(!initialized)
		{
			GoogleAdMob.initialize(MyAssets.whirlID, MyAssets.adPositionBottom ? 0 : 1);
		}
		
		if(_show_func == null)
		{
			_show_func = JNI.createStaticMethod("com/stencyl/GoogleServices/AdMob", "showBanner", "()V", true);
		}

		var args = new Array<Dynamic>();
		_show_func(args);
		#end
	}	
	
	public static function hideAd():Void
	{		
		#if android
		if(!initialized)
		{
			GoogleAdMob.initialize(MyAssets.whirlID, MyAssets.adPositionBottom ? 0 : 1);
		}
		
		if(_hide_func == null)
		{
			_hide_func = JNI.createStaticMethod("com/stencyl/GoogleServices/AdMob", "hideBanner", "()V", true);
		}

		var args = new Array<Dynamic>();
		_hide_func(args);
		#end
	}
}