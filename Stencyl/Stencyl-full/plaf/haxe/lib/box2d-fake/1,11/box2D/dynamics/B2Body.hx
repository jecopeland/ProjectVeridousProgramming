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


import box2D.collision.IBroadPhase;
import box2D.collision.shapes.B2EdgeShape;
import box2D.collision.shapes.B2MassData;
import box2D.collision.shapes.B2Shape;
import box2D.common.B2Settings;
import box2D.common.math.B2Mat22;
import box2D.common.math.B2Math;
import box2D.common.math.B2Sweep;
import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;
import box2D.dynamics.contacts.B2Contact;
import box2D.dynamics.contacts.B2ContactEdge;
import box2D.dynamics.controllers.B2ControllerEdge;
import box2D.dynamics.joints.B2JointEdge;



/**
* A rigid body.
*/
class B2Body
{
	private function connectEdges(s1: B2EdgeShape, s2: B2EdgeShape, angle1: Float): Float
	{
		return 0;
	}
	
	/**
	 * Creates a fixture and attach it to this body. Use this function if you need
	 * to set some fixture parameters, like friction. Otherwise you can create the
	 * fixture directly from a shape.
	 * If the density is non-zero, this function automatically updates the mass of the body.
	 * Contacts are not created until the next time step.
	 * @param fixtureDef the fixture definition.
	 * @warning This function is locked during callbacks.
	 */
	public function createFixture(def:B2FixtureDef) : B2Fixture{
		return null;
	}

	/**
	 * Creates a fixture from a shape and attach it to this body.
	 * This is a convenience function. Use b2FixtureDef if you need to set parameters
	 * like friction, restitution, user data, or filtering.
	 * This function automatically updates the mass of the body.
	 * @param shape the shape to be cloned.
	 * @param density the shape density (set to zero for static bodies).
	 * @warning This function is locked during callbacks.
	 */
	public function createFixture2(shape:B2Shape, density:Float=0.0):B2Fixture
	{
		return null;
	}
	
	/**
	 * Destroy a fixture. This removes the fixture from the broad-phase and
	 * destroys all contacts associated with this fixture. This will
	 * automatically adjust the mass of the body if the body is dynamic and the
	 * fixture has positive density.
	 * All fixtures attached to a body are implicitly destroyed when the body is destroyed.
	 * @param fixture the fixture to be removed.
	 * @warning This function is locked during callbacks.
	 */
	public function DestroyFixture(fixture:B2Fixture) : Void{
	}

	/**
	* Set the position of the body's origin and rotation (radians).
	* This breaks any contacts and wakes the other bodies.
	* @param position the new world position of the body's origin (not necessarily
	* the center of mass).
	* @param angle the new world rotation angle of the body in radians.
	*/
	public function setPositionAndAngle(position:B2Vec2, angle:Float) : Void{
	}
	
	/**
	 * Set the position of the body's origin and rotation (radians).
	 * This breaks any contacts and wakes the other bodies.
	 * Note this is less efficient than the other overload - you should use that
	 * if the angle is available.
	 * @param xf the transform of position and angle to set the bdoy to.
	 */
	public function setTransform(xf:B2Transform):Void
	{
	}

	/**
	* Get the body transform for the body's origin.
	* @return the world transform of the body's origin.
	*/
	public function getTransform() : B2Transform{
		return null;
	}

	/**
	* Get the world body origin position.
	* @return the world position of the body's origin.
	*/
	public function getPosition() : B2Vec2{
		return null;
	}
	
	/**
	 * Setthe world body origin position.
	 * @param position the new position of the body
	 */
	public function setPosition(position:B2Vec2):Void
	{
	}

	/**
	* Get the angle in radians.
	* @return the current world rotation angle in radians.
	*/
	public function getAngle() : Float{
		return 0;
	}
	
	/**
	 * Set the world body angle
	 * @param angle the new angle of the body.
	 */
	public function setAngle(angle:Float) : Void
	{
	}
	

	/**
	* Get the world position of the center of mass.
	*/
	public function getWorldCenter() : B2Vec2{
		return null;
	}

	/**
	* Get the local position of the center of mass.
	*/
	public function getLocalCenter() : B2Vec2{
		return null;
	}

