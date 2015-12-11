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
import box2D.collision.shapes.B2MassData;
import box2D.collision.shapes.B2Shape;
import box2D.common.math.B2Math;
import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;
import box2D.dynamics.contacts.B2Contact;
import box2D.dynamics.contacts.B2ContactEdge;


/**
 * A fixture is used to attach a shape to a body for collision detection. A fixture
 * inherits its transform from its parent. Fixtures hold additional non-geometric data
 * such as friction, collision filters, etc.
 * Fixtures are created via b2Body::CreateFixture.
 * @warning you cannot reuse fixtures.
 */
class B2Fixture
{
	/**
	 * Get the type of the child shape. You can use this to down cast to the concrete shape.
	 * @return the shape type.
	 */
	public function getType():Int
	{
		return 0;
	}
	
	/**
	 * Get the child shape. You can modify the child shape, however you should not change the
	 * number of vertices because this will crash some collision caching mechanisms.
	 */
	public function getShape():B2Shape
	{
		return null;
	}
	
	/**
	 * Set if this fixture is a sensor.
	 */
	public function setSensor(sensor:Bool):Void
	{
	}
	
	/**
	 * Is this fixture a sensor (non-solid)?
	 * @return the true if the shape is a sensor.
	 */
	public function isSensor():Bool
	{
		return false;
	}
	
	/**
	 * Set the contact filtering data. This will not update contacts until the next time
	 * step when either parent body is active and awake.
	 */
	public function setFilterData(filter:B2FilterData):Void
	{
	}
	
	/**
	 * Get the contact filtering data.
	 */
	public function getFilterData(): B2FilterData
	{
		return null;
	}
	
	/**
	 * Get the parent body of this fixture. This is NULL if the fixture is not attached.
	 * @return the parent body.
	 */
	public function getBody():B2Body
	{
		return null;
	}
	
	/**
	 * Get the next fixture in the parent body's fixture list.
	 * @return the next shape.
	 */
	public function getNext():B2Fixture
	{
		return null;
	}
	
	/**
	 * Get the user data that was assigned in the fixture definition. Use this to
	 * store your application specific data.
	 */
	public function getUserData():Dynamic
	{
		return null;
	}
	
	/**
	 * Set the user data. Use this to store your application specific data.
	 */
	public function SetUserData(data:Dynamic):Void
	{
	}
	
	/**
	 * Test a point for containment in this fixture.
	 * @param xf the shape world transform.
	 * @param p a point in world coordinates.
	 */
	public function testPoint(p:B2Vec2):Bool
	{
		return false;
	}
	
	/**
	 * Perform a ray cast against this shape.
	 * @param output the ray-cast results.
	 * @param input the ray-cast input parameters.
	 */
	public function rayCast(output:B2RayCastOutput, input:B2RayCastInput):Bool
	{
		return false;
	}
	
	/**
	 * Get the mass data for this fixture. The mass data is based on the density and
	 * the shape. The rotational inertia is about the shape's origin. This operation may be expensive
	 * @param massData - this is a reference to a valid massData, if it is null a new B2MassData is allocated and then returned
	 * @note if the input is null then you must get the return value.
	 */
	public function getMassData(massData:B2MassData = null):B2MassData
	{
		return null;
	}
	
	/**
	 * Set the density of this fixture. This will _not_ automatically adjust the mass
	 * of the body. You must call b2Body::ResetMassData to update the body's mass.
	 * @param	density
	 */
	public function setDensity(density:Float):Void {
	}
	
	/**
	 * Get the density of this fixture.
	 * @return density
	 */
	public function getDensity():Float {
		return 0;
	}
	
	/**
	 * Get the coefficient of friction.
	 */
	public function getFriction():Float
	{
		return 0;
	}
	
	/**
	 * Set the coefficient of friction.
	 */
	public function setFriction(friction:Float):Void
	{
	}
	
	/**
	 * Get the coefficient of restitution.
	 */
	public function getRestitution():Float
	{
		return 0;
	}
	
	/**
	 * Get the coefficient of restitution.
	 */
	public function setRestitution(restitution:Float):Void
	{
	}
	
	/**
	 * Get the fixture's AABB. This AABB may be enlarge and/or stale.
	 * If you need a more accurate AABB, compute it using the shape and
	 * the body transform.
	 * @return
	 */
	public function getAABB():B2AABB {
		return null;
	}
	
	/**
	 * @private
	 */
	public function new ()
	{
	}
	
	/**
	 * the destructor cannot access the allocator (no destructor arguments allowed by C++).
	 *  We need separation create/destroy functions from the constructor/destructor because
	 */
	public function create( body:B2Body, xf:B2Transform, def:B2FixtureDef):Void
	{
	}
	
	/**
	 * the destructor cannot access the allocator (no destructor arguments allowed by C++).
	 *  We need separation create/destroy functions from the constructor/destructor because
	 */
	public function destroy():Void
	{
	}
	
	/**
	 * This supports body activation/deactivation.
	 */ 
	public function createProxy(broadPhase:IBroadPhase, xf:B2Transform):Void {
	}
	
	/**
	 * This supports body activation/deactivation.
	 */
	public function destroyProxy(broadPhase:IBroadPhase):Void {
	}
	
	public function synchronize(broadPhase:IBroadPhase, transform1:B2Transform, transform2:B2Transform):Void
	{
	}
	
	private var m_massData:B2MassData;
	
	public var m_aabb:B2AABB;
	public var m_density:Float;
	public var m_next:B2Fixture;
	public var m_body:B2Body;
	public var m_shape:B2Shape;
	
	public var m_friction:Float;
	public var m_restitution:Float;
	
	public var m_proxy:Dynamic;
	public var m_filter:B2FilterData;
	
	public var m_isSensor:Bool;
	
	public var m_userData:Dynamic;
	
	//STENCYL
	public var groupID:Int;
}