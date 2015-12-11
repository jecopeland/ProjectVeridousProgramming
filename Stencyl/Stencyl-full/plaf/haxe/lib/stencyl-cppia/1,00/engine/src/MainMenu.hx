package;

import lime.tools.helpers.*;

import openfl.Lib;
import openfl.display.*;
import openfl.events.*;
import openfl.geom.*;
import openfl.text.*;
import openfl.utils.*;

import sys.*;
import sys.io.*;

class MainMenu extends Sprite
{
  public static var GAMES_GENERATED:String;

  public static inline var WIDTH = 640;
  public static inline var HEIGHT = 480;

  public static function display()
  {
    Lib.create
    (
      function ()
      {
        var lib = Lib.current;
  			lib.stage.align = StageAlign.TOP_LEFT;
  			lib.stage.scaleMode = StageScaleMode.NO_SCALE;
  			lib.loaderInfo = LoaderInfo.create(null);
        lib.addChild(new MainMenu());
  		},
  		WIDTH, HEIGHT,
  		65,
  		0,
  		Lib.HARDWARE |
  		Lib.ALLOW_SHADERS |
  		Lib.VSYNC,
  		"StencylCppia",
  		null
  	);
  }

  private var menu:Menu;

  public function new()
  {
    super();

    addEventListener(Event.ADDED_TO_STAGE, init);
    addEventListener(Event.ENTER_FRAME, onUpdate);
  }

  private function init(event:Event):Void
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

    var platform = PathHelper.standardize(Sys.getCwd(), false);

    var parts = platform.split("/");
    parts = parts.slice(0, parts.length - 3);

    var stencylworks = parts.join("/");
    GAMES_GENERATED = '$stencylworks/games-generated';

    var cppiaGames = [];

    for(game in FileSystem.readDirectory(GAMES_GENERATED))
    {
      if(FileSystem.exists('$GAMES_GENERATED/$game/Export/cppia/$game.cppia'))
        cppiaGames.push(game);
    }

    menu = new Menu();
    addChild(menu);
    menu.graphics.beginFill(0xFFFFFF);
    menu.graphics.drawRect(0, 0, WIDTH - Menu.PADDING * 2, HEIGHT - Menu.PADDING * 2);
    menu.graphics.endFill();
    menu.x = Menu.PADDING;
    menu.y = Menu.PADDING;

    for(cppiaGame in cppiaGames)
    {
      menu.addMenuItem(new MenuItem(cppiaGame));
    }
	}

  private function onUpdate(event:Event):Void
  {

  }
}

class Menu extends Sprite
{
  public static inline var WIDTH = 620;
  public static inline var HEIGHT = 460;
  public static inline var PADDING = 10;
  public static inline var COLUMNS = 2;

  public var items:Array<MenuItem> = [];

  public function new()
  {
    super();
  }

  public function addMenuItem(item:MenuItem)
  {
    var index = items.length;

    items.push(item);
    addChild(item);

    var row = Std.int(index / COLUMNS);
    var col = Std.int(index % COLUMNS);

    item.x = PADDING + col * (MenuItem.WIDTH + PADDING);
    item.y = PADDING + row * (MenuItem.HEIGHT + PADDING);
  }
}

class MenuItem extends Sprite
{
  public static inline var WIDTH = (Menu.WIDTH - (Menu.COLUMNS + 1) * 10) / Menu.COLUMNS;
  public static inline var HEIGHT = 50;

  public static var menuItemFormat = {
    var format:TextFormat = new TextFormat();
    format.size = 20;
    //format.align = TextFormatAlign.CENTER;
    format;
  }

  public static var sizes = [16, 24, 32, 48, 72, 76, 96, 120, 128, 152, 256, 512, 1024];

  public static var iconSize = {
    var useSize = 16;

    for(curSize in sizes)
      if(curSize <= HEIGHT)
        useSize = curSize;
    useSize;
  }

  public var game:String;

  public function new(game:String)
  {
    super();

    this.game = game;

    color(0x888888);

    var icon = getIcon(game);
    addChild(icon);
    var iconPad = (HEIGHT - iconSize) / 2;
    icon.x = iconPad;
    icon.y = iconPad;

    var text:TextField = new TextField();
    text.defaultTextFormat = menuItemFormat;
    text.text = game;
    text.selectable = false;
    addChild(text);
    text.x = iconPad * 2 + icon.width + 5;
    text.y = 10;
    text.width = width - 10 - text.x;
    text.height = height - 20;

    addEventListener(MouseEvent.CLICK, onClick);
    addEventListener(MouseEvent.ROLL_OVER, onRollOver);
    addEventListener(MouseEvent.ROLL_OUT, onRollOut);
  }

  public static function getIcon(game:String):Bitmap
  {
    var path = '${MainMenu.GAMES_GENERATED}/$game/Icon-$iconSize.png';
    if(!FileSystem.exists(path))
    {
      trace('Couldn\'t load icon from path: $path');
      return new Bitmap(new BitmapData(iconSize, iconSize, false, 0xFFFFFF));
    }

    var bytes = File.getBytes(path);
    var bitmapData = BitmapData.loadFromBytes(ByteArray.fromBytes(bytes));

    return new Bitmap(bitmapData);
  }

  private function onClick(event:MouseEvent)
  {
    var path = PathHelper.standardize(Sys.executablePath(), false).split("/");
    var folder = path.slice(0, path.length - 1).join("/");
    ProcessHelper.runCommand(folder, path.pop(), ['${MainMenu.GAMES_GENERATED}/$game/Export/cppia/$game.cppia']);
  }

  private function onRollOver(event:MouseEvent)
  {
    color(0x8888DD);
  }

  private function onRollOut(event:MouseEvent)
  {
    color(0x888888);
  }

  private function color(c:Int)
  {
    graphics.clear();
    graphics.lineStyle(2, 0xAAAAAA);
    graphics.beginFill(c);
    graphics.drawRect(0, 0, WIDTH, HEIGHT);
    graphics.endFill();
  }
}
