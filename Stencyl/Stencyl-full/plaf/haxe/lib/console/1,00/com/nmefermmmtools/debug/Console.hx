package com.nmefermmmtools.debug;

import haxe.Log;
import haxe.PosInfos;
import nme.display.Sprite;
import nme.display.Stage;
import nme.geom.Rectangle;
import nme.text.TextField;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.text.TextFieldType;
import nme.net.SharedObject;
import nme.Lib;

import StringTools;
import nme.text.TextFormat;
import nme.text.AntiAliasType;
import nme.text.TextFieldType;

/**
 * ...
 * @author fermmm
 */

class Console 
{
	private static inline var VERSION:String = "1.0";
	/**
	 * The highest depth used when peeking inside collections.
	 */
	private static inline var MAXIMAL_COLLECTION_DEPTH:Int = 2;
	/**
	 * The highest number of elements in a collection to display.
	 */
	private static inline var MAXIMAL_COLLECTION_ELEMENTS:Int = 6;
	
	private static inline var INPUT_BAR_HISTORY_MAX_ELEMENTS:Int = 50;
	
	private static var visualContainer		:Sprite;
	private static var commands				:Map<String, Dynamic>;
	private static var stageRef				:Stage;
	private static var keyCode				:Int;
	private static var ctrlIsDown			:Bool = false;
	private static var ctrlMode				:Bool = true;
	private static var inputBar				:Bar;
	private static var liveDataFields		:Map<String, Bar>;
	private static var chronometers			:Map<String, Chronometer>;
	private static var width				:Float;
	private static var sharedObject			:SharedObject;
	private static var inputBarHistory		:Array<String>;
	private static var historyCurrentIndex	:Int;
	private static var created				:Bool = false;
	public static var height				:Float;
	public static var autosizeToStageHeight	:Bool = true;
	
	
	
	private static var backround:GraphicRectangle;

	/**
	 * 
	 * @param	catchTrace redirect trace to the console.
	 * @param	toggleKeyCode key code to display the console, default: ctrl+1
	 * @param	withControlKeyPressed specify if control key must be pressed along with the toggle key to display the console.
	 */
	public static function create(catchTrace:Bool = true, toggleKeyCode:Int = 49, withControlKeyPressed:Bool = true) 
	{
		created 			= true;
		stageRef 			= Lib.current.stage;//stage;
		keyCode 			= toggleKeyCode;
		ctrlMode 			= withControlKeyPressed;
		visualContainer 	= new Sprite();
		commands 			= new Map<String, Dynamic>();
		liveDataFields 		= new Map<String, Bar>();
		chronometers 		= new Map<String, Chronometer>();
		sharedObject		= SharedObject.getLocal("NMEConsoleData");
		inputBarHistory		= sharedObject.data.inputBarHistory;
		historyCurrentIndex = -1;
		
		if (!ctrlMode)
			ctrlIsDown = true;
		
		ConsoleText.init();
		if(catchTrace)
			Log.trace = traceHandler;
		
		backround = new GraphicRectangle(new Rectangle(0, 0, 10, 10), true, false, .7);
		inputBar = new Bar(true, .35, 0xC5C5C5);
		
		visualContainer.addChild(backround);
		visualContainer.addChild(inputBar.visualContainer);
		visualContainer.addChild(ConsoleText.textField);
		
		stageRef.addEventListener(Event.RESIZE, onResize);
		stageRef.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
		stageRef.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		
		createInputBar();
		
		onResize();
		
		setupDefaultCommands();
		
		ConsoleText.write("Welcome!, type help to get information and the list of available commands.", 0xC2D7ED);
	}
	
	private static function checkCreation():Void
	{
		if (!created) create();
	}
	
	private static function onResize(e:Dynamic = null):Void
	{
		width 	= stageRef.stageWidth;
		if (autosizeToStageHeight)
			height 	= stageRef.stageHeight;
		
		var liveDataAreaHeight:Float = setupLiveDataFieldPositions();
		ConsoleText.textField.y = liveDataAreaHeight + 5;
		ConsoleText.textField.width = width;
		ConsoleText.textField.height = height - ConsoleText.textField.y - inputBar.visualContainer.height;
		ConsoleText.textField.scrollV = ConsoleText.textField.maxScrollV;
		backround.changeGeometry(new Rectangle(0, 0, width, height));
		inputBar.setWidth(width);
		inputBar.visualContainer.y = height - inputBar.visualContainer.height;
	}
	
