package;

import openfl.Assets.AssetLibrary;

class DefaultAssetLibrary extends AssetLibrary
{
	static var cppiaLibrary:Class<Dynamic>;
	static var pollField:Dynamic;

	public function new()
	{
		super();

		cppiaLibrary = Type.resolveClass("CppiaAssetLibrary");
		pollField = Reflect.field(cppiaLibrary, "__poll");
	}

	public static function __poll ():Void
	{
		if(pollField != null)
			Reflect.callMethod(cppiaLibrary, pollField, []);
	}
}
