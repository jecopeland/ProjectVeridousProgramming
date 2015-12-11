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

package box2D.dynamics;


import box2D.collision.B2AABB;
import box2D.collision.B2RayCastInput;
import box2D.collision.B2RayCastOutput;
import box2D.collision.IBroadPhase;
import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2EdgeShape;
import box2D.collision.shapes.B2PolygonShape;
import box2D.collision.shapes.B2Shape;
import box2D.common.B2Color;
import box2D.common.B2Settings;
import box2D.common.math.B2Math;
import box2D.common.math.B2Sweep;
import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;
import box2D.dynamics.contacts.B2Contact;
import box2D.dynamics.contacts.B2ContactEdge;
import box2D.dynamics.contacts.B2ContactSolver;
import box2D.dynamics.controllers.B2Controller;
import box2D.dynamics.controllers.B2ControllerEdge;
import box2D.dynamics.joints.B2Joint;
import box2D.dynamics.joints.B2JointDef;
import box2D.dynamics.joints.B2JointEdge;
import box2D.dynamics.joints.B2PulleyJoint;

class B2World
{
	public function new (gravity:B2Vec2, doSleep:Bool){
	}

	public function setDestructionListener(listener:B2DestructionListener) : Void{
		m_destructionListener = listener;
	}

	/**
	* Register a contact filter to provide specific control over collision.
	* Otherwise the default filter is used (b2_defaultFilter).
	*/
	public function setContactFilter(filter:B2ContactFilter) : Void{
	}

	/**
	* Register a contact event listener
	*/
	public function setContactListener(listener:B2ContactListener) : Void{
	}

	/**
	* Register a routine for debug drawing. The debug draw functions are called
	* inside the b2World::Step method, so make sure your renderer is ready to
	* consume draw commands when you call Step().
	*/
	public function setDebugDraw(debugDraw:B2DebugDraw) : Void{
	}
	
	/**
	 * Use the given object as a broadphase.
	 * The old broadphase will not be cleanly emptied.
	 * @warning It is not recommended you call this except immediately after constructing the world.
	 * @warning This function is locked during callbacks.
	 */
	public function setBroadPhase(broadPhase:IBroadPhase) : Void {
	}
	
	/**
	* Perform validation of internal data structures.
	*/
	public function validate() : Void
	{
	}
	
	/**
	* Get the number of broad-phase proxies.
	*/
	public function getProxyCount() : Int
	{
		return 0;
	}
	
	/**
	* Create a rigid body given a definition. No reference to the definition
	* is retained.
	* @warning This function is locked during callbacks.
	*/
	public function createBody(def:B2BodyDef) : B2Body{
		return null;
	}

	/**
	* Destroy a rigid body given a definition. No reference to the definition
	* is retained. This function is locked during callbacks.
	* @warning This automatically deletes all associated shapes and joints.
	* @warning This function is locked during callbacks.
	*/
	public function destroyBody(b:B2Body) : Void{
	}

	/**
	* Create a joint to constrain bodies together. No reference to the definition
	* is retained. This may cause the connected bodies to cease colliding.
	* @warning This function is locked during callbacks.
	*/
	public function createJoint(def:B2JointDef) : B2Joint{
		return null;
	}

	/**
	* Destroy a joint. This may cause the connected bodies to begin colliding.
	* @warning This function is locked during callbacks.
	*/
	public function destroyJoint(j:B2Joint) : Void{
	}
	
	/**
	 * Add a controller to the world list
	 */
	public function addController(c:B2Controller) : B2Controller
	{
		return null;
	}
	
	public function removeController(c:B2Controller) : Void
	{
	}

	public function createController(controller:B2Controller):B2Controller
	{
		return null;
	}
	
	public function destroyController(controller:B2Controller):Void
	{
	}
	
	/**
	* Enable/disable warm starting. For testing.
	*/
	public function setWarmStarting(flag: Bool) : Void { }

	/**
	* Enable/disable continuous physics. For testing.
	*/
	public function setContinuousPhysics(flag: Bool) : Void { }
	
	/**
	* Get the number of bodies.
	*/
	public function getBodyCount() : Int
	{
		return 0;
	}
	
	/**
	* Get the number of joints.
	*/
	public function getJointCount() : Int
	{
		return 0;
	}
	
	/**
	* Get the number of contacts (each may have 0 or more contact points).
	*/
	public function getContactCount() : Int
	{
		return 0;
	}
	
	/**
	* Change the global gravity vector.
	*/
	public function setGravity(gravity: B2Vec2): Void
	{
	}

	/**
	* Get the global gravity vector.
	*/
	public function getGravity():B2Vec2{
		return null;
	}

