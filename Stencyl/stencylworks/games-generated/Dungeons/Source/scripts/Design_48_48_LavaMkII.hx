package scripts;

import com.stencyl.graphics.G;
import com.stencyl.graphics.BitmapWrapper;

import com.stencyl.behavior.Script;
import com.stencyl.behavior.Script.*;
import com.stencyl.behavior.ActorScript;
import com.stencyl.behavior.SceneScript;
import com.stencyl.behavior.TimedTask;

import com.stencyl.models.Actor;
import com.stencyl.models.GameModel;
import com.stencyl.models.actor.Animation;
import com.stencyl.models.actor.ActorType;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.Group;
import com.stencyl.models.Scene;
import com.stencyl.models.Sound;
import com.stencyl.models.Region;
import com.stencyl.models.Font;

import com.stencyl.Engine;
import com.stencyl.Input;
import com.stencyl.Key;
import com.stencyl.utils.Utils;

import openfl.ui.Mouse;
import openfl.display.Graphics;
import openfl.display.BlendMode;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.events.TouchEvent;
import openfl.net.URLLoader;

import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.joints.B2Joint;
import box2D.collision.shapes.B2Shape;

import motion.Actuate;
import motion.easing.Back;
import motion.easing.Cubic;
import motion.easing.Elastic;
import motion.easing.Expo;
import motion.easing.Linear;
import motion.easing.Quad;
import motion.easing.Quart;
import motion.easing.Quint;
import motion.easing.Sine;

import com.stencyl.graphics.shaders.BasicShader;
import com.stencyl.graphics.shaders.GrayscaleShader;
import com.stencyl.graphics.shaders.SepiaShader;
import com.stencyl.graphics.shaders.InvertShader;
import com.stencyl.graphics.shaders.GrainShader;
import com.stencyl.graphics.shaders.ExternalShader;
import com.stencyl.graphics.shaders.InlineShader;
import com.stencyl.graphics.shaders.BlurShader;
import com.stencyl.graphics.shaders.SharpenShader;
import com.stencyl.graphics.shaders.ScanlineShader;
import com.stencyl.graphics.shaders.CSBShader;
import com.stencyl.graphics.shaders.HueShader;
import com.stencyl.graphics.shaders.TintShader;
import com.stencyl.graphics.shaders.BloomShader;



class Design_48_48_LavaMkII extends SceneScript
{
	public var _Lava:Region;
	public var _MoarLava:Region;
	public var _Set:Region;
	public var _Amari:Actor;
	
	
	public function new(dummy:Int, dummy2:Engine)
	{
		super();
		nameMap.set("Lava", "_Lava");
		nameMap.set("Moar Lava", "_MoarLava");
		nameMap.set("Set", "_Set");
		nameMap.set("Amari", "_Amari");
		
	}
	
	override public function init()
	{
		
		/* ======================= Every N seconds ======================== */
		runPeriodically(1000 * 0.5, function(timeTask:TimedTask):Void
		{
			if(wrapper.enabled)
			{
				if(isInRegion(_Amari, _Lava))
				{
					Engine.engine.setGameAttribute("Health", (Engine.engine.getGameAttribute("Health") - 1));
				}
				if(isInRegion(_Amari, _MoarLava))
				{
					Engine.engine.setGameAttribute("Health", (Engine.engine.getGameAttribute("Health") - 1));
				}
			}
		}, null);
		
		/* ======================== Actor of Type ========================= */
		addWhenTypeGroupCreatedListener(getActorType(63), function(eventActor:Actor, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				runPeriodically(1000 * 0.5, function(timeTask:TimedTask):Void {
					if(isInRegion(eventActor, _Lava))
					{
						Engine.engine.setGameAttribute("Health", (Engine.engine.getGameAttribute("Health") - 1));
					}
					if(isInRegion(eventActor, _MoarLava))
					{
						Engine.engine.setGameAttribute("Health", (Engine.engine.getGameAttribute("Health") - 1));
					}
				}, null);
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}