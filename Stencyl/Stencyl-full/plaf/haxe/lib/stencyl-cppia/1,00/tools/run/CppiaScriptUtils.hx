package;

import sys.io.*;

using StringTools;

class CppiaScriptUtils
{
	public static function removeClass(scriptPath:String, classPath:String)
	{
		var content = File.getContent(scriptPath);
		var filter = classPath.split(".").join("/") + ".hx";

		var lines = content.split("\n");
		if(lines[0] != "CPPIA")
		{
			trace(scriptPath + " is not a debug cppia script.");
			return;
		}

		var identifiers = Std.parseInt(lines[1]);
		var i = 0;
		var curLine = 2;
		var classID = -1;

		while(i < identifiers)
		{
			var curLength = Std.parseInt(lines[curLine].split(" ")[0]);
			curLength += ("" + curLength).length + 1;
			while(curLength > lines[curLine].length)
				curLength -= (lines[curLine++].length + 1);
			++curLine;
			++i;

			if(lines[curLine].endsWith(filter))
				classID = i;
		}

		if(classID == -1)
		{
			trace("Didn't find " + classPath);
		}

		while(!lines[++curLine].startsWith("CLASS")) {}

		var numClasses = Std.parseInt(lines[curLine - 1]);
		lines[curLine - 1] = "" + (numClasses - 1);
		var beginClass = curLine;
		var endClass = -1;
		var splice = false;
		
		for(cn in 0...numClasses)
		{
			while(!lines[++curLine].startsWith("CLASS"))
			{
				if(lines[curLine].startsWith("" + classID))
				{
					splice = true;
				}
			}
			if(splice)
			{
				endClass = curLine - 1;
				break;
			}
			else
			{
				beginClass = curLine;
			}
		}
		
		if(splice)
		{
			lines.splice(beginClass, endClass - beginClass);
			File.saveContent(scriptPath, lines.join("\n"));
		}
	}
}