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

package box2D.dynamics.contacts;


import box2D.collision.B2ContactID;
import box2D.collision.B2Manifold;
import box2D.collision.B2ManifoldPoint;
import box2D.collision.B2TimeOfImpact;
import box2D.collision.B2TOIInput;
import box2D.collision.B2WorldManifold;
import box2D.collision.shapes.B2Shape;
import box2D.common.B2Settings;
import box2D.common.math.B2Sweep;
import box2D.common.math.B2Transform;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2ContactListener;
import box2D.dynamics.B2Fixture;


//typedef b2Contact* b2ContactCreateFcn(b2Shape* shape1, b2Shape* shape2, b2BlockAllocator* allocator);
//typedef void b2ContactDestroyFcn(b2Contact* contact, b2BlockAllocator* allocator);



/**
* The class manages contact between two shapes. A contact exists for each overlapping
* AABB in the broad-phase (except if filtered). Therefore a contact object may exist
* that has no contact points.
*/
class B2Contact
{
	/**
	 * Get the contact manifold. Do not modify the manifold unless you understand the
	 * internals of Box2D
	 */
	public function getManifold():B2Manifold
	{
		return null;
	}
	
	/**
	 * Get the world manifold
	 */
	public function getWorldManifold(worldManifold:B2WorldManifold):Void
	{
	}
	
	/**
	 * Is this contact touching.
	 */
	public function isTouching():Bool
	{
		return false;
	}
	
	/**
	 * Does this contact generate TOI events for continuous simulation
	 */
	public function isContinuous():Bool
	{
		return false; 
	}
	
	/**
	 * Change this to be a sensor or-non-sensor contact.
	 */
	public function setSensor(sensor:Bool):Void{
	}
	
	/**
	 * Is this contact a sensor?
	 */
	public function isSensor():Bool{
		return false;
	}
	
	/**
	 * Enable/disable this contact. This can be used inside the pre-solve
	 * contact listener. The contact is only disabled for the current
	 * time step (or sub-step in continuous collision).
	 */
	public function setEnabled(flag:Bool):Void{
	}
	
	/**
	 * Has this contact been disabled?
	 * @return
	 */
	public function isEnabled():Bool {
		return false;
	}
	
	/**
	* Get the next contact in the world's contact list.
	*/
	public function getNext():B2Contact{
		return null;
	}
	
	/**
	* Get the first fixture in this contact.
	*/
	public function getFixtureA():B2Fixture
	{
		return null;
	}
	
	/**
	* Get the second fixture in this contact.
	*/
	public function getFixtureB():B2Fixture
	{
		return null;
	}
	
	/**
	 * Flag this contact for filtering. Filtering will occur the next time step.
	 */
	public function flagForFiltering():Void
	{
	}

	//--------------- Internals Below -------------------
	
	// m_flags
	// enum
	// This contact should not participate in Solve
	// The contact equivalent of sensors
	static public var e_sensorFlag:Int		= 0x0001;
	// Generate TOI events.
	static public var e_continuousFlag:Int	= 0x0002;
	// Used when crawling contact graph when forming islands.
	static public var e_islandFlag:Int		= 0x0004;
	// Used in SolveTOI to indicate the cached toi value is still valid.
	static public var e_toiFlag:Int		= 0x0008;
	// Set when shapes are touching
	static public var e_touchingFlag:Int	= 0x0010;
	// This contact can be disabled (by user)
	static public var e_enabledFlag:Int	= 0x0020;
	// This contact needs filtering because a fixture filter was changed.
	static public var e_filterFlag:Int		= 0x0040;

	public function new ()
	{
	}
	
	/** @private */
	public function reset(fixtureA:B2Fixture = null, fixtureB:B2Fixture = null):Void
	{
	}
	
	public function update(listener:B2ContactListener) : Void
	{
	}

	//virtual ~b2Contact() {}

	public function evaluate() : Void{}
	
	private static var s_input:B2TOIInput = new B2TOIInput();
	public function computeTOI(sweepA:B2Sweep, sweepB:B2Sweep):Float
	{
		return 0;
	}
	
	public var m_flags:Int;

	// World pool and list pointers.
	public var m_prev:B2Contact;
	public var m_next:B2Contact;

	// Nodes for connecting bodies.
	public var m_nodeA:B2ContactEdge;
	public var m_nodeB:B2ContactEdge;

	public var m_fixtureA:B2Fixture;
	public var m_fixtureB:B2Fixture;

	public var m_manifold:B2Manifold;
	public var m_oldManifold:B2Manifold;
	
	public var m_toi:Float;
	
	//STENCYL
	public var key:Int;
}