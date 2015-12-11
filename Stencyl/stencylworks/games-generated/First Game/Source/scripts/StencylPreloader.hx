package scripts;

import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.Assets;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.events.MouseEvent;

#if(flash && !air)
import cpmstar.AdLoader;
import com.newgrounds.components.APIConnector;
#end

import com.stencyl.Engine;

class StencylPreloader extends NMEPreloader
{
	private var barBorder:Sprite;
	private var bar:Sprite;
	private var barBackground:Sprite;
	private var background:Sprite;
	private var barWidth:Int;
	private var barHeight:Int;
	
	private var started:Bool;
	private var adFinished:Bool;
	private var locked:Bool;

	public function new()
	{
		super();
		
		#if(mobile && !air)
		this.x = Engine.engine.root.x;
		this.y = Engine.engine.root.y;
		#end
		
		locked = false;
		adFinished = true;
		started = false;

		var gameScale = 1.0;
	
		//Site Lock & URL
		var siteLock = false;
		var lockURL = "";
		var url = "";
	
		//Background Color && Image
		var showSplash = 1;
		var backgroundColor = -15592942;
	
		background = new Sprite();
		background.graphics.beginFill(backgroundColor, 1);
		background.graphics.drawRect(0, 0, getWidth(), getHeight());
		addChild(background);
		
		if(true && true)
		{
			#if(mobile && !air)
			//var preloaderBG = Assets.getBitmapData("assets/graphics/" + Engine.IMG_BASE + "/preloader-bg.png");
			var preloaderBG = Assets.getBitmapData("assets/graphics/preloader-bg.png");
			var bmp = new Bitmap(preloaderBG);
			bmp.scaleX = getWidth() / preloaderBG.width;
			bmp.scaleY = getHeight() / preloaderBG.height;
			addChild(bmp);
			#end
		
			#if(flash && !air)
			if(true)
			{
				var data = haxe.Resource.getBytes("preloader-bg");
				var imgLoader = new openfl.display.Loader();
				var arr = data.getData();
				imgLoader.loadBytes(arr);
				addChild(imgLoader);
			}
			#end
			
			#if js
			if(true)
			{
				try
				{
					var data = haxe.Resource.getString("preloader-bg");
					
					var parentBackground = new Sprite();
					addChild(parentBackground);
					
					BitmapData.fromBase64(data, "png", function(bitmapData:BitmapData) 
					{
						var bitmap = new Bitmap(bitmapData);
						parentBackground.addChild(bitmap);
					});
				}
				
				catch(msg:String)
				{
					trace("(You probably have a old browser) Error occurred: " + msg);
				}
			}
			#end
		}
		
		if(false)
		{
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
			return;
		}
	
		//Bar
		var barBorderColor = -12303292;
		var barBackgroundColor = -12303292;
		var barColor = -7829368;
	
		var borderThickness = gameScale * 2;
		barWidth = Std.int(gameScale * 120);
		barHeight = Std.int(gameScale * 8);
	
		var offsetX = gameScale * 0;
		var offsetY = gameScale * 0;
	
		var barX = getWidth() / 2 - barWidth / 2;
		var barY = getHeight() / 2 - barHeight / 2;
		
		barBorder = new Sprite();
		barBorder.graphics.beginFill(barBorderColor, 1);
		barBorder.graphics.drawRect(-borderThickness, -borderThickness, barWidth + borderThickness * 2, barHeight + borderThickness * 2);
		barBorder.x = barX + offsetX;
		barBorder.y = barY + offsetY;
		addChild(barBorder);
	
		barBackground = new Sprite();
		barBackground.graphics.beginFill(barBackgroundColor, 1);
		barBackground.graphics.drawRect(0, 0, barWidth, barHeight);
		barBackground.x = barX + offsetX;
		barBackground.y = barY + offsetY;
		barBackground.scaleX = 1;
		addChild(barBackground);
	
		bar = new Sprite();
		bar.graphics.beginFill(barColor, 1);
		bar.graphics.drawRect(0, 0, barWidth, barHeight);
		
		//Setting scaleX = 0 was buggy on HTML5, so we clip instead
		var r = new openfl.geom.Rectangle(0, 0, 0, barHeight);
		bar.scrollRect = r;
		
		bar.x = barX + offsetX;
		bar.y = barY + offsetY;
		addChild(bar);
		
		#if(flash && !air)
		if(true)
		{
			var data = haxe.Resource.getBytes("preloader-badge");
			var imgLoader = new openfl.display.Loader();
			var arr = data.getData();
			imgLoader.loadBytes(arr);
			addChild(imgLoader);
			
			imgLoader.x = getWidth() - 114 - 5;
			imgLoader.y = getHeight() - 62 - 5;
		}
		#end
	
		if(getURL() != "")
		{
			addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown, false, 2);
		}
		