	private static function setupDefaultCommands():Void
	{
		addCommand("clear", function(par:String = null) { ConsoleText.clearOutput(); } );
		addCommand("help", printHelp);
	}
	
	private static function setupLiveDataFieldPositions():Float
	{
		var i:Int = 0;
		var areaHeight:Float = 0;
		for (bar in liveDataFields) 
		{
			bar.setWidth(width);
			bar.visualContainer.y = bar.visualContainer.height * i;
			areaHeight = bar.visualContainer.y + bar.visualContainer.height;
			i++;
		}
		return areaHeight;
	}
	
	public static function writeText(text:String, color:Int = 0xFFFFFF, breakLine:Bool = true):Void
	{
		checkCreation();
		if(breakLine)
			OutputHandler.writeText(text, color, breakLine);
		else
			OutputHandler.writeText(text + " ", color, breakLine);
	}
	
	public static function addCommand(name:String, _callback:String->Void):Void
	{
		checkCreation();
		commands.set(name, _callback);
	}
	
	public static function runCommand(name:String, param:Dynamic = null):Bool
	{
		checkCreation();
		if (commands.exists(name))
		{
			commands.get(name)(param); //If you get an error in this line means you used a function without parameters as a command, you must set a function with a parameter when you create a command, you can set the default value as null.
			return true;
		}
		return false;
	}
	
	private static function printHelp(par:String = null):Void
	{
		ConsoleText.write("//////////////////////////////////////////////////////////");
		ConsoleText.write(" ");
		ConsoleText.write("fermmtools console version: " + VERSION + " by fermmm", 0xDAE2A7);
		ConsoleText.write("http://fermmm.wordpress.com/", 0xDAE2A7);
		ConsoleText.write(" ");
		ConsoleText.write("Use up and down keys to navegate the input history.");
		ConsoleText.write("Input history remains even if you close the");
		ConsoleText.write("application and compile a new version.");
		ConsoleText.write(" ");
		ConsoleText.write("Use the mouse wheel to scroll the console text.");
		ConsoleText.write(" ");
		ConsoleText.write("The following list contains both the default");
		ConsoleText.write("commands and the user created ones:");
		ConsoleText.write(" ");
		ConsoleText.write("-COMMAND LIST-", 0xA8E1B0);
		for (command in commands.keys()) 
		{
			ConsoleText.write(command, 0xA8E1B0);	
		}
		ConsoleText.write(" ");
		ConsoleText.write("//////////////////////////////////////////////////////////");
	}
	
	public static function setLiveDataField(name:String, data:Dynamic, showMaxValue:Bool = false):Void
	{
		checkCreation();
		if (liveDataFields.exists(name))
		{
			var bar:Bar = liveDataFields.get(name);
			if (showMaxValue && (Std.is(data, Float) || Std.is(data, Int)))
			{
				if (data >= bar.maxValue)
					bar.maxValue = data;
					
				bar.textField.text = bar.name + ": " + (data) + "    max: "+ (bar.maxValue);
			}else{
				bar.textField.text = bar.name + ": " + (data);
			}
		}else {
			var bar:Bar = new Bar();
			liveDataFields.set(name, bar);
			bar.name = name;
			visualContainer.addChild(bar.visualContainer);
			setLiveDataField(name, data);
			onResize();
		}
	}

	public static function measureTime(name:String, showMaxValue:Bool = false, showAsLiveDataField:Bool = true):Int
	{
		if (!chronometers.exists(name))
			chronometers.set(name, new Chronometer(false));
			
		var chronometer:Chronometer = chronometers.get(name);
		
		if (!chronometer.running)
		{
			chronometer.start();
			return 0;
		}else {
			var time:Int = chronometer.getTotalMilliseconds();
			if (showAsLiveDataField) 
				setLiveDataField(name, cast time, showMaxValue);
			else
				writeText(name + ": " + cast time);
			chronometers.set(name, new Chronometer(false));
			return time;
		}
	}
	
