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
import scripts.ActorEvents_63;
import scripts.ActorEvents_45;
import scripts.SceneEvents_1;
import scripts.ActorEvents_39;
import scripts.SceneEvents_2;
import scripts.Design_32_32_SceneSwitch;
import scripts.SceneEvents_3;
import scripts.SceneEvents_4;
import scripts.Design_45_45_PowerGen;
import scripts.ActorEvents_65;
import scripts.SceneEvents_5;
import scripts.Design_52_52_HUD;
import scripts.Design_45_45_Heathrelateddeathandreset;
import scripts.Design_45_45_Inventory;
import scripts.Design_46_46_Manipulatibility;
import scripts.Design_47_47_InventoryDisplay;
import scripts.Design_51_51_LavaMkII;
import scripts.Design_51_51_Dialogue;
import scripts.ActorEvents_50;
import scripts.Design_52_52_DeathandStuff;


//Force all classes to compile since they aren't statically used.
class MyScripts
{
	var s:Script;
	var a:MyAssets;
	
	#if(mobile && !air)
	var stencylPreloader:scripts.StencylPreloader;
	#end
}