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



class Design_7_7_Walking extends ActorScript
{
	public var _WalkRightAnimation:String;
	public var _WalkLeftAnimation:String;
	public var _IdleLeftAnimation:String;
	public var _IdleRightAnimation:String;
	public var _MoveLeftKey:String;
	public var _MoveRightKey:String;
	public var _Speed:Float;
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Walk Right Animation", "_WalkRightAnimation");
		nameMap.set("Walk Left Animation", "_WalkLeftAnimation");
		nameMap.set("Idle Left Animation", "_IdleLeftAnimation");
		nameMap.set("Idle Right Animation", "_IdleRightAnimation");
		nameMap.set("Move Left Key", "_MoveLeftKey");
		nameMap.set("Move Right Key", "_MoveRightKey");
		nameMap.set("Speed", "_Speed");
		_Speed = 15.0;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Creating ========================= */
		actor.makeAlwaysSimulate();
		actor.setActorValue("Facing Right?", true);
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				/* Walk right */
				if(isKeyDown(_MoveRightKey))
				{
					actor.setXVelocity(_Speed);
					actor.setActorValue("Facing Right?", true);
					if((actor.getActorValue("On Ground?") == true))
					{
						actor.setAnimation("" + _WalkRightAnimation);
					}
				}
				/* Walk left */
				else if(isKeyDown(_MoveLeftKey))
				{
					actor.setXVelocity(-(_Speed));
					actor.setActorValue("Facing Right?", false);
					if((actor.getActorValue("On Ground?") == true))
					{
						actor.setAnimation("" + _WalkLeftAnimation);
					}
				}
				/* Stand still */
				else
				{
					actor.setXVelocity(0);
					if((actor.getActorValue("On Ground?") == true))
					{
						if((actor.getActorValue("Facing Right?") == true))
						{
							actor.setAnimation("" + _IdleRightAnimation);
						}
						else
						{
							actor.setAnimation("" + _IdleLeftAnimation);
						}
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}