	/**
	* Set the linear velocity of the center of mass.
	* @param v the new linear velocity of the center of mass.
	*/
	public function setLinearVelocity(v:B2Vec2) : Void {
	}

	/**
	* Get the linear velocity of the center of mass.
	* @return the linear velocity of the center of mass.
	*/
	public function getLinearVelocity() : B2Vec2{
		return null;
	}

	/**
	* Set the angular velocity.
	* @param omega the new angular velocity in radians/second.
	*/
	public function setAngularVelocity(omega:Float) : Void {
	}

	/**
	* Get the angular velocity.
	* @return the angular velocity in radians/second.
	*/
	public function getAngularVelocity() : Float{
		return 0;
	}
	
	/**
	 * Get the definition containing the body properties.
	 * @asonly
	 */
	public function getDefinition() : B2BodyDef
	{
		return null;
	}

	/**
	* Apply a force at a world point. If the force is not
	* applied at the center of mass, it will generate a torque and
	* affect the angular velocity. This wakes up the body.
	* @param force the world force vector, usually in Newtons (N).
	* @param point the world position of the point of application.
	*/
	public function applyForce(force:B2Vec2, point:B2Vec2) : Void{
	}

	/**
	* Apply a torque. This affects the angular velocity
	* without affecting the linear velocity of the center of mass.
	* This wakes up the body.
	* @param torque about the z-axis (out of the screen), usually in N-m.
	*/
	public function applyTorque(torque:Float) : Void {
	}

	/**
	* Apply an impulse at a point. This immediately modifies the velocity.
	* It also modifies the angular velocity if the point of application
	* is not at the center of mass. This wakes up the body.
	* @param impulse the world impulse vector, usually in N-seconds or kg-m/s.
	* @param point the world position of the point of application.
	*/
	public function applyImpulse(impulse:B2Vec2, point:B2Vec2) : Void{
	}
	
	/**
	 * Splits a body into two, preserving dynamic properties
	 * @param	callback Called once per fixture, return true to move this fixture to the new body
	 * <code>function Callback(fixture:B2Fixture):Bool</code>
	 * @return The newly created bodies
	 * @asonly
	 */
	public function split(callbackMethod:B2Fixture -> Bool):B2Body
	{
		return null;
	}

	/**
	 * Merges another body into this. Only fixtures, mass and velocity are effected,
	 * Other properties are ignored
	 * @asonly
	 */
	public function merge(other:B2Body):Void
	{
	}
	
	/**
	* Get the total mass of the body.
	* @return the mass, usually in kilograms (kg).
	*/
	public function getMass() : Float{
		return 0;
	}

	/**
	* Get the central rotational inertia of the body.
	* @return the rotational inertia, usually in kg-m^2.
	*/
	public function getInertia() : Float{
		return 0;
	}
	
	/** 
	 * Get the mass data of the body. The rotational inertial is relative to the center of mass.
	 */
	public function getMassData(data:B2MassData):Void
	{
	}
	
	/**
	 * Set the mass properties to override the mass properties of the fixtures
	 * Note that this changes the center of mass position.
	 * Note that creating or destroying fixtures can also alter the mass.
	 * This function has no effect if the body isn't dynamic.
	 * @warning The supplied rotational inertia should be relative to the center of mass
	 * @param	data the mass properties.
	 */
	public function setMassData(massData:B2MassData):Void
	{
	}
	
	/**
	 * This resets the mass properties to the sum of the mass properties of the fixtures.
	 * This normally does not need to be called unless you called SetMassData to override
	 * the mass and later you want to reset the mass.
	 */
	public function resetMassData():Void
	{
	}
	  
	/**
	 * Get the world coordinates of a point given the local coordinates.
	 * @param localPoint a point on the body measured relative the the body's origin.
	 * @return the same point expressed in world coordinates.
	 */
	public function getWorldPoint(localPoint:B2Vec2) : B2Vec2{
		return null;
	}

	/**
	 * Get the world coordinates of a vector given the local coordinates.
	 * @param localVector a vector fixed in the body.
	 * @return the same vector expressed in world coordinates.
	 */
	public function getWorldVector(localVector:B2Vec2) : B2Vec2{
		return null;
	}