	private static function traceHandler(value:Dynamic, ?positionInformation:PosInfos):Void 
	{
		//untyped __global__["trace"]("Stencyl:" + positionInformation.className+"."+positionInformation.methodName+"("+positionInformation.lineNumber+"): " + value);
		
		// If the passed value is null, call the writeNull method.
		if (value == null) {
			OutputHandler.writeNull(positionInformation);
		// If the passed value is a string, apply some logic to determine whether the writeString or writeXml method should be
		// called.
		} else if (Std.is(value, String)) {
			// If the passed value might contain an XML document, try to parse it as XML.
			if (determineMightBeXML(value)) {
				var xml:Xml = null;
				try {
					xml = Xml.parse(value);
				} catch (error:Dynamic) {
				}
				// If the parsing succeeded, call the writeXml method and return.
				if (xml != null) {
					OutputHandler.writeXml(xml, positionInformation);
					return;
				}
			}
			// If the passed value is not an XML document, call the writeString method.
			OutputHandler.writeString(value, positionInformation);
		// If the passed value is an integer, call the writeInt method.
		} else if (Std.is(value, Int)) {
			OutputHandler.writeInt(value, positionInformation);
		// If the passed value is a float, call the writeFloat method.
		} else if (Std.is(value, Float)) {
			OutputHandler.writeFloat(value, positionInformation);
		// If the passed value is a bool, call the writeBool method.
		} else if (Std.is(value, Bool)) {
			OutputHandler.writeBool(value, positionInformation);
		// If the passed value is Xml, call the writeXml method.
		} else if (Std.is(value, Xml)) {
			OutputHandler.writeXml(value, positionInformation);
		// If the passed value is a AVM2 XML object, convert it to a haXe Xml object and then call the writeXml method.
		#if flash9
		} else if (Std.is(value, flash.xml.XML)) {
			OutputHandler.writeXml(Xml.parse(value.toXMLString()), positionInformation);
		#end
		// If the passed value is a function, call the writeString method.
		} else if (Reflect.isFunction(value)) {
			OutputHandler.writeString("[function]", positionInformation);
		// If the passed value is an AVM2 error, write the error message in red.
		#if flash9
		} else if (Std.is(value, flash.errors.Error)) {
			writeError(value.message, positionInformation);
		#end
		// If the passed value is none of the above, convert it to a string and then call the writeString method.
		} else {
			OutputHandler.writeString(generateStringRepresentation(value), positionInformation);
		}
	}
	/**
	 * Determines whether the passed value might be a string containing an XML document, or not. Returns true if the passed value
	 * might be XML; false otherwise. Note that if this method returns true, it is not ensured that the passed value is actually
	 * valid XML. However, if this method returns false, it certainly is not.
	 */
	private static function determineMightBeXML(value:String):Bool {
		return StringTools.ltrim(value).charCodeAt(0) == 60;
	}
	/**
	 * Generates a string representation for values that can not be converted to one of the types supported by the console.
	 */
	private static function generateStringRepresentation(value:Dynamic, ?depth:Int):String {
		// If the passed value is either an array or a list, join the elements inside the collection.
		if (Std.is(value, Array) || Std.is(value, List)) {
			// If no depth is specified, use 0.
			if (depth == null) {
				depth = 0;
			// If the depth is the maximal depth for collections, return a suspension point instead of generating a full string
			// representation. This prevents infinite string representations, in some cases.
			} else if (depth == MAXIMAL_COLLECTION_DEPTH) {
				return "[...]";
			}
			var stringBuffer:StringBuf = new StringBuf();
			// Create a variable that stores the number of elements that have been added to the string representation.
			var numberOfElements:Int = 0;
			// Add an opening square bracket to the string representation.
			stringBuffer.add("[");
			var iterator:Iterator<Dynamic> = value.iterator();
			for (element in iterator) {
				// Add a string representation of the element to the string representation.
				stringBuffer.add(generateStringRepresentation(element, depth + 1));
				++numberOfElements;
				// If this collection also contains at least one element after this one, add a comma to the string representation.
				if (iterator.hasNext()) {
					stringBuffer.add(", ");
					// If the maximal number of elements for collections has been reached, add a suspension point and stop iterating.
					if (numberOfElements == MAXIMAL_COLLECTION_ELEMENTS) {
						stringBuffer.add("...");
						break;
					}
				}
			}
			// Add a closing square bracket to the string representation.
			stringBuffer.add("]");
			return stringBuffer.toString();
		// If the passed value is not an array or a list, use the Std.string method to generate a string representation.
		} else {
			return Std.string(value);
		}
	}
	private static function writeError(message:String, positionInformation:PosInfos):Void 
	{
		// Write the actual error message in red.
		OutputHandler.writeAdvancedString(message, 0xF95A61, false);
		// Split the package and the actual class name.
		var regularExpression:EReg = ~/(.+)\.([^\.]+)$/;
		// If the regular expression above matches, there is an actual package.
		if (regularExpression.match(positionInformation.className)) {
			OutputHandler.writeAdvancedString(" at " + regularExpression.matched(1) + "::" + regularExpression.matched(2) + "/" + positionInformation.methodName + "():" + positionInformation.lineNumber, 0xFFFFFF, true);
		// If the regular expression above doesn't match, there is no package.
		} else {
			OutputHandler.writeAdvancedString(" at " + positionInformation.className + "/" + positionInformation.methodName + "():" + positionInformation.lineNumber, 0xFFFFFF, true);
		}
	}
	
