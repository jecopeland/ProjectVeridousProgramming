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

class B2DistanceJoint extends B2Joint
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
	public override function getReactionForce(inv_dt:Float):B2Vec2
	{
		return null;
	}

	/** @inheritDoc */
	public override function getReactionTorque(inv_dt:Float):Float
	{
		return 0.0;
	}
	
	/// Set the natural length
	public function getLength():Float
	{
		return 0;
	}
	
	/// Get the natural length
	public function setLength(length:Float):Void
	{
	}
	
	/// Get the frequency in Hz
	public function getFrequency():Float
	{
		return 0;
	}
	
	/// Set the frequency in Hz
	public function setFrequency(hz:Float):Void
	{
	}
	
	/// Get damping ratio
	public function getDampingRatio():Float
	{
		return 0;
	}
	
	/// Set damping ratio
	public function setDampingRatio(ratio:Float):Void
	{
	}
	
	//--------------- Internals Below -------------------

	/** @private */
	public function new (def:B2DistanceJointDef){
		super(def);
	}

	public override function initVelocityConstraints(step:B2TimeStep) : Void{
	}
	
	
	
	public override function solveVelocityConstraints(step:B2TimeStep): Void{
		
	}
	
	public override function solvePositionConstraints(baumgarte:Float):Bool
	{
		return false;
	}

	private var m_localAnchor1:B2Vec2;
	private var m_localAnchor2:B2Vec2;
	private var m_u:B2Vec2;
	private var m_frequencyHz:Float;
	private var m_dampingRatio:Float;
	private var m_gamma:Float;
	private var m_bias:Float;
	private var m_impulse:Float;
	private var m_mass:Float;	// effective mass for the constraint.
	private var m_length:Float;
}