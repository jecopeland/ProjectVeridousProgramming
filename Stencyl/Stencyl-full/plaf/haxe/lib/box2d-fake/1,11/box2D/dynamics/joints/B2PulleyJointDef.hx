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
	
	
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;



/**
* Pulley joint definition. This requires two ground anchors,
* two dynamic body anchor points, max lengths for each side,
* and a pulley ratio.
* @see b2PulleyJoint
*/

class B2PulleyJointDef extends B2JointDef
{
	public function new()
	{
		super ();
	}
	
	public function initialize(bA:B2Body, bB:B2Body,
				gaA:B2Vec2, gaB:B2Vec2,
				anchorA:B2Vec2, anchorB:B2Vec2,
				r:Float) : Void
	{
	}

	/**
	* The first ground anchor in world coordinates. This point never moves.
	*/
	public var groundAnchorA:B2Vec2;
	
	/**
	* The second ground anchor in world coordinates. This point never moves.
	*/
	public var groundAnchorB:B2Vec2;
	
	/**
	* The local anchor point relative to bodyA's origin.
	*/
	public var localAnchorA:B2Vec2;
	
	/**
	* The local anchor point relative to bodyB's origin.
	*/
	public var localAnchorB:B2Vec2;
	
	/**
	* The a reference length for the segment attached to bodyA.
	*/
	public var lengthA:Float;
	
	/**
	* The maximum length of the segment attached to bodyA.
	*/
	public var maxLengthA:Float;
	
	/**
	* The a reference length for the segment attached to bodyB.
	*/
	public var lengthB:Float;
	
	/**
	* The maximum length of the segment attached to bodyB.
	*/
	public var maxLengthB:Float;
	
	/**
	* The pulley ratio, used to simulate a block-and-tackle.
	*/
	public var ratio:Float;
	
}