	public static function show():Void
	{
		checkCreation();
		stageRef.addChild(visualContainer);
		stageRef.focus = inputBar.textField;
	}
	
	public static function hide():Void
	{
		checkCreation();
		if (stageRef.contains(visualContainer))
		{
			stageRef.removeChild(visualContainer);
			stageRef.focus = null;
		}
	}
	
	private static function showHide():Void
	{
		if (stageRef.contains(visualContainer))
			hide()
		else
			show();
	}
	
	private static function onKeyUp(e:KeyboardEvent):Void
	{
		if (ctrlMode)
			ctrlIsDown = e.ctrlKey;
		if (e.keyCode == (cast keyCode) && ctrlIsDown)
			showHide();
			
		if (stageRef.focus == inputBar.textField && stageRef.contains(visualContainer))
		{
			if (e.keyCode == 13)
				onEnter();
				
			if (e.keyCode == 38)
			{
				var prevStr:String = getPreviousStringOfInputBarHistory();
				if (prevStr != null)
				{
					inputBar.textField.text = prevStr;
					inputBar.textField.setSelection(inputBar.textField.text.length, inputBar.textField.text.length);
				}
			}
			
			if (e.keyCode == 40)
			{
				var nextStr:String = getNextStringOfInputBarHistory();
				if (nextStr != null)
				{
					inputBar.textField.text = nextStr;
					inputBar.textField.setSelection(inputBar.textField.text.length, inputBar.textField.text.length);
				}
			}
		}
	}
	
	private static function saveStringOnInputBarHistory(string:String):Void
	{
		if (inputBarHistory == null)
			inputBarHistory = new Array<String>();
		
		if (inputBarHistory.length >= INPUT_BAR_HISTORY_MAX_ELEMENTS)
			inputBarHistory.shift();
		
		inputBarHistory.push(string);
		
		sharedObject.data.inputBarHistory = inputBarHistory;
		sharedObject.flush();
	}
	
	private static function getStringOfInputBarHistory(index:Int):String
	{
		if (index < inputBarHistory.length)
			return inputBarHistory[index]
		else
			return null;
	}
	
	private static function getNextStringOfInputBarHistory():String
	{
		if (inputBarHistory == null)
			inputBarHistory = new Array<String>();
		
		if (inputBarHistory.length == 0)
			return null;
		
		if (historyCurrentIndex == -1)
		{
			historyCurrentIndex = inputBarHistory.length - 1;
			return null;
		}else {
			if (historyCurrentIndex + 1 < inputBarHistory.length)
			{
				historyCurrentIndex++;
				return getStringOfInputBarHistory(historyCurrentIndex);
			}
		}
		return null;
	}
	
