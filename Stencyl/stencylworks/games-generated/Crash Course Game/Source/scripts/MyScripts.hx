package scripts;

import com.stencyl.behavior.Script;
import scripts.Design_7_7_DieinPitandReload;
import scripts.Design_7_7_Jumping;
import scripts.Design_7_7_StompOnEnemies;
import scripts.Design_7_7_Stompable;
import scripts.Design_7_7_Walking;
import scripts.ActorEvents_3;
import scripts.ActorEvents_5;
import scripts.SceneEvents_0;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}