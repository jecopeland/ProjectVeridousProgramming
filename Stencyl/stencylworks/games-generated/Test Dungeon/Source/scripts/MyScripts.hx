package scripts;

import com.stencyl.behavior.Script;
import scripts.Design_6_6_SwitchScene;
import scripts.Design_7_7_SwitchActivation;
import scripts.Design_10_10_4WayMovementAdvanced;
import scripts.Design_12_12_FadeOutandDieafterTime;
import scripts.ActorEvents_0;
import scripts.SceneEvents_0;
import scripts.ActorEvents_52;
import scripts.ActorEvents_54;
import scripts.ActorEvents_56;
import scripts.ActorEvents_58;
import scripts.Design_22_22_CameraFollow;
import scripts.ActorEvents_60;
import scripts.ActorEvents_48;
import scripts.Design_26_26_OnScreenButton;
import scripts.ActorEvents_39;
import scripts.ActorEvents_45;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}