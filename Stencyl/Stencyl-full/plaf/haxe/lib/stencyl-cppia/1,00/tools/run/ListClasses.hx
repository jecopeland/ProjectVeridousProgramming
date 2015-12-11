package;

import sys.*;
import sys.io.*;

import lime.tools.helpers.*;
import lime.project.*;

using Lambda;
using StringTools;

class ListClasses
{
	public static function list(haxelib:String, className:String, ?include:Array<String> = null, ?excludeList:Array<String> = null):String
	{
		var librarySource = PathHelper.getHaxelib (new Haxelib (haxelib));
		var allFiles = [];
		
		addHaxeFiles(librarySource, allFiles, []);
		
		//or put this in an "include" macro in host hxml
		if(include != null)
			allFiles = allFiles.concat(include);

		//put all the items in the exclude list into a map.
		var exclude = {
			var m = new Map<String,Int>();
			excludeList.iter(function(e) m.set(e, 1));
			m;
		}

		var imports = allFiles
					.filter(function(name) return !exclude.exists(name))
					.map(function(name) return 'import $name;' );
		
		var output = imports.join("\n");
		
		output +=
			'\n\n' +
			'class $className\n' +
			'{\n' +
			'}\n';
		
		return output;
	}
	
	public static function addHaxeFiles(path, list, parts:Array<String>)
	{
		for(filename in FileSystem.readDirectory(path))
		{
			if(filename.endsWith(".hx"))
			{
				list.push(parts.concat([filename.split(".")[0]]).join("."));
			}
			else if(FileSystem.isDirectory(path + "/" + filename))
			{
				addHaxeFiles(path + "/" + filename, list, parts.concat([filename]));
			}
		}
	}
	
	public static var exclude = [
		"com.stencyl.utils.FastIntHash", //compile error
		"com.stencyl.utils.HashMap", //blank file
		"com.stencyl.utils.Kongregate",
		"com.stencyl.utils.cpmstar.AdLoader",
		"com.stencyl.utils.newgrounds.API",
		"com.stencyl.utils.newgrounds.APICommand",
		"com.stencyl.utils.newgrounds.APIConnection",
		"com.stencyl.utils.newgrounds.APIEvent",
		"com.stencyl.utils.newgrounds.APIEventDispatcher",
		"com.stencyl.utils.newgrounds.assets.DefaultMedalIcon",
		"com.stencyl.utils.newgrounds.assets.DefaultSaveIcon",
		"com.stencyl.utils.newgrounds.BitmapLoader",
		"com.stencyl.utils.newgrounds.Bridge",
		"com.stencyl.utils.newgrounds.components.APIConnector",
		"com.stencyl.utils.newgrounds.components.FlashAd",
		"com.stencyl.utils.newgrounds.components.FlashAdBase",
		"com.stencyl.utils.newgrounds.components.MedalPopup",
		"com.stencyl.utils.newgrounds.components.Preloader",
		"com.stencyl.utils.newgrounds.components.SaveBrowser",
		"com.stencyl.utils.newgrounds.components.ScoreBrowser",
		"com.stencyl.utils.newgrounds.components.VoteBar",
		"com.stencyl.utils.newgrounds.crypto.MD5",
		"com.stencyl.utils.newgrounds.crypto.RC4",
		"com.stencyl.utils.newgrounds.encoders.BaseN",
		"com.stencyl.utils.newgrounds.encoders.json.JSON",
		"com.stencyl.utils.newgrounds.encoders.PNGEncoder",
		"com.stencyl.utils.newgrounds.Logger",
		"com.stencyl.utils.newgrounds.Medal",
		"com.stencyl.utils.newgrounds.SaveFile",
		"com.stencyl.utils.newgrounds.SaveGroup",
		"com.stencyl.utils.newgrounds.SaveKey",
		"com.stencyl.utils.newgrounds.SaveQuery",
		"com.stencyl.utils.newgrounds.SaveRating",
		"com.stencyl.utils.newgrounds.Score",
		"com.stencyl.utils.newgrounds.ScoreBoard",
		"com.stencyl.utils.newgrounds.shims.APIShim",
		"com.stencyl.utils.SizedIntHash" //blank file
	];
}