	/**
	 * Gets a local point relative to the body's origin given a world point.
	 * @param a point in world coordinates.
	 * @return the corresponding local point relative to the body's origin.
	 */
	public function getLocalPoint(worldPoint:B2Vec2) : B2Vec2{
		return null;
	}

	/**
	 * Gets a local vector given a world vector.
	 * @param a vector in world coordinates.
	 * @return the corresponding local vector.
	 */
	public function getLocalVector(worldVector:B2Vec2) : B2Vec2{
		return null;
	}
	
	/**
	* Get the world linear velocity of a world point attached to this body.
	* @param a point in world coordinates.
	* @return the world velocity of a point.
	*/
	public function getLinearVelocityFromWorldPoint(worldPoint:B2Vec2) : B2Vec2
	{
		return null;
	}
	
	/**
	* Get the world velocity of a local point.
	* @param a point in local coordinates.
	* @return the world velocity of a point.
	*/
	public function getLinearVelocityFromLocalPoint(localPoint:B2Vec2) : B2Vec2
	{
		return null;
	}
	
	/**
	* Get the linear damping of the body.
	*/
	public function getLinearDamping():Float
	{
		return 0;
	}
	
	/**
	* Set the linear damping of the body.
	*/
	public function setLinearDamping(linearDamping:Float):Void
	{
	}
	
	/**
	* Get the angular damping of the body
	*/
	public function getAngularDamping():Float
	{
		return 0;
	}
	
	/**
	* Set the angular damping of the body.
	*/
	public function setAngularDamping(angularDamping:Float):Void
	{
	}
	
	/**
	 * Set the type of this body. This may alter the mass and velocity
	 * @param	type - enum stored as a static member of b2Body
	 */ 
	public function setType( type:Int ):Void
	{
	}
	
	/**
	 * Get the type of this body.
	 * @return type enum as a uint
	 */ 
	public function getType():Int
	{
		return 0;
	}

	/**
	* Should this body be treated like a bullet for continuous collision detection?
	*/
	public function setBullet(flag:Bool) : Void{
	}

	/**
	* Is this body treated like a bullet for continuous collision detection?
	*/
	public function isBullet() : Bool{
		return false;
	}
	
	/**
	 * Is this body allowed to sleep
	 * @param	flag
	 */
	public function setSleepingAllowed(flag:Bool):Void{
	}
	
	/**
	 * Set the sleep state of the body. A sleeping body has vety low CPU cost.
	 * @param	flag - set to true to put body to sleep, false to wake it
	 */
	public function setAwake(flag:Bool):Void {
	}
	
	/**
	 * Get the sleeping state of this body.
	 * @return true if body is sleeping
	 */
	public function isAwake():Bool {
		return false;
	}
	
	/**
	 * Set this body to have fixed rotation. This causes the mass to be reset.
	 * @param	fixed - true means no rotation
	 */
	public function setFixedRotation(fixed:Bool):Void
	{
	}
	
	/**
	* Does this body have fixed rotation?
	* @return true means fixed rotation
	*/
	public function isFixedRotation():Bool
	{
		return false;
	}
	
	/** Set the active state of the body. An inactive body is not
	* simulated and cannot be collided with or woken up.
	* If you pass a flag of true, all fixtures will be added to the
	* broad-phase.
	* If you pass a flag of false, all fixtures will be removed from
	* the broad-phase and all contacts will be destroyed.
	* Fixtures and joints are otherwise unaffected. You may continue
	* to create/destroy fixtures and joints on inactive bodies.
	* Fixtures on an inactive body are implicitly inactive and will
	* not participate in collisions, ray-casts, or queries.
	* Joints connected to an inactive body are implicitly inactive.
	* An inactive body is still owned by a b2World object and remains
	* in the body list.
	*/
	public function setActive( flag:Bool ):Void{
	}
	
	/**
	 * Get the active state of the body.
	 * @return true if active.
	 */ 
	public function isActive():Bool{
		return false;
	}
	
	/**
	* Is this body allowed to sleep?
	*/
	public function isSleepingAllowed():Bool
	{
		return false;
	}

