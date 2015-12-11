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

package box2D.collision.shapes;


import box2D.collision.B2AABB;
import box2D.collision.B2RayCastInput;
import box2D.collision.B2RayCastOutput;
import box2D.common.B2Settings;
import box2D.common.math.B2Mat22;
import box2D.common.math.B2Math;
import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;


/**
* A circle shape.
* @see b2CircleDef
*/
class B2CircleShape extends B2Shape
{
	override public function copy():B2Shape 
	{
		return null;
	}
	
	override public function set(other:B2Shape):Void 
	{
	}
	
	/**
	* @inheritDoc
	*/
	public override function testPoint(transform:B2Transform, p:B2Vec2) : Bool {
		return false;
	}

	/**
	* @inheritDoc
	*/
	public override function rayCast(output:B2RayCastOutput, input:B2RayCastInput, transform:B2Transform):Bool
	{
		return false;
	}

	/**
	* @inheritDoc
	*/
	public override function computeAABB(aabb:B2AABB, transform:B2Transform) : Void{
	}

	/**
	* @inheritDoc
	*/
	public override function computeMass(massData:B2MassData, density:Float) : Void{
	}
	
	/**
	* @inheritDoc
	*/
	public override function computeSubmergedArea(
			normal:B2Vec2,
			offset:Float,
			xf:B2Transform,
			c:B2Vec2):Float
	{
		return 0;
	}

	/**
	 * Get the local position of this circle in its parent body.
	 */
	public function getLocalPosition() : B2Vec2{
		return null;
	}
	
	/**
	 * Set the local position of this circle in its parent body.
	 */
	public function setLocalPosition(position:B2Vec2):Void {
	}
	
	/**
	 * Get the radius of the circle
	 */
	public function getRadius():Float
	{
		return 0;
	}
	
	/**
	 * Set the radius of the circle
	 */
	public function setRadius(radius:Float):Void
	{
	}

	public function new (radius:Float = 0){
		super();
	}

	// Local position in parent body
	public var m_p:B2Vec2;
	
}