	private static function getPreviousStringOfInputBarHistory():String
	{
		if (inputBarHistory == null)
			inputBarHistory = new Array<String>();
		
		if (inputBarHistory.length == 0)
			return null;

		if (historyCurrentIndex == -1)
		{
			historyCurrentIndex = inputBarHistory.length - 1;
			return getStringOfInputBarHistory(historyCurrentIndex);
		}else {
			if (historyCurrentIndex - 1 >= 0)
			{
				historyCurrentIndex--;
				return getStringOfInputBarHistory(historyCurrentIndex);
			}
		}
		return null;
	}
	
	private static function clearInputBarHistory(par:String = null):Void
	{
		inputBarHistory = new Array<String>();
		sharedObject.data.inputBarHistory = inputBarHistory;
		sharedObject.flush();
	}
	
	private static function onEnter():Void
	{
		var results:Bool = true;
		var words:Array<String> = inputBar.textField.text.split(" ");
		if (words.length > 0)
		{
			if (words[0].length > 0)
			{
				writeText(inputBar.textField.text, 0xD0CBB9);
				if (words.length > 1)
				{
					var restOfTheString:String = "";
					for (i in 1... words.length) 
					{
						restOfTheString += words[i] + " ";
					}
					results = runCommand(words[0], restOfTheString);
				}
				else
				{
					results = runCommand(words[0]);
				}
			}
		}
		if (results == false)
			writeText("[Unknown command]", 0x5CC457);
			
		historyCurrentIndex = - 1;
		saveStringOnInputBarHistory(inputBar.textField.text);	
		inputBar.textField.text = "";
	}
	
	private static function onKeyDown(e:KeyboardEvent):Void
	{
		if (ctrlMode)
			ctrlIsDown = e.ctrlKey;
	}
	
	private static function createInputBar():Void
	{
		inputBar.textField.type = TextFieldType.INPUT;
	}
	
}

class OutputHandler
{	
	private static inline var BOOL_COLOR:Int 		= 0x98ABFB;
	private static inline var NUMERAL_COLOR:Int 	= 0x89FF89;
	private static inline var STRING_COLOR:Int 	= 0xFFFFFF;

	public static function clearOutput():Void {
		ConsoleText.clearOutput();
	}
	public static function writeAdvancedString(value:String, color:Int, breakline:Bool):Void {
		ConsoleText.write(value, color, breakline);
	}
	public static function writeBool(value:Bool, positionInformation:PosInfos):Void {
		writePositionInformationPrefix(positionInformation);
		ConsoleText.write(Std.string(value), BOOL_COLOR, true);
	}
	public static function writeFloat(value:Float, positionInformation:PosInfos):Void {
		writePositionInformationPrefix(positionInformation);
		ConsoleText.write(Std.string(value), NUMERAL_COLOR, true);
	}
	public static function writeInt(value:Int, positionInformation:PosInfos):Void {
		writePositionInformationPrefix(positionInformation);
		ConsoleText.write(Std.string(value), NUMERAL_COLOR, true);
	}
	public static function writeNull(positionInformation:PosInfos):Void {
		writePositionInformationPrefix(positionInformation);
		ConsoleText.write("null", BOOL_COLOR, true);
	}
	private static function writePositionInformationPrefix(value:PosInfos):Void {
		// Write the file name without the ".hx" suffix, and the line in parentheses.
		ConsoleText.write(value.fileName.substr(0, value.fileName.length - 3) + " (line " + value.lineNumber + "): ", 0xFFFFFF, false);
	}
	public static function writeString(value:String, positionInformation:PosInfos):Void {
		writePositionInformationPrefix(positionInformation);
		ConsoleText.write(value, STRING_COLOR, true);
	}
	
	public static function writeText(value:String, color:Int = 0xFFFFFF, breakLine:Bool):Void
	{
		ConsoleText.write(value, color, breakLine);
	}
	