	/**
	* Get the list of all fixtures attached to this body.
	*/
	public function getFixtureList() : B2Fixture{
		return null;
	}

	/**
	* Get the list of all joints attached to this body.
	*/
	public function getJointList() : B2JointEdge{
		return null;
	}
	
	/**
	 * Get the list of all controllers attached to this body.
	 */
	public function getControllerList() : B2ControllerEdge {
		return null;
	}
	
	/**
	 * Get a list of all contacts attached to this body.
	 */
	public function getContactList():B2ContactEdge {
		return null;
	}

	/**
	* Get the next body in the world's body list.
	*/
	public function getNext() : B2Body{
		return null;
	}

	/**
	* Get the user data pointer that was provided in the body definition.
	*/
	public function getUserData() : Dynamic{
		return null;
	}

	/**
	* Set the user data. Use this to store your application specific data.
	*/
	public function setUserData(data:Dynamic) : Void
	{
	}

	/**
	* Get the parent world of this body.
	*/
	public function getWorld(): B2World
	{
		return null;
	}
	
	//STENCYL
	public function setFriction(friction:Float)
	{
	}
	
	public function setBounciness(bounciness:Float)
	{
	}
	
	public function setPaused(flag:Bool) 
	{
	}
	
	public function isPaused():Bool
	{
		return false;
	}
	
	public function setIgnoreGravity(flag:Bool) {
	}
	
	public function isIgnoringGravity():Bool {
		return false;
	}
	
	public function setAlwaysActive(flag:Bool) {
	}
	
	public function isAlwaysActive():Bool {
		return false;
	}

	//--------------- Internals Below -------------------

	
	// Constructor
	/**
	 * @private
	 */
	public function new (bd:B2BodyDef, world:B2World) {
	}
	
	// Destructor
	//~b2Body();

	//
	static private var s_xf1:B2Transform = new B2Transform();
	//
	public function synchronizeFixtures() : Void{
	}

	public function synchronizeTransform() : Void{
		
	}

	// This is used to prevent connected bodies from colliding.
	// It may lie, depending on the collideConnected flag.
	public function shouldCollide(other:B2Body) : Bool {
	
		return true;
	}

	public function advance(t:Float) : Void{
	}

	public var m_flags:Int;
	public var m_type:Int;
	
	public var m_islandIndex:Int;

	public var m_xf:B2Transform;		// the body origin transform

	public var m_sweep:B2Sweep;	// the swept motion for CCD

	public var m_linearVelocity:B2Vec2;
	public var m_angularVelocity:Float;

	public var m_force:B2Vec2;
	public var m_torque:Float;

	public var m_world:B2World;
	public var m_prev:B2Body;
	public var m_next:B2Body;

	public var m_fixtureList:B2Fixture;
	public var m_fixtureCount:Int;
	
	public var m_controllerList:B2ControllerEdge;
	public var m_controllerCount:Int;

	public var m_jointList:B2JointEdge;
	public var m_contactList:B2ContactEdge;

	public var m_mass:Float;
	public var m_invMass:Float;
	public var m_I:Float;
	public var m_invI:Float;
	
	public var m_inertiaScale:Float;

	public var m_linearDamping:Float;
	public var m_angularDamping:Float;

	public var m_sleepTime:Float;

	private var m_userData:Dynamic;
	
	//STENCYL
	public var groupID:Int;
	
	
	// m_flags
	//enum
	//{
		static public var e_islandFlag:Int			= 0x0001;
		static public var e_awakeFlag:Int			= 0x0002;
		static public var e_allowSleepFlag:Int		= 0x0004;
		static public var e_bulletFlag:Int			= 0x0008;
		static public var e_fixedRotationFlag:Int	= 0x0010;
		static public var e_activeFlag:Int			= 0x0020;
	//};

	// m_type
	//enum
	//{
		/// The body type.
		/// static: zero mass, zero velocity, may be manually moved
		/// kinematic: zero mass, non-zero velocity set by user, moved by solver
		/// dynamic: positive mass, non-zero velocity determined by forces, moved by solver
		static public var b2_staticBody:Int = 0;
		static public var b2_kinematicBody:Int = 1;
		static public var b2_dynamicBody:Int = 2;
	//};
	
}