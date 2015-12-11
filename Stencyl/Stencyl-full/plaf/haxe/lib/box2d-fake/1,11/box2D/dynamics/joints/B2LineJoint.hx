/*
* Copyright (c) 2006-2007 Erin Catto http://www.gphysics.com
*
* This software is provided 'as-is', without any express or implied
* warranty.  In no event will the authors be held liable for any damages
* arising from the use of this software.
* Permission is granted to anyone to use this software for any purpose,
* including commercial applications, and to alter it and redistribute it
* freely, subject to the following restrictions:
* 1. The origin of this software must not be misrepresented; you must not
* claim that you wrote the original software. If you use this software
* in a product, an acknowledgment in the product documentation would be
* appreciated but is not required.
* 2. Altered source versions must be plainly marked as such, and must not be
* misrepresented as being the original software.
* 3. This notice may not be removed or altered from any source distribution.
*/

package box2D.dynamics.joints;


import box2D.common.B2Settings;
import box2D.common.math.B2Mat22;
import box2D.common.math.B2Math;
import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2TimeStep;


class B2LineJoint extends B2Joint
{
	/** @inheritDoc */
	public override function getAnchorA():B2Vec2{
		return null;
	}
	/** @inheritDoc */
	public override function getAnchorB():B2Vec2{
		return null;
	}
	/** @inheritDoc */
	public override function getReactionForce(inv_dt:Float) : B2Vec2
	{
		return null;
	}

	/** @inheritDoc */
	public override function getReactionTorque(inv_dt:Float) : Float
	{
		return 0;
	}
	
	/**
	* Get the current joint translation, usually in meters.
	*/
	public function getJointTranslation():Float{
		return 0;
	}
	
	/**
	* Get the current joint translation speed, usually in meters per second.
	*/
	public function getJointSpeed():Float{
		return 0;
	}
	
	/**
	* Is the joint limit enabled?
	*/
	public function isLimitEnabled() : Bool
	{
		return false;
	}
	/**
	* Enable/disable the joint limit.
	*/
	public function enableLimit(flag:Bool) : Void
	{
	}
	/**
	* Get the lower joint limit, usually in meters.
	*/
	public function getLowerLimit() : Float
	{
		return 0;
	}
	/**
	* Get the upper joint limit, usually in meters.
	*/
	public function getUpperLimit() : Float
	{
		return 0;
	}
	/**
	* Set the joint limits, usually in meters.
	*/
	public function setLimits(lower:Float, upper:Float) : Void
	{
	}
	/**
	* Is the joint motor enabled?
	*/
	public function isMotorEnabled() : Bool
	{
		return false;
	}
	/**
	* Enable/disable the joint motor.
	*/
	public function enableMotor(flag:Bool) : Void
	{
	}
	/**
	* Set the motor speed, usually in meters per second.
	*/
	public function setMotorSpeed(speed:Float) : Void
	{
	}
	/**
	* Get the motor speed, usually in meters per second.
	*/
	public function getMotorSpeed() :Float
	{
		return 0;
	}
	
	/**
	 * Set the maximum motor force, usually in N.
	 */
	public function setMaxMotorForce(force:Float) : Void
	{
	}
	
	/**
	 * Get the maximum motor force, usually in N.
	 */
	public function getMaxMotorForce():Float
	{
		return 0;
	}
	
	/**
	* Get the current motor force, usually in N.
	*/
	public function getMotorForce() : Float
	{
		return 0;
	}
	

	//--------------- Internals Below -------------------

	/** @private */
	public function new (def:B2LineJointDef){
		super(def);
	}

	public override function initVelocityConstraints(step:B2TimeStep) : Void{
	}
	
	public override function solveVelocityConstraints(step:B2TimeStep) : Void{
	}
	
	public override function solvePositionConstraints(baumgarte:Float ):Bool
	{
		return false;
	}

	public var m_localAnchor1:B2Vec2;
	public var m_localAnchor2:B2Vec2;
	public var m_localXAxis1:B2Vec2;
	private var m_localYAxis1:B2Vec2;

	private var m_axis:B2Vec2;
	private var m_perp:B2Vec2;
	private var m_s1:Float;
	private var m_s2:Float;
	private var m_a1:Float;
	private var m_a2:Float;
	
	private var m_K:B2Mat22;
	private var m_impulse:B2Vec2;

	private var m_motorMass:Float;			// effective mass for motor/limit translational constraint.
	private var m_motorImpulse:Float;

	private var m_lowerTranslation:Float;
	private var m_upperTranslation:Float;
	private var m_maxMotorForce:Float;
	private var m_motorSpeed:Float;
	
	private var m_enableLimit:Bool;
	private var m_enableMotor:Bool;
	private var m_limitState:Int;
}