	public static function writeXml(value:Xml, positionInformation:PosInfos):Void 
	{
		writePositionInformationPrefix(positionInformation);
		XMLPrettyPrinter.writeXml(value);
	}
}

class ConsoleText
{
	public static var textField:TextField;
	private static var htmlText:String;
	
	public static function init():Void
	{
		textField 				= new TextField();
		htmlText 				= new String(""); 
		textField.antiAliasType	= AntiAliasType.ADVANCED;
		textField.multiline = true;
		textField.defaultTextFormat = new TextFormat ("_typewriter");
	}
	
	public static function clearOutput():Void
	{
		textField.htmlText = "";
		htmlText = "";
	}
	
	/**
	 * Write a message.
	 */
	public static function write(value:String, color:Int = 0xFFFFFF, breakline:Bool = true):Void
	{		
		htmlText += "<font color='#" + StringTools.hex(color) +"'>" + value + "</font>";
		
		if (breakline)
			htmlText += "<br>";
			
		textField.htmlText = htmlText;
		
		textField.scrollV = textField.maxScrollV;
	}
}


/**
 * A pretty printer for XML. It colors the XML, and adds indenting.
 */
class XMLPrettyPrinter 
{
	private static inline var ATTRIBUTE_VALUE_COLOR:Int = 0x98ABFB;
	private static inline var CDATA_AND_COMMENT_TAG_COLOR:Int = 0x89FF89;
	private static inline var CLOSURE_COLOR:Int = 0xFF7F7F;
	private static inline var NODE_NAME_COLOR:Int = 0xC97FFF;

	private static function createTabs(numberOfTabs:Int):String {
		return
			switch (numberOfTabs) {
				case 0:
				"";
				case 1:
				"\t";
				case 2:
				"\t\t";
				case 3:
				"\t\t\t";
				default:
				var result:String = "";
				for (i in 0...numberOfTabs) {
					result += "\t";
				}
				result;
			}
	}
	private static function determineHasChildren(value:Xml):Bool {
		for (child in value) {
			switch (child.nodeType) {
				case Xml.Element:
				return true;
				case Xml.CData, Xml.Comment, Xml.PCData:
				if (StringTools.ltrim(child.nodeValue).length != 0) {
					return true;
				}
				case _: {}
			}
		}
		return false;
	}
	private static function writeNode(value:Xml, depth:Int):Void {
		switch (value.nodeType) {
			case Xml.CData:
			ConsoleText.write(createTabs(depth) + "<", 0xFFFFFF, false);
			ConsoleText.write("![CDATA[", CDATA_AND_COMMENT_TAG_COLOR, false);
			ConsoleText.write(StringTools.trim(value.nodeValue), 0xFFFFFF, false);
			ConsoleText.write("]]", CDATA_AND_COMMENT_TAG_COLOR, false);
			ConsoleText.write(">", 0xFFFFFF, true);
			case Xml.Comment:
			var commentContent:String = value.nodeValue;
			commentContent = ~/[\n\r\t]+/g.replace(commentContent, "");
			ConsoleText.write(createTabs(depth), CDATA_AND_COMMENT_TAG_COLOR, false);
			ConsoleText.write(StringTools.trim(commentContent), CDATA_AND_COMMENT_TAG_COLOR, false);
			ConsoleText.write("", CDATA_AND_COMMENT_TAG_COLOR, true);
			case Xml.Document:
			for (child in value) {
				writeNode(child, depth);
			}
			case Xml.Element:
			ConsoleText.write(createTabs(depth) + "<", 0xFFFFFF, false);
			ConsoleText.write(value.nodeName, NODE_NAME_COLOR, false);
			for (attribute in value.attributes()) {
				ConsoleText.write(" " + attribute + "=\"", 0xFFFFFF, false);
				ConsoleText.write(value.get(attribute), ATTRIBUTE_VALUE_COLOR, false);
				ConsoleText.write("\"", 0xFFFFFF, false);
			}
			if (determineHasChildren(value)) {
				ConsoleText.write(">", 0xFFFFFF, true);
				for (child in value) {
					writeNode(child, depth + 1);
				}
				ConsoleText.write(createTabs(depth) + "<", 0xFFFFFF, false);
				ConsoleText.write("/", CLOSURE_COLOR, false);
				ConsoleText.write(value.nodeName, NODE_NAME_COLOR, false);
				ConsoleText.write(">", 0xFFFFFF, true);
			} else {
				ConsoleText.write(" /", CLOSURE_COLOR, false);
				ConsoleText.write(">", 0xFFFFFF, true);
			}
			case Xml.PCData:
			var nodeValue:String = StringTools.trim(value.nodeValue);
			if (nodeValue.length != 0) {
				ConsoleText.write(createTabs(depth) + nodeValue, 0xFFFFFF, true);
			}
			case _: {}
		}
	}
	public static function writeXml(value:Xml):Void {
		writeNode(value, 0);
	}
}

