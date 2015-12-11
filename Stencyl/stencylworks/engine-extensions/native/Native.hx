package;

import openfl.Lib;

#if android
import openfl.utils.JNI;
#end

import com.stencyl.Engine;
import com.stencyl.event.EventMaster;
import com.stencyl.event.StencylEvent;

import openfl.utils.ByteArray;
import openfl.display.BitmapData;
import openfl.geom.Rectangle;
import openfl.events.KeyboardEvent;
import openfl.events.EventDispatcher;
import com.stencyl.Input;

class Native
{	
	public static function osName():String
	{
		#if(cpp && mobile && !android)
		return native_device_os();
		#elseif android
		return "";
		#else
		return "";
		#end
	}
	
	public static function osVersion():String
	{
		#if(cpp && mobile && !android)
		return native_device_vervion();
		#elseif android
		return "";
		#else
		return "";
		#end
	}
	
	public static function deviceName():String
	{
		#if(cpp && mobile && !android)
		return native_device_name();
		#elseif android
		return "";
		#else
		return "";
		#end
	}
	
	public static function model():String
	{
		#if(cpp && mobile && !android)
		return native_device_model();
		#elseif android
		return "";
		#else
		return "";
		#end
	}
	
	public static function networkAvailable():Bool
	{
		#if(cpp && mobile && !android)
		return native_device_network_available();
		#elseif android
		return false;
		#else
		return false;
		#end
	}
	
	public static function vibrate(time:Float):Void
	{
		#if(cpp && mobile && !android)
		native_device_vibrate(time);
		#end
		
		#if android
		if(funcVibrate == null)
		{
			funcVibrate = JNI.createStaticMethod("Native", "vibrate", "(I)V", true);
		}
		
		funcVibrate([time * 1000]);
		#end
	}
	
	//Keyboard
	public static function showKeyboard():Void
	{
		#if(cpp && mobile && !android)
		initKeyboard();
		native_device_show_keyboard();
		Engine.events.addKeyboardEvent(new StencylEvent(StencylEvent.KEYBOARD_SHOW, ""));
		#end
		
		#if android
		if(funcShowKeyboard == null)
		{
			funcShowKeyboard = JNI.createStaticMethod("Native", "showKeyboard", "()V", true);
		}
		
		funcShowKeyboard([]);
		Engine.events.addKeyboardEvent(new StencylEvent(StencylEvent.KEYBOARD_SHOW, ""));
		#end
	}
	
	public static function hideKeyboard():Void
	{
		#if(cpp && mobile && !android)
		initKeyboard();
		native_device_hide_keyboard();
		Engine.events.addKeyboardEvent(new StencylEvent(StencylEvent.KEYBOARD_HIDE, ""));
		#end
		
		#if android
		if(funcHideKeyboard == null)
		{
			funcHideKeyboard = JNI.createStaticMethod("Native", "hideKeyboard", "()V", true);
		}
		
		funcHideKeyboard([]);
		Engine.events.addKeyboardEvent(new StencylEvent(StencylEvent.KEYBOARD_HIDE, ""));
		#end
	}
	
	public static function setKeyboardText(text:String):Void
	{
		#if(cpp && mobile && !android)
		native_setKeyboardText(text);
		#end
		
		#if android
		//TODO:
		#end
	}
	
	public static function initKeyboard():Void 
	{
		#if(cpp && mobile && !android)
		if(!keyboardInitialized)
		{
			keyboard_set_event_handle(notifyListeners);
			keyboardInitialized = true;
		}
		#end	
	}
	
	private static function notifyListeners(inEvent:Dynamic)
	{
		#if(cpp && mobile && !android)
		
		//Fire Key Event
		//var data:Int = Std.int(Reflect.field(inEvent, "data"));
		//Input.onKeyDown(new KeyboardEvent(KeyboardEvent.KEY_DOWN, true, false, data, data));
		//Input.onKeyUp(new KeyboardEvent(KeyboardEvent.KEY_UP, true, false, data, data));
		
		//Fire a special event
		var data = Reflect.field(inEvent, "data");
		trace("Text: " + data);
		
		if(data == "@SUBMIT@")
		{
			data = Reflect.field(inEvent, "data2");
			Engine.events.addKeyboardEvent(new StencylEvent(StencylEvent.KEYBOARD_DONE, data));
		}
		
		else
		{
			Engine.events.addKeyboardEvent(new StencylEvent(StencylEvent.KEYBOARD_EVENT, data));
		}
		#end	
	}
	
	//Badge
	
	public static function setIconBadgeNumber(n:Int):Void
	{
		#if(cpp && mobile && !android)
		native_device_badge(n);
		#end
	}

	//Alert
	
	private static var alertTitle:String;
	private static var alertMSG:String;

	public static function showAlert(title:String, message:String):Void
	{
		alertTitle = title;
		alertMSG = message;
		haxe.Timer.delay(delayAlert, 30);
	}
	
	private static function delayAlert():Void
	{
		#if(cpp && mobile && !android)
		native_system_ui_show_alert(alertTitle, alertMSG);
		#end
		
		#if android
		if(funcAlert == null)
		{
			funcAlert = JNI.createStaticMethod("Native", "showAlert", "(Ljava/lang/String;Ljava/lang/String;)V", true);
		}
		
		funcAlert([alertTitle, alertMSG]);
		#end
	}
	
	//Spinner - No Android Equivalent
	
	public static function showLoadingScreen():Void
	{
		#if(cpp && mobile && !android)
		native_system_ui_show_system_loading_view();
		#end
	}	
	
	public static function hideLoadingScreen():Void
	{
		#if(cpp && mobile && !android)
		native_system_ui_hide_system_loading_view();
		#end
	}
	
	#if android
	private static var funcAlert:Dynamic;
	private static var funcVibrate:Dynamic;
	private static var funcShowKeyboard:Dynamic;
	private static var funcHideKeyboard:Dynamic;
	#end
	
	private static var keyboardInitialized:Bool = false;
	
	#if(cpp && mobile && !android)
	static var keyboard_set_event_handle = Lib.load("native","keyboard_set_event_handle",1);
	
	static var native_device_os = Lib.load("native","native_device_os",0);
	static var native_device_vervion = Lib.load("native","native_device_vervion",0);
	static var native_device_name = Lib.load("native","native_device_name",0);
	static var native_device_model = Lib.load("native","native_device_model",0);
	static var native_device_network_available = Lib.load("native","native_device_network_available",0);
	static var native_device_vibrate = Lib.load("native","native_device_vibrate",1);
	static var native_device_badge = Lib.load("native","native_device_badge",1);
	
	static var native_device_show_keyboard = Lib.load("native","native_device_show_keyboard",0);
	static var native_device_hide_keyboard = Lib.load("native","native_device_hide_keyboard",0);
	static var native_setKeyboardText = Lib.load("native","native_setKeyboardText",1);
	
	static var native_system_ui_show_alert = Lib.load("native","native_system_ui_show_alert",2);
	static var native_system_ui_show_system_loading_view = Lib.load("native","native_system_ui_show_system_loading_view",0);
	static var native_system_ui_hide_system_loading_view = Lib.load("native","native_system_ui_hide_system_loading_view",0);
	#end
}