	/**
	* The world provides a single static ground body with no collision shapes.
	* You can use this to simplify the creation of joints and static shapes.
	*/
	public function getGroundBody() : B2Body{
		return null;
	}

	private static var s_timestep2:B2TimeStep = new B2TimeStep();

	public function step(dt:Float, velocityIterations:Int, positionIterations:Int) : Void{
	}
	
	public function clearForces() : Void
	{
	}
	
	static private var s_xf:B2Transform = new B2Transform();

	public function drawDebugData() : Void{
	}

	public function queryAABB(callbackMethod:B2Fixture -> Dynamic, aabb:B2AABB):Void
	{
		
	}
	
	public function queryShape(callbackMethod:B2Fixture -> Dynamic, shape:B2Shape, transform:B2Transform = null):Void
	{
		
	}
	
	public function queryPoint(callbackMethod:B2Fixture -> Dynamic, p:B2Vec2):Void
	{
		
	}
	
	public function rayCast(callbackMethod:B2Fixture -> B2Vec2 -> B2Vec2 -> Float -> Dynamic, point1:B2Vec2, point2:B2Vec2):Void
	{
		
	}
	
	public function rayCastOne(point1:B2Vec2, point2:B2Vec2):B2Fixture
	{
		return null;
	}
	
	public function rayCastAll(point1:B2Vec2, point2:B2Vec2):Array <B2Fixture>
	{
		return null;
	}

	/**
	* Get the world body list. With the returned body, use b2Body::GetNext to get
	* the next body in the world list. A NULL body indicates the end of the list.
	* @return the head of the world body list.
	*/
	public function getBodyList() : B2Body{
		return null;
	}

	/**
	* Get the world joint list. With the returned joint, use b2Joint::GetNext to get
	* the next joint in the world list. A NULL joint indicates the end of the list.
	* @return the head of the world joint list.
	*/
	public function getJointList() : B2Joint{
		return null;
	}

	/**
	 * Get the world contact list. With the returned contact, use b2Contact::GetNext to get
	 * the next contact in the world list. A NULL contact indicates the end of the list.
	 * @return the head of the world contact list.
	 * @warning contacts are 
	 */
	public function getContactList():B2Contact
	{
		return null;
	}
	
	/**
	 * Is the world locked (in the middle of a time step).
	 */
	public function isLocked():Bool
	{
		return false;
	}

	private var s_stack:Array <B2Body>;
	public function solve(step:B2TimeStep) : Void{
	}
	
	private static var s_backupA:B2Sweep = new B2Sweep();
	private static var s_backupB:B2Sweep = new B2Sweep();
	private static var s_timestep:B2TimeStep = new B2TimeStep();
	private static var s_queue:Array <B2Body> = new Array <B2Body>();

	public function solveTOI(step:B2TimeStep) : Void{
	}
	
	static private var s_jointColor:B2Color = new B2Color(0.5, 0.8, 0.8);
	//
	public function drawJoint(joint:B2Joint) : Void{
		
	}
	
	public function drawShape(shape:B2Shape, xf:B2Transform, color:B2Color) : Void{
	}
	
	//STENCYL
	public var m_aabb:B2AABB;
	
	public function setScreenBounds(bounds:B2AABB) {
		m_aabb = bounds;
	}
	
	public function getScreenBounds():B2AABB {
		return m_aabb;
	}
	//END STENCYL
	
	public var m_flags:Int;

	public var m_contactManager:B2ContactManager;
	
	// These two are stored purely for efficiency purposes, they don't maintain
	// any data outside of a call to Step
	private var m_contactSolver:B2ContactSolver;
	private var m_island:B2Island;

	public var m_bodyList:B2Body;
	private var m_jointList:B2Joint;

	public var m_contactList:B2Contact;

	private var m_bodyCount:Int;
	public var m_contactCount:Int;
	private var m_jointCount:Int;
	private var m_controllerList:B2Controller;
	private var m_controllerCount:Int;

	public var m_gravity:B2Vec2;
	public var m_allowSleep:Bool;

	public var m_groundBody:B2Body;

	private var m_destructionListener:B2DestructionListener;
	private var m_debugDraw:B2DebugDraw;

	// This is used to compute the time step ratio to support a variable time step.
	private var m_inv_dt0:Float;

	// This is for debugging the solver.
	static public var m_warmStarting:Bool = true;

	// This is for debugging the solver.
	static public var m_continuousPhysics:Bool = false;
	
	// m_flags
	public static var e_newFixture:Int = 0x0001;
	public static var e_locked:Int = 0x0002;
	
}