class Bar
{
	public var visualContainer:Sprite;
	public var textField:TextField;
	private var backround:GraphicRectangle;
	public var name:String;
	public var maxValue:Float;
	
	public function new(border:Bool = false, alpha:Float = .1, textColor:Int = 0xB6ECAE)
	{
		textField 						= new TextField();
		textField.textColor 			= 0xffffff;
		textField.defaultTextFormat 	= new TextFormat ("_typewriter", 12, textColor);
		textField.antiAliasType			= AntiAliasType.ADVANCED;
		visualContainer 				= new Sprite();
		backround 						= new GraphicRectangle(new Rectangle(), true, border, alpha);
		visualContainer.addChild(backround);
		visualContainer.addChild(textField);
		textField.height				= 20;
		backround.changeGeometry(new Rectangle(0, 0, 0, textField.height));
		maxValue 						= 0;
	}
	
	public function setWidth(newWidth:Float):Void
	{
		textField.width = newWidth;
		backround.changeGeometry(new Rectangle(0, 0, textField.width, textField.height));
	}
}

class GraphicRectangle extends Sprite
{
	private var rectangle		:Rectangle;
	private var fill			:Bool;
	private var border			:Bool;
	private var fillColor		:Int;
	private var borderColor		:Int;
	private var borderStroke	:Int;

	public function new(rectangleInfo:Rectangle, fill:Bool = true, border:Bool = false, alpha:Float = .3, fillColor:Int = 0x000000, borderColor:Int = 0x000000, borderStroke:Int = 1) 
	{
		super();
		rectangle 			= rectangleInfo;
		this.fill 			= fill;
		this.border 		= border;
		this.fillColor 		= fillColor;
		this.borderColor 	= borderColor;
		this.borderStroke 	= borderStroke;
		this.alpha = alpha;
		
		draw();
	}
	
	public function changeGeometry(newRectangleInfo:Rectangle):Void
	{
		rectangle = newRectangleInfo;
		draw();
	}
	
	public function draw():Void
	{
		graphics.clear();
		if(fill) graphics.beginFill(fillColor);
		if (border) graphics.lineStyle(borderStroke, borderColor);
		graphics.drawRect(0, 0, rectangle.width, rectangle.height);
		x = rectangle.x;
		y = rectangle.y;
	}
	
}

class Chronometer 
{
	public var countdownMode		:Bool;
	private var time				:Int;
	private var tempTimeCalculation	:Int;
	private var startingMiliseconds	:Int;
	public var running				:Bool;
	
	public function new(autoStart:Bool = true) 
	{
		running = false;
		if (autoStart)
			start();
	}
	
	public function start(startingMiliseconds:Int = 0, countdownMode:Bool = false):Void
	{
		this.countdownMode 			= countdownMode;
		this.startingMiliseconds 	= startingMiliseconds;
		time 						= Lib.getTimer();
		running						= true;
	}
	
	public function getTotalMilliseconds():Int
	{
		if (running)
		{
			if(!countdownMode)
				tempTimeCalculation = Lib.getTimer() - time + startingMiliseconds;
			else
				tempTimeCalculation = -(Lib.getTimer() - time - startingMiliseconds);
			
			if(tempTimeCalculation > 0)
				return tempTimeCalculation;
			else
				return 0;
		}
		else
		{	
			return 0;
		}
	}
}