		//---
		
		#if(flash || js)
		var lockURL = getLockURL();
		
		if(isSiteLocked() && (lockURL != null && lockURL != ""))
		{
			var ok = false;
			var currURL = Lib.current.loaderInfo.url;
			
			if(currURL == null)
			{
				ok = true;
				//trace("Local - HTML5");
			}
			
			else if(currURL.indexOf("http://") < 0 && currURL.indexOf("https://") < 0)
			{
				ok = true;
				//trace("Local - Flash");
			}
			
			//TODO: What if the site's URL coincidentally contains localhost? Tricked.
			else if((currURL.indexOf("stencyl.com") > 0) || (currURL.indexOf("localhost") > 0))
			{
				ok = true;
				//trace("OK - Stencyl.com or localhost");
			}
			
			if(!ok)
			{
				//site lock value can be a comma delimited list of sites
				var siteArray = lockURL.split(",");	
				
				//check to see if we're playing from a valid site
				for(site in siteArray)
				{
					if(currURL != null && currURL.indexOf(site) >= 0)
					{
						ok = true;
					}
				}
				
				//no matches found, show the error message
				if(!ok)
				{
					showLockScreen(siteArray[0]);
					return;
				}
			}	
		}
		#end
		
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	public function getLockURL():String
	{
		return "";
	}
	
	public function isSiteLocked():Bool
	{
		return false;
	}
	
	public function showLockScreen(realURL:String)
	{
		//trace("Show Lock Screen");
		locked = true;
		
		com.stencyl.utils.Utils.removeAllChildren(this);
	
		var tmp = new openfl.display.Bitmap(new openfl.display.BitmapData(Std.int(getWidth()), Std.int(getHeight()), false, 0x565656));
		addChild(tmp);

		var txt = new openfl.text.TextField();
		txt.width = getWidth() - 16;
		txt.height = getHeight() - 16;
		txt.x = 8;
		txt.y = 8;
		txt.textColor = 0xffffff;
		txt.multiline = true;
		txt.wordWrap = true;
	
		var lockText = "Hi there!  It looks like somebody copied this game without my permission. Just click anywhere, or copy-paste this URL into your browser.\n\n"+realURL+"\n\nThanks, and have fun!";
		txt.text = lockText;
		addChild(txt);
		
		removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		txt.addEventListener(openfl.events.MouseEvent.CLICK, goToLockURL);
		tmp.addEventListener(openfl.events.MouseEvent.CLICK, goToLockURL);
	}
	
	public function getURL():String
	{
		return "";
	}
	
	public function goToLockURL(e:MouseEvent):Void
	{
		openfl.Lib.getURL(new openfl.net.URLRequest(getLockURL()), "_parent");
	}
	
	public function onMouseDown(e:MouseEvent):Void
	{
		removeEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		openfl.Lib.getURL(new openfl.net.URLRequest(getURL()), "_blank");
	}
	
	#if(flash || js || cppia || !openfl_legacy) override #end public function getBackgroundColor():Int
	{
		return 0x336699;
	}
	
	#if(flash || js || cppia || !openfl_legacy) override #end public function getWidth():Float
	{
		return 640.0;
	}
	
	#if(flash || js || cppia || !openfl_legacy) override #end public function getHeight():Float
	{
		return 480.0;
	}
	
	#if(flash || js || cppia || !openfl_legacy) override #end public function onInit()
	{
	}
	
	#if(flash || js || cppia || !openfl_legacy) override #end public function onLoaded()
	{
		if(adFinished)
		{
			#if(flash || js)
			if(isSiteLocked() && locked)
			{
				return;
			}
			#end
			
			dispatchEvent(new Event(Event.COMPLETE));
		}
	}
	
	#if(flash || js || cppia || !openfl_legacy) override #end public function onUpdate(bytesLoaded:Int, bytesTotal:Int)
	{
		var percentLoaded = bytesLoaded / bytesTotal;
	
		if(percentLoaded > 1)
		{
			percentLoaded == 1;
		}
	
		if(bar != null)
		{
			//This approach was buggy on HTML5
			//bar.scaleX = percentLoaded;
			
			var r = new openfl.geom.Rectangle(0, 0, barWidth * percentLoaded, barHeight);
			bar.scrollRect = r;
		}
	}
	
	public function onEnterFrame(event:Event)
	{
		if(!started)
		{
			started = true;
			
			#if flash
			
			#end
		}
	}
	
	#if(flash && !air)
	
	#end
}