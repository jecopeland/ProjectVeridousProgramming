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
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2TimeStep;

	
/**
* The pulley joint is connected to two bodies and two fixed ground points.
* The pulley supports a ratio such that:
* length1 + ratio * length2 <= constant
* Yes, the force transmitted is scaled by the ratio.
* The pulley also enforces a maximum length limit on both sides. This is
* useful to prevent one side of the pulley hitting the top.
* @see b2PulleyJointDef
*/
class B2PulleyJoint extends B2Joint
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
	public override function getReactionForce(inv_dt:Float) :B2Vec2
	{
		return null;
	}

	/** @inheritDoc */
	public override function getReactionTorque(inv_dt:Float) :Float
	{
		return 0.0;
	}

	/**
	 * Get the first ground anchor.
	 */
	public function getGroundAnchorA() :B2Vec2
	{
		return null;
	}

	/**
	 * Get the second ground anchor.
	 */
	public function getGroundAnchorB() :B2Vec2
	{
		return null;
	}

	/**
	 * Get the current length of the segment attached to body1.
	 */
	public function getLength1() :Float
	{
		return 0;
	}

	/**
	 * Get the current length of the segment attached to body2.
	 */
	public function getLength2() :Float
	{
		return 0;
	}

	/**
	 * Get the pulley ratio.
	 */
	public function getRatio():Float{
		return 0;
	}

	//--------------- Internals Below -------------------

	/** @private */
	public function new (def:B2PulleyJointDef){
		
		// parent
		super(def);
	}

	public override function initVelocityConstraints(step:B2TimeStep) : Void{
	}
	
	public override function solveVelocityConstraints(step:B2TimeStep) : Void 
	{
	}
	
	public override function solvePositionConstraints(baumgarte:Float):Bool 
	{
		return false;
	}
	
	

	private var m_ground:B2Body;
	private var m_groundAnchor1:B2Vec2;
	private var m_groundAnchor2:B2Vec2;
	private var m_localAnchor1:B2Vec2;
	private var m_localAnchor2:B2Vec2;

	private var m_u1:B2Vec2;
	private var m_u2:B2Vec2;
	
	private var m_constant:Float;
	private var m_ratio:Float;
	
	private var m_maxLength1:Float;
	private var m_maxLength2:Float;

	// Effective masses
	private var m_pulleyMass:Float;
	private var m_limitMass1:Float;
	private var m_limitMass2:Float;

	// Impulses for accumulation/warm starting.
	private var m_impulse:Float;
	private var m_limitImpulse1:Float;
	private var m_limitImpulse2:Float;

	private var m_state:Int;
	private var m_limitState1:Int;
	private var m_limitState2:Int;
	
	// static
	static public var b2_minPulleyLength:Float = 2.0;
}