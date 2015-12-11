package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.text.Font;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if (js && html5)
import lime.net.URLLoader;
import lime.net.URLRequest;
#elseif flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if flash
		
		className.set ("assets/graphics/1.5x/sprite-4-0.png", __ASSET__assets_graphics_1_5x_sprite_4_0_png);
		type.set ("assets/graphics/1.5x/sprite-4-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/1.5x/sprite-4-1.png", __ASSET__assets_graphics_1_5x_sprite_4_1_png);
		type.set ("assets/graphics/1.5x/sprite-4-1.png", AssetType.IMAGE);
		className.set ("assets/graphics/1.5x/sprite-4-2.png", __ASSET__assets_graphics_1_5x_sprite_4_2_png);
		type.set ("assets/graphics/1.5x/sprite-4-2.png", AssetType.IMAGE);
		className.set ("assets/graphics/1.5x/sprite-4-3.png", __ASSET__assets_graphics_1_5x_sprite_4_3_png);
		type.set ("assets/graphics/1.5x/sprite-4-3.png", AssetType.IMAGE);
		className.set ("assets/graphics/1.5x/sprite-4-4.png", __ASSET__assets_graphics_1_5x_sprite_4_4_png);
		type.set ("assets/graphics/1.5x/sprite-4-4.png", AssetType.IMAGE);
		className.set ("assets/graphics/1.5x/sprite-4-5.png", __ASSET__assets_graphics_1_5x_sprite_4_5_png);
		type.set ("assets/graphics/1.5x/sprite-4-5.png", AssetType.IMAGE);
		className.set ("assets/graphics/1.5x/sprite-6-0.png", __ASSET__assets_graphics_1_5x_sprite_6_0_png);
		type.set ("assets/graphics/1.5x/sprite-6-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/1.5x/sprite-6-1.png", __ASSET__assets_graphics_1_5x_sprite_6_1_png);
		type.set ("assets/graphics/1.5x/sprite-6-1.png", AssetType.IMAGE);
		className.set ("assets/graphics/1.5x/tileset-0.png", __ASSET__assets_graphics_1_5x_tileset_0_png);
		type.set ("assets/graphics/1.5x/tileset-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/1x/sprite-4-0.png", __ASSET__assets_graphics_1x_sprite_4_0_png);
		type.set ("assets/graphics/1x/sprite-4-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/1x/sprite-4-1.png", __ASSET__assets_graphics_1x_sprite_4_1_png);
		type.set ("assets/graphics/1x/sprite-4-1.png", AssetType.IMAGE);
		className.set ("assets/graphics/1x/sprite-4-2.png", __ASSET__assets_graphics_1x_sprite_4_2_png);
		type.set ("assets/graphics/1x/sprite-4-2.png", AssetType.IMAGE);
		className.set ("assets/graphics/1x/sprite-4-3.png", __ASSET__assets_graphics_1x_sprite_4_3_png);
		type.set ("assets/graphics/1x/sprite-4-3.png", AssetType.IMAGE);
		className.set ("assets/graphics/1x/sprite-4-4.png", __ASSET__assets_graphics_1x_sprite_4_4_png);
		type.set ("assets/graphics/1x/sprite-4-4.png", AssetType.IMAGE);
		className.set ("assets/graphics/1x/sprite-4-5.png", __ASSET__assets_graphics_1x_sprite_4_5_png);
		type.set ("assets/graphics/1x/sprite-4-5.png", AssetType.IMAGE);
		className.set ("assets/graphics/1x/sprite-6-0.png", __ASSET__assets_graphics_1x_sprite_6_0_png);
		type.set ("assets/graphics/1x/sprite-6-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/1x/sprite-6-1.png", __ASSET__assets_graphics_1x_sprite_6_1_png);
		type.set ("assets/graphics/1x/sprite-6-1.png", AssetType.IMAGE);
		className.set ("assets/graphics/1x/tileset-0.png", __ASSET__assets_graphics_1x_tileset_0_png);
		type.set ("assets/graphics/1x/tileset-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/2x/sprite-4-0.png", __ASSET__assets_graphics_2x_sprite_4_0_png);
		type.set ("assets/graphics/2x/sprite-4-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/2x/sprite-4-1.png", __ASSET__assets_graphics_2x_sprite_4_1_png);
		type.set ("assets/graphics/2x/sprite-4-1.png", AssetType.IMAGE);
		className.set ("assets/graphics/2x/sprite-4-2.png", __ASSET__assets_graphics_2x_sprite_4_2_png);
		type.set ("assets/graphics/2x/sprite-4-2.png", AssetType.IMAGE);
		className.set ("assets/graphics/2x/sprite-4-3.png", __ASSET__assets_graphics_2x_sprite_4_3_png);
		type.set ("assets/graphics/2x/sprite-4-3.png", AssetType.IMAGE);
		className.set ("assets/graphics/2x/sprite-4-4.png", __ASSET__assets_graphics_2x_sprite_4_4_png);
		type.set ("assets/graphics/2x/sprite-4-4.png", AssetType.IMAGE);
		className.set ("assets/graphics/2x/sprite-4-5.png", __ASSET__assets_graphics_2x_sprite_4_5_png);
		type.set ("assets/graphics/2x/sprite-4-5.png", AssetType.IMAGE);
		className.set ("assets/graphics/2x/sprite-6-0.png", __ASSET__assets_graphics_2x_sprite_6_0_png);
		type.set ("assets/graphics/2x/sprite-6-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/2x/sprite-6-1.png", __ASSET__assets_graphics_2x_sprite_6_1_png);
		type.set ("assets/graphics/2x/sprite-6-1.png", AssetType.IMAGE);
		className.set ("assets/graphics/2x/tileset-0.png", __ASSET__assets_graphics_2x_tileset_0_png);
		type.set ("assets/graphics/2x/tileset-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/4x/sprite-4-0.png", __ASSET__assets_graphics_4x_sprite_4_0_png);
		type.set ("assets/graphics/4x/sprite-4-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/4x/sprite-4-1.png", __ASSET__assets_graphics_4x_sprite_4_1_png);
		type.set ("assets/graphics/4x/sprite-4-1.png", AssetType.IMAGE);
		className.set ("assets/graphics/4x/sprite-4-2.png", __ASSET__assets_graphics_4x_sprite_4_2_png);
		type.set ("assets/graphics/4x/sprite-4-2.png", AssetType.IMAGE);
		className.set ("assets/graphics/4x/sprite-4-3.png", __ASSET__assets_graphics_4x_sprite_4_3_png);
		type.set ("assets/graphics/4x/sprite-4-3.png", AssetType.IMAGE);
		className.set ("assets/graphics/4x/sprite-4-4.png", __ASSET__assets_graphics_4x_sprite_4_4_png);
		type.set ("assets/graphics/4x/sprite-4-4.png", AssetType.IMAGE);
		className.set ("assets/graphics/4x/sprite-4-5.png", __ASSET__assets_graphics_4x_sprite_4_5_png);
		type.set ("assets/graphics/4x/sprite-4-5.png", AssetType.IMAGE);
		className.set ("assets/graphics/4x/sprite-6-0.png", __ASSET__assets_graphics_4x_sprite_6_0_png);
		type.set ("assets/graphics/4x/sprite-6-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/4x/sprite-6-1.png", __ASSET__assets_graphics_4x_sprite_6_1_png);
		type.set ("assets/graphics/4x/sprite-6-1.png", AssetType.IMAGE);
		className.set ("assets/graphics/4x/tileset-0.png", __ASSET__assets_graphics_4x_tileset_0_png);
		type.set ("assets/graphics/4x/tileset-0.png", AssetType.IMAGE);
		className.set ("assets/graphics/default-font.fnt", __ASSET__assets_graphics_default_font_fnt);
		type.set ("assets/graphics/default-font.fnt", AssetType.TEXT);
		className.set ("assets/graphics/default-font.png", __ASSET__assets_graphics_default_font_png);
		type.set ("assets/graphics/default-font.png", AssetType.IMAGE);
		className.set ("assets/graphics/preloader-badge.png", __ASSET__assets_graphics_preloader_badge_png);
		type.set ("assets/graphics/preloader-badge.png", AssetType.IMAGE);
		className.set ("assets/graphics/preloader-bg.png", __ASSET__assets_graphics_preloader_bg_png);
		type.set ("assets/graphics/preloader-bg.png", AssetType.IMAGE);
		className.set ("assets/graphics/preloader-bg@1.5x.png", __ASSET__assets_graphics_preloader_bg_1_5x_png);
		type.set ("assets/graphics/preloader-bg@1.5x.png", AssetType.IMAGE);
		className.set ("assets/graphics/preloader-bg@2x.png", __ASSET__assets_graphics_preloader_bg_2x_png);
		type.set ("assets/graphics/preloader-bg@2x.png", AssetType.IMAGE);
		className.set ("assets/graphics/preloader-bg@4x.png", __ASSET__assets_graphics_preloader_bg_4x_png);
		type.set ("assets/graphics/preloader-bg@4x.png", AssetType.IMAGE);
		className.set ("assets/sfx/sound-1.mp3", __ASSET__assets_sfx_sound_1_mp3);
		type.set ("assets/sfx/sound-1.mp3", AssetType.SOUND);
		className.set ("assets/sfx/sound-2.mp3", __ASSET__assets_sfx_sound_2_mp3);
		type.set ("assets/sfx/sound-2.mp3", AssetType.SOUND);
		className.set ("assets/data/behaviors.xml", __ASSET__assets_data_behaviors_xml);
		type.set ("assets/data/behaviors.xml", AssetType.TEXT);
		className.set ("assets/data/game.xml", __ASSET__assets_data_game_xml);
		type.set ("assets/data/game.xml", AssetType.TEXT);
		className.set ("assets/data/resources.xml", __ASSET__assets_data_resources_xml);
		type.set ("assets/data/resources.xml", AssetType.TEXT);
		className.set ("assets/data/scene-0.scn", __ASSET__assets_data_scene_0_scn);
		type.set ("assets/data/scene-0.scn", AssetType.BINARY);
		className.set ("assets/data/scene-0.xml", __ASSET__assets_data_scene_0_xml);
		type.set ("assets/data/scene-0.xml", AssetType.TEXT);
		className.set ("assets/data/scenes.xml", __ASSET__assets_data_scenes_xml);
		type.set ("assets/data/scenes.xml", AssetType.TEXT);
		
		
		#elseif html5
		
		var id;
		id = "assets/graphics/1.5x/sprite-4-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1.5x/sprite-4-1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1.5x/sprite-4-2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1.5x/sprite-4-3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1.5x/sprite-4-4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1.5x/sprite-4-5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1.5x/sprite-6-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1.5x/sprite-6-1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1.5x/tileset-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1x/sprite-4-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1x/sprite-4-1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1x/sprite-4-2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1x/sprite-4-3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1x/sprite-4-4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1x/sprite-4-5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1x/sprite-6-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1x/sprite-6-1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/1x/tileset-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/2x/sprite-4-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/2x/sprite-4-1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/2x/sprite-4-2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/2x/sprite-4-3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/2x/sprite-4-4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/2x/sprite-4-5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/2x/sprite-6-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/2x/sprite-6-1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/2x/tileset-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/4x/sprite-4-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/4x/sprite-4-1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/4x/sprite-4-2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/4x/sprite-4-3.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/4x/sprite-4-4.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/4x/sprite-4-5.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/4x/sprite-6-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/4x/sprite-6-1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/4x/tileset-0.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/default-font.fnt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/graphics/default-font.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/preloader-badge.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/preloader-bg.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/preloader-bg@1.5x.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/preloader-bg@2x.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/graphics/preloader-bg@4x.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sfx/sound-1.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sfx/sound-2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/data/behaviors.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/game.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/resources.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/scene-0.scn";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/data/scene-0.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/scenes.xml";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/graphics/1.5x/sprite-4-0.png", __ASSET__assets_graphics_1_5x_sprite_4_0_png);
		type.set ("assets/graphics/1.5x/sprite-4-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1.5x/sprite-4-1.png", __ASSET__assets_graphics_1_5x_sprite_4_1_png);
		type.set ("assets/graphics/1.5x/sprite-4-1.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1.5x/sprite-4-2.png", __ASSET__assets_graphics_1_5x_sprite_4_2_png);
		type.set ("assets/graphics/1.5x/sprite-4-2.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1.5x/sprite-4-3.png", __ASSET__assets_graphics_1_5x_sprite_4_3_png);
		type.set ("assets/graphics/1.5x/sprite-4-3.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1.5x/sprite-4-4.png", __ASSET__assets_graphics_1_5x_sprite_4_4_png);
		type.set ("assets/graphics/1.5x/sprite-4-4.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1.5x/sprite-4-5.png", __ASSET__assets_graphics_1_5x_sprite_4_5_png);
		type.set ("assets/graphics/1.5x/sprite-4-5.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1.5x/sprite-6-0.png", __ASSET__assets_graphics_1_5x_sprite_6_0_png);
		type.set ("assets/graphics/1.5x/sprite-6-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1.5x/sprite-6-1.png", __ASSET__assets_graphics_1_5x_sprite_6_1_png);
		type.set ("assets/graphics/1.5x/sprite-6-1.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1.5x/tileset-0.png", __ASSET__assets_graphics_1_5x_tileset_0_png);
		type.set ("assets/graphics/1.5x/tileset-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1x/sprite-4-0.png", __ASSET__assets_graphics_1x_sprite_4_0_png);
		type.set ("assets/graphics/1x/sprite-4-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1x/sprite-4-1.png", __ASSET__assets_graphics_1x_sprite_4_1_png);
		type.set ("assets/graphics/1x/sprite-4-1.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1x/sprite-4-2.png", __ASSET__assets_graphics_1x_sprite_4_2_png);
		type.set ("assets/graphics/1x/sprite-4-2.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1x/sprite-4-3.png", __ASSET__assets_graphics_1x_sprite_4_3_png);
		type.set ("assets/graphics/1x/sprite-4-3.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1x/sprite-4-4.png", __ASSET__assets_graphics_1x_sprite_4_4_png);
		type.set ("assets/graphics/1x/sprite-4-4.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1x/sprite-4-5.png", __ASSET__assets_graphics_1x_sprite_4_5_png);
		type.set ("assets/graphics/1x/sprite-4-5.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1x/sprite-6-0.png", __ASSET__assets_graphics_1x_sprite_6_0_png);
		type.set ("assets/graphics/1x/sprite-6-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1x/sprite-6-1.png", __ASSET__assets_graphics_1x_sprite_6_1_png);
		type.set ("assets/graphics/1x/sprite-6-1.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/1x/tileset-0.png", __ASSET__assets_graphics_1x_tileset_0_png);
		type.set ("assets/graphics/1x/tileset-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/2x/sprite-4-0.png", __ASSET__assets_graphics_2x_sprite_4_0_png);
		type.set ("assets/graphics/2x/sprite-4-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/2x/sprite-4-1.png", __ASSET__assets_graphics_2x_sprite_4_1_png);
		type.set ("assets/graphics/2x/sprite-4-1.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/2x/sprite-4-2.png", __ASSET__assets_graphics_2x_sprite_4_2_png);
		type.set ("assets/graphics/2x/sprite-4-2.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/2x/sprite-4-3.png", __ASSET__assets_graphics_2x_sprite_4_3_png);
		type.set ("assets/graphics/2x/sprite-4-3.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/2x/sprite-4-4.png", __ASSET__assets_graphics_2x_sprite_4_4_png);
		type.set ("assets/graphics/2x/sprite-4-4.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/2x/sprite-4-5.png", __ASSET__assets_graphics_2x_sprite_4_5_png);
		type.set ("assets/graphics/2x/sprite-4-5.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/2x/sprite-6-0.png", __ASSET__assets_graphics_2x_sprite_6_0_png);
		type.set ("assets/graphics/2x/sprite-6-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/2x/sprite-6-1.png", __ASSET__assets_graphics_2x_sprite_6_1_png);
		type.set ("assets/graphics/2x/sprite-6-1.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/2x/tileset-0.png", __ASSET__assets_graphics_2x_tileset_0_png);
		type.set ("assets/graphics/2x/tileset-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/4x/sprite-4-0.png", __ASSET__assets_graphics_4x_sprite_4_0_png);
		type.set ("assets/graphics/4x/sprite-4-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/4x/sprite-4-1.png", __ASSET__assets_graphics_4x_sprite_4_1_png);
		type.set ("assets/graphics/4x/sprite-4-1.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/4x/sprite-4-2.png", __ASSET__assets_graphics_4x_sprite_4_2_png);
		type.set ("assets/graphics/4x/sprite-4-2.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/4x/sprite-4-3.png", __ASSET__assets_graphics_4x_sprite_4_3_png);
		type.set ("assets/graphics/4x/sprite-4-3.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/4x/sprite-4-4.png", __ASSET__assets_graphics_4x_sprite_4_4_png);
		type.set ("assets/graphics/4x/sprite-4-4.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/4x/sprite-4-5.png", __ASSET__assets_graphics_4x_sprite_4_5_png);
		type.set ("assets/graphics/4x/sprite-4-5.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/4x/sprite-6-0.png", __ASSET__assets_graphics_4x_sprite_6_0_png);
		type.set ("assets/graphics/4x/sprite-6-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/4x/sprite-6-1.png", __ASSET__assets_graphics_4x_sprite_6_1_png);
		type.set ("assets/graphics/4x/sprite-6-1.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/4x/tileset-0.png", __ASSET__assets_graphics_4x_tileset_0_png);
		type.set ("assets/graphics/4x/tileset-0.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/default-font.fnt", __ASSET__assets_graphics_default_font_fnt);
		type.set ("assets/graphics/default-font.fnt", AssetType.TEXT);
		
		className.set ("assets/graphics/default-font.png", __ASSET__assets_graphics_default_font_png);
		type.set ("assets/graphics/default-font.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/preloader-badge.png", __ASSET__assets_graphics_preloader_badge_png);
		type.set ("assets/graphics/preloader-badge.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/preloader-bg.png", __ASSET__assets_graphics_preloader_bg_png);
		type.set ("assets/graphics/preloader-bg.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/preloader-bg@1.5x.png", __ASSET__assets_graphics_preloader_bg_1_5x_png);
		type.set ("assets/graphics/preloader-bg@1.5x.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/preloader-bg@2x.png", __ASSET__assets_graphics_preloader_bg_2x_png);
		type.set ("assets/graphics/preloader-bg@2x.png", AssetType.IMAGE);
		
		className.set ("assets/graphics/preloader-bg@4x.png", __ASSET__assets_graphics_preloader_bg_4x_png);
		type.set ("assets/graphics/preloader-bg@4x.png", AssetType.IMAGE);
		
		className.set ("assets/sfx/sound-1.mp3", __ASSET__assets_sfx_sound_1_mp3);
		type.set ("assets/sfx/sound-1.mp3", AssetType.SOUND);
		
		className.set ("assets/sfx/sound-2.mp3", __ASSET__assets_sfx_sound_2_mp3);
		type.set ("assets/sfx/sound-2.mp3", AssetType.SOUND);
		
		className.set ("assets/data/behaviors.xml", __ASSET__assets_data_behaviors_xml);
		type.set ("assets/data/behaviors.xml", AssetType.TEXT);
		
		className.set ("assets/data/game.xml", __ASSET__assets_data_game_xml);
		type.set ("assets/data/game.xml", AssetType.TEXT);
		
		className.set ("assets/data/resources.xml", __ASSET__assets_data_resources_xml);
		type.set ("assets/data/resources.xml", AssetType.TEXT);
		
		className.set ("assets/data/scene-0.scn", __ASSET__assets_data_scene_0_scn);
		type.set ("assets/data/scene-0.scn", AssetType.BINARY);
		
		className.set ("assets/data/scene-0.xml", __ASSET__assets_data_scene_0_xml);
		type.set ("assets/data/scene-0.xml", AssetType.TEXT);
		
		className.set ("assets/data/scenes.xml", __ASSET__assets_data_scenes_xml);
		type.set ("assets/data/scenes.xml", AssetType.TEXT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), ByteArray));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return cast (Type.createInstance (className.get (id), []), ByteArray);
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return bitmapData.getPixels (bitmapData.rect);
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		else return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var data = loader.data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<ByteArray> {
		
		var promise = new Promise<ByteArray> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.dataFormat = BINARY;
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, e) {
				
				promise.error (e);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<ByteArray> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id);
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = ByteArray.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.onComplete.add (function (_):Void {
				
				promise.complete (loader.data);
				
			});
			loader.onProgress.add (function (_, loaded, total) {
				
				if (total == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (loaded / total);
					
				}
				
			});
			loader.onIOError.add (function (_, msg) promise.error (msg));
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.readUTFBytes (bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1_5x_sprite_6_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1_5x_sprite_6_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1_5x_tileset_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1x_sprite_4_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1x_sprite_4_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1x_sprite_4_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1x_sprite_4_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1x_sprite_4_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1x_sprite_4_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1x_sprite_6_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1x_sprite_6_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_1x_tileset_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_2x_sprite_4_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_2x_sprite_4_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_2x_sprite_4_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_2x_sprite_4_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_2x_sprite_4_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_2x_sprite_4_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_2x_sprite_6_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_2x_sprite_6_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_2x_tileset_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_4x_sprite_4_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_4x_sprite_4_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_4x_sprite_4_2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_4x_sprite_4_3_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_4x_sprite_4_4_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_4x_sprite_4_5_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_4x_sprite_6_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_4x_sprite_6_1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_4x_tileset_0_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_default_font_fnt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_default_font_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_preloader_badge_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_preloader_bg_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_preloader_bg_1_5x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_preloader_bg_2x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_graphics_preloader_bg_4x_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sfx_sound_1_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sfx_sound_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_data_behaviors_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_game_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_resources_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_scene_0_scn extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_scene_0_xml extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_scenes_xml extends flash.utils.ByteArray { }


#elseif html5






















































#else



#if (windows || mac || linux || cpp)


@:image("Assets/graphics/1.5x/sprite-4-0.png") #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/1.5x/sprite-4-1.png") #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_1_png extends lime.graphics.Image {}
@:image("Assets/graphics/1.5x/sprite-4-2.png") #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_2_png extends lime.graphics.Image {}
@:image("Assets/graphics/1.5x/sprite-4-3.png") #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_3_png extends lime.graphics.Image {}
@:image("Assets/graphics/1.5x/sprite-4-4.png") #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_4_png extends lime.graphics.Image {}
@:image("Assets/graphics/1.5x/sprite-4-5.png") #if display private #end class __ASSET__assets_graphics_1_5x_sprite_4_5_png extends lime.graphics.Image {}
@:image("Assets/graphics/1.5x/sprite-6-0.png") #if display private #end class __ASSET__assets_graphics_1_5x_sprite_6_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/1.5x/sprite-6-1.png") #if display private #end class __ASSET__assets_graphics_1_5x_sprite_6_1_png extends lime.graphics.Image {}
@:image("Assets/graphics/1.5x/tileset-0.png") #if display private #end class __ASSET__assets_graphics_1_5x_tileset_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/1x/sprite-4-0.png") #if display private #end class __ASSET__assets_graphics_1x_sprite_4_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/1x/sprite-4-1.png") #if display private #end class __ASSET__assets_graphics_1x_sprite_4_1_png extends lime.graphics.Image {}
@:image("Assets/graphics/1x/sprite-4-2.png") #if display private #end class __ASSET__assets_graphics_1x_sprite_4_2_png extends lime.graphics.Image {}
@:image("Assets/graphics/1x/sprite-4-3.png") #if display private #end class __ASSET__assets_graphics_1x_sprite_4_3_png extends lime.graphics.Image {}
@:image("Assets/graphics/1x/sprite-4-4.png") #if display private #end class __ASSET__assets_graphics_1x_sprite_4_4_png extends lime.graphics.Image {}
@:image("Assets/graphics/1x/sprite-4-5.png") #if display private #end class __ASSET__assets_graphics_1x_sprite_4_5_png extends lime.graphics.Image {}
@:image("Assets/graphics/1x/sprite-6-0.png") #if display private #end class __ASSET__assets_graphics_1x_sprite_6_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/1x/sprite-6-1.png") #if display private #end class __ASSET__assets_graphics_1x_sprite_6_1_png extends lime.graphics.Image {}
@:image("Assets/graphics/1x/tileset-0.png") #if display private #end class __ASSET__assets_graphics_1x_tileset_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/2x/sprite-4-0.png") #if display private #end class __ASSET__assets_graphics_2x_sprite_4_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/2x/sprite-4-1.png") #if display private #end class __ASSET__assets_graphics_2x_sprite_4_1_png extends lime.graphics.Image {}
@:image("Assets/graphics/2x/sprite-4-2.png") #if display private #end class __ASSET__assets_graphics_2x_sprite_4_2_png extends lime.graphics.Image {}
@:image("Assets/graphics/2x/sprite-4-3.png") #if display private #end class __ASSET__assets_graphics_2x_sprite_4_3_png extends lime.graphics.Image {}
@:image("Assets/graphics/2x/sprite-4-4.png") #if display private #end class __ASSET__assets_graphics_2x_sprite_4_4_png extends lime.graphics.Image {}
@:image("Assets/graphics/2x/sprite-4-5.png") #if display private #end class __ASSET__assets_graphics_2x_sprite_4_5_png extends lime.graphics.Image {}
@:image("Assets/graphics/2x/sprite-6-0.png") #if display private #end class __ASSET__assets_graphics_2x_sprite_6_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/2x/sprite-6-1.png") #if display private #end class __ASSET__assets_graphics_2x_sprite_6_1_png extends lime.graphics.Image {}
@:image("Assets/graphics/2x/tileset-0.png") #if display private #end class __ASSET__assets_graphics_2x_tileset_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/4x/sprite-4-0.png") #if display private #end class __ASSET__assets_graphics_4x_sprite_4_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/4x/sprite-4-1.png") #if display private #end class __ASSET__assets_graphics_4x_sprite_4_1_png extends lime.graphics.Image {}
@:image("Assets/graphics/4x/sprite-4-2.png") #if display private #end class __ASSET__assets_graphics_4x_sprite_4_2_png extends lime.graphics.Image {}
@:image("Assets/graphics/4x/sprite-4-3.png") #if display private #end class __ASSET__assets_graphics_4x_sprite_4_3_png extends lime.graphics.Image {}
@:image("Assets/graphics/4x/sprite-4-4.png") #if display private #end class __ASSET__assets_graphics_4x_sprite_4_4_png extends lime.graphics.Image {}
@:image("Assets/graphics/4x/sprite-4-5.png") #if display private #end class __ASSET__assets_graphics_4x_sprite_4_5_png extends lime.graphics.Image {}
@:image("Assets/graphics/4x/sprite-6-0.png") #if display private #end class __ASSET__assets_graphics_4x_sprite_6_0_png extends lime.graphics.Image {}
@:image("Assets/graphics/4x/sprite-6-1.png") #if display private #end class __ASSET__assets_graphics_4x_sprite_6_1_png extends lime.graphics.Image {}
@:image("Assets/graphics/4x/tileset-0.png") #if display private #end class __ASSET__assets_graphics_4x_tileset_0_png extends lime.graphics.Image {}
@:file("Assets/graphics/default-font.fnt") #if display private #end class __ASSET__assets_graphics_default_font_fnt extends lime.utils.ByteArray {}
@:image("Assets/graphics/default-font.png") #if display private #end class __ASSET__assets_graphics_default_font_png extends lime.graphics.Image {}
@:image("Assets/graphics/preloader-badge.png") #if display private #end class __ASSET__assets_graphics_preloader_badge_png extends lime.graphics.Image {}
@:image("Assets/graphics/preloader-bg.png") #if display private #end class __ASSET__assets_graphics_preloader_bg_png extends lime.graphics.Image {}
@:image("Assets/graphics/preloader-bg@1.5x.png") #if display private #end class __ASSET__assets_graphics_preloader_bg_1_5x_png extends lime.graphics.Image {}
@:image("Assets/graphics/preloader-bg@2x.png") #if display private #end class __ASSET__assets_graphics_preloader_bg_2x_png extends lime.graphics.Image {}
@:image("Assets/graphics/preloader-bg@4x.png") #if display private #end class __ASSET__assets_graphics_preloader_bg_4x_png extends lime.graphics.Image {}
@:file("Assets/sfx/sound-1.mp3") #if display private #end class __ASSET__assets_sfx_sound_1_mp3 extends lime.utils.ByteArray {}
@:file("Assets/sfx/sound-2.mp3") #if display private #end class __ASSET__assets_sfx_sound_2_mp3 extends lime.utils.ByteArray {}
@:file("Assets/data/behaviors.xml") #if display private #end class __ASSET__assets_data_behaviors_xml extends lime.utils.ByteArray {}
@:file("Assets/data/game.xml") #if display private #end class __ASSET__assets_data_game_xml extends lime.utils.ByteArray {}
@:file("Assets/data/resources.xml") #if display private #end class __ASSET__assets_data_resources_xml extends lime.utils.ByteArray {}
@:file("Assets/data/scene-0.scn") #if display private #end class __ASSET__assets_data_scene_0_scn extends lime.utils.ByteArray {}
@:file("Assets/data/scene-0.xml") #if display private #end class __ASSET__assets_data_scene_0_xml extends lime.utils.ByteArray {}
@:file("Assets/data/scenes.xml") #if display private #end class __ASSET__assets_data_scenes_xml extends lime.utils.ByteArray {}



#end
#end

#if (openfl && !flash)

#end

#end