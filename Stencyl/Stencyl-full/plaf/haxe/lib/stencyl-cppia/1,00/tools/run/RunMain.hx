package;

import haxe.Unserializer;
import sys.*;
import sys.io.*;

import lime.tools.helpers.*;
import lime.project.*;
//import lime.utils.Log;

using Lambda;
using StringTools;

class RunMain
{
	public static function main()
	{
		//build, run, test: test game
		//setup: compile host
		//dist-setup: prepare stencyl-cppia library for users.
		//full-setup: setup + dist-setup

		var arguments = Sys.args();
		var libraryFolder = PathHelper.standardize(PathHelper.getHaxelib (new Haxelib ("stencyl-cppia")), false);
		var command = arguments[0];

		var hostSetup = command == "setup" || command == "full-setup";
		var distSetup = command == "dist-setup" || command == "full-setup";

		//All generated binaries go into Stencyl Workspace

		var workspace =
			if(arguments.indexOf("-stencyl-workspace") != -1)
				arguments[arguments.indexOf("-stencyl-workspace") + 1].urlDecode()
			else
				null;

		if(workspace == null)
		{
			if(hostSetup || distSetup)
			{
				workspace = Sys.args().pop();
				trace('Used $command, so using userDir as workspace.');
			}
			else
			{
				trace("Must pass -stencyl-workspace path/to/stencylworks to run stencyl-cppia");
				return;
			}
		}

		trace('workspace: $workspace');

		//Platform info

		var platform = PlatformHelper.hostPlatform;
		var is64 = PlatformHelper.hostArchitecture == Architecture.X64;

		if(platform == Platform.WINDOWS)
			is64 = false;

		var platformID = platform + (is64  ? "64" : "");
		var architectureString = (is64 ? "64" : "32");
		var platformType = switch(platform) {
			case WINDOWS | MAC | LINUX:
				"desktop";
			case ANDROID | IOS:
				"mobile";
			case _:
				"";
		}

		//Binary locations

		var cppiaFolder = PathHelper.combine(workspace, "cppia");
		FileSystem.createDirectory(cppiaFolder);

		var binFolder = '$cppiaFolder/bin/$platformID';
		FileSystem.createDirectory(binFolder);

		var binSuffix = (platform == Platform.WINDOWS ? ".exe" : "");
		var hasBin = FileSystem.exists('$binFolder/StencylCppia$binSuffix');

		CppiaPlatform.hostExecutablePath = '$binFolder/StencylCppia$binSuffix';

		//Setup

		hostSetup = hostSetup || !hasBin;

		if(hostSetup || distSetup)
		{
			if(distSetup)
			{
				var stencylClassList = ListClasses.list("stencyl", "AllStencyl", ["scripts.MyAssets", "scripts.MyScripts"], ListClasses.exclude);
				File.saveContent('$libraryFolder/engine/src/AllStencyl.hx', stencylClassList);
			}

			var tempFolder = '$cppiaFolder/temp/$platformID';
			FileSystem.createDirectory(tempFolder);

			var haxeArgs =
			[
				'compile-common.hxml',

				'-D', 'HXCPP_M$architectureString',
				'-D', '$platform',
				'-D', '$platformType',

				'-cpp', '$tempFolder'
			];
			var originalHaxeArgs = haxeArgs;

			var exportFolder = "";

			if(distSetup)
			{
				exportFolder = '$libraryFolder/export';
				FileSystem.createDirectory(exportFolder);

				haxeArgs = haxeArgs.concat([
					'-D', 'dll_export=$exportFolder/export_classes.info',
					'-D', 'no-compilation'
				]);
			}

			try { Sys.setCwd ('$libraryFolder/engine/hxml'); } catch (e:Dynamic) {}
			ProcessHelper.runCommand ("", "haxe", haxeArgs);
			if(distSetup && hostSetup)
				ProcessHelper.runCommand ("", "haxe", originalHaxeArgs);

			if(distSetup)
			{
				var srcFolder = '$libraryFolder/engine/src';
				export('$exportFolder/export_classes.info', "^(class|enum|interface)");
				FileSystem.createDirectory('$exportFolder/scripts');
				FileHelper.copyIfNewer('$srcFolder/DefaultAssetLibrary.hx', '$exportFolder/DefaultAssetLibrary.hx');
				FileHelper.copyIfNewer('$srcFolder/scripts/MyAssets.hx', '$exportFolder/scripts/MyAssets.hx');
				FileHelper.copyIfNewer('$srcFolder/scripts/MyScripts.hx', '$exportFolder/scripts/MyScripts.hx');
			}
			if(hostSetup)
			{
				var tempBinPath = '$tempFolder/StencylCppia$binSuffix';
				var binPath = '$binFolder/StencylCppia$binSuffix';

				var limeFolder = PathHelper.standardize(PathHelper.getHaxelib (new Haxelib ("lime")), false);
				platformID = platformID.substr(0, 1).toUpperCase() + platformID.substr(1);
				var ndllPath = '$limeFolder/legacy/ndll/$platformID/lime-legacy.ndll';
				var ndllDestPath = '$binFolder/lime-legacy.ndll';

				FileHelper.copyIfNewer(tempBinPath, binPath);
				FileHelper.copyIfNewer(ndllPath, ndllDestPath);
				if(PlatformHelper.hostPlatform != Platform.WINDOWS)
					ProcessHelper.runCommand("", "chmod", ["755", binPath]);
			}
		}

		if(command == "test" || command == "build" || command == "run")
		{
			var argsIndex = arguments.indexOf("-args");
			var genIndex = arguments.indexOf("-gen");
			var openflIndex = arguments.indexOf("-openfl");

			var additionalArgs = arguments.slice(argsIndex + 1, genIndex);
			var openflProjectPath = arguments[genIndex + 1].urlDecode();
			var openflArgs = arguments.slice(openflIndex + 1);

			CppiaPlatform.projectPath = openflProjectPath;

			// ---

			var serializedProjectPath = arguments[1];

			try { Sys.setCwd (openflProjectPath); } catch (e:Dynamic) {}
			trace("Cwd: " + Sys.getCwd());

			var project:HXProject = Unserializer.run(File.getContent(serializedProjectPath));
			project.templatePaths = [ PathHelper.combine (libraryFolder, "templates") ].concat (project.templatePaths);

			var builder = new CppiaPlatform(command, project, project.targetFlags);
			builder.execute(additionalArgs);
		}
	}

	//modified from NME CommandLineTools
	static public function export(info:String, filter:String)
	{
		try
		{
			var match = filter!="" && filter!=null ?  new EReg(filter,"") : null;

			var content = File.getContent(info);
			var result = new Array<String>();
			var allMatched = true;
			for(line in content.split("\n"))
			{
				if (match!=null && match.match(line))
					result.push(line);
				else
					allMatched = false;
			}
			if (match!=null && !allMatched)
			{
				File.saveBytes(info, haxe.io.Bytes.ofString(result.join("\n")));
			}
		}
		catch(e:Dynamic)
		{
			trace('Error cleaning export file $info $e');
		}
	}
}
