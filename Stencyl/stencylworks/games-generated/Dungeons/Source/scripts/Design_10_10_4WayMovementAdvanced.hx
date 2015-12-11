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



class Design_10_10_4WayMovementAdvanced extends ActorScript
{
	public var animUp:String;
	public var animDown:String;
	public var animLeft:String;
	public var animRight:String;
	public var controlUp:String;
	public var controlDown:String;
	public var controlLeft:String;
	public var controlRight:String;
	public var dir:Float;
	public var accel:Float;
	public var topSpeed:Float;
	public var decel:Float;
	public var ianimUp:String;
	public var ianimDown:String;
	public var ianimLeft:String;
	public var ianimRight:String;
	public var player:Bool;
	public var pressedLeft:Bool;
	public var pressedRight:Bool;
	public var pressedUp:Bool;
	public var pressedDown:Bool;
	public var idleSpeed:Float;
	public var _IsometricMovement:Bool;
	public var _8WayMovement:Bool;
	public function _customEvent_checkInput():Void
	{
		pressedLeft = isKeyDown(controlLeft);
		propertyChanged("pressedLeft", pressedLeft);
		pressedRight = isKeyDown(controlRight);
		propertyChanged("pressedRight", pressedRight);
		pressedDown = isKeyDown(controlDown);
		propertyChanged("pressedDown", pressedDown);
		pressedUp = isKeyDown(controlUp);
		propertyChanged("pressedUp", pressedUp);
	}
	public function _customEvent_moveRight():Void
	{
		
		actor.applyImpulse(1, asNumber(_IsometricMovement), accel);
		actor.setAnimation("" + animRight);
		dir = asNumber(4);
		propertyChanged("dir", dir);
	}
	public function _customEvent_moveDown():Void
	{
		
		actor.applyImpulse(-(asNumber(_IsometricMovement)), 1, accel);
		actor.setAnimation("" + animDown);
		dir = asNumber(2);
		propertyChanged("dir", dir);
	}
	public function _customEvent_moveUp():Void
	{
		
		actor.applyImpulse(asNumber(_IsometricMovement), -1, accel);
		actor.setAnimation("" + animUp);
		dir = asNumber(1);
		propertyChanged("dir", dir);
	}
	public function _customEvent_moveLeft():Void
	{
		
		actor.applyImpulse(-1, -(asNumber(_IsometricMovement)), accel);
		actor.setAnimation("" + animLeft);
		dir = asNumber(3);
		propertyChanged("dir", dir);
	}
	
	
	public function new(dummy:Int, actor:Actor, dummy2:Engine)
	{
		super(actor);
		nameMap.set("Actor", "actor");
		nameMap.set("Up Animation", "animUp");
		nameMap.set("Down Animation", "animDown");
		nameMap.set("Left Animation", "animLeft");
		nameMap.set("Right Animation", "animRight");
		nameMap.set("Up Control", "controlUp");
		nameMap.set("Down Control", "controlDown");
		nameMap.set("Left Control", "controlLeft");
		nameMap.set("Right Control", "controlRight");
		nameMap.set("Initial Direction", "dir");
		dir = 0.0;
		nameMap.set("Acceleration", "accel");
		accel = 50.0;
		nameMap.set("Top Speed", "topSpeed");
		topSpeed = 18.0;
		nameMap.set("Slowdown Rate", "decel");
		decel = 0.0;
		nameMap.set("Up Animation (Idle)", "ianimUp");
		nameMap.set("Down Animation (Idle)", "ianimDown");
		nameMap.set("Left Animation (Idle)", "ianimLeft");
		nameMap.set("Right Animation (Idle)", "ianimRight");
		nameMap.set("Player Controlled?", "player");
		player = true;
		nameMap.set("Pressed Left?", "pressedLeft");
		pressedLeft = false;
		nameMap.set("Pressed Right?", "pressedRight");
		pressedRight = false;
		nameMap.set("Pressed Up?", "pressedUp");
		pressedUp = false;
		nameMap.set("Pressed Down?", "pressedDown");
		pressedDown = false;
		nameMap.set("Idle Threshold", "idleSpeed");
		idleSpeed = 0.03;
		nameMap.set("Isometric Movement?", "_IsometricMovement");
		_IsometricMovement = false;
		nameMap.set("8 Way Movement?", "_8WayMovement");
		_8WayMovement = false;
		
	}
	
	override public function init()
	{
		
		/* ======================== When Updating ========================= */
		addWhenUpdatedListener(null, function(elapsedTime:Float, list:Array<Dynamic>):Void
		{
			if(wrapper.enabled)
			{
				if(player)
				{
					_customEvent_checkInput();
				}
				if((!(pressedLeft) && !(pressedRight)))
				{
					actor.setXVelocity((actor.getXVelocity() * decel));
					if((Math.abs(actor.getXVelocity()) < idleSpeed))
					{
						if((dir == 3))
						{
							actor.setAnimation("" + ianimLeft);
						}
						else
						{
							if((dir == 4))
							{
								actor.setAnimation("" + ianimRight);
							}
						}
					}
				}
				if((!(pressedUp) && !(pressedDown)))
				{
					actor.setYVelocity((actor.getYVelocity() * decel));
					if((Math.abs(actor.getYVelocity()) < idleSpeed))
					{
						if((dir == 1))
						{
							actor.setAnimation("" + ianimUp);
						}
						else
						{
							if((dir == 2))
							{
								actor.setAnimation("" + ianimDown);
							}
						}
					}
				}
				if(pressedLeft)
				{
					if(!(_8WayMovement))
					{
						if(!(((pressedRight || pressedDown) || pressedUp)))
						{
							_customEvent_moveLeft();
						}
					}
					else
					{
						_customEvent_moveLeft();
					}
				}
				else
				{
					if(pressedRight)
					{
						if(!(_8WayMovement))
						{
							if(!(((pressedLeft || pressedDown) || pressedUp)))
							{
								_customEvent_moveRight();
							}
						}
						else
						{
							_customEvent_moveRight();
						}
					}
				}
				if(pressedUp)
				{
					if(!(_8WayMovement))
					{
						if(!(((pressedLeft || pressedRight) || pressedDown)))
						{
							_customEvent_moveUp();
						}
					}
					else
					{
						_customEvent_moveUp();
					}
				}
				else
				{
					if(pressedDown)
					{
						if(!(_8WayMovement))
						{
							if(!(((pressedLeft || pressedRight) || pressedUp)))
							{
								_customEvent_moveDown();
							}
						}
						else
						{
							_customEvent_moveDown();
						}
					}
				}
				if((actor.getXVelocity() > topSpeed))
				{
					actor.setXVelocity(topSpeed);
				}
				else
				{
					if((actor.getXVelocity() < -(topSpeed)))
					{
						actor.setXVelocity(-(topSpeed));
					}
				}
				if((actor.getYVelocity() > topSpeed))
				{
					actor.setYVelocity(topSpeed);
				}
				else
				{
					if((actor.getYVelocity() < -(topSpeed)))
					{
						actor.setYVelocity(-(topSpeed));
					}
				}
			}
		});
		
	}
	
	override public function forwardMessage(msg:String)
	{
		
	}
}