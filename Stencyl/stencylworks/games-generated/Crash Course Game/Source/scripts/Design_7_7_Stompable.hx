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



class Design_7_7_Stompable extends ActorScript
{
	public var _StompedSound:Sound;
	public var _StompedAnimation:String;
	public var _PushPlayerForce:Float;
	public var _PushPlayerJumpForce:Float;
	
	/* ========================= Custom Event ========================= */
	public function _customEvent_Stomped():Void
	{
		if(!(asBoolean(actor.getActorValue("_BeingStomped"))))
		{
			actor.setActorValue("_BeingStomped", true);
			playSound(_StompedSound);
			actor.setXVelocity(0);
			actor.setYVelocity(0);
			actor.setIgnoreGravity(!false);
			actor.setAnimation("" + _StompedAnimation);
		}
		runLater(1000 * 0.2, function(timeTask:TimedTask):Void {
			recycleActor(actor);
		}, actor);
	}
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Stomped Sound", "_StompedSound");
		nameMap.set("Stomped Animation", "_StompedAnimation");
		nameMap.set("Push Player Force", "_PushPlayerForce");
		_PushPlayerForce = 40.0;
		nameMap.set("Push Player Jump Force", "_PushPlayerJumpForce");
		_PushPlayerJumpForce = 50.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		actor.setActorValue("_BeingStomped", false);
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}