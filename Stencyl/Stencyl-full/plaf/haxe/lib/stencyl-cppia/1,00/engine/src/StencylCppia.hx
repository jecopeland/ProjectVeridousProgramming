package;

import AllStencyl;
import DefaultAssetLibrary;

import hxcpp.StaticSqlite;
import hxcpp.StaticMysql;
import hxcpp.StaticRegexp;
import hxcpp.StaticStd;
import hxcpp.StaticZlib;

@:build(cpp.cppia.HostClasses.include())
class StencylCppia
{
	public static var gamePath:String;

	public static function run(source:String)
	{
		untyped __global__.__scriptable_load_cppia(source);
	}

	public static function main()
	{
		#if (!scriptable && !doc_gen)
			#error "Please define scriptable to use cppia"
		#end

		var args = Sys.args();

		if(args.length == 0)
		{
			MainMenu.display();
		}
		else
		{
			var script = args[0];

			if (script==null)
			{
				trace("Usage : Cppia scriptname");
			}
			else
			{
				runScript(script);
			}
		}
	}

	public static function runScript(script:String)
	{
		var delimiter = Std.int(Math.max(script.lastIndexOf("/"), script.lastIndexOf("\\")));
		gamePath = script.substring(0, delimiter);

		var source = sys.io.File.getContent(script);
		run(source);
	}
}
