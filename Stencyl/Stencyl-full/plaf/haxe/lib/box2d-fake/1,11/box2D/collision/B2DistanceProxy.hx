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

package box2D.collision;


import box2D.collision.shapes.B2CircleShape;
import box2D.collision.shapes.B2PolygonShape;
import box2D.collision.shapes.B2Shape;
import box2D.common.B2Settings;
import box2D.common.math.B2Vec2;


/**
 * A distance proxy is used by the GJK algorithm.
 * It encapsulates any shape.
 */
class B2DistanceProxy 
{
	/**
	 * Initialize the proxy using the given shape. The shape
	 * must remain in scope while the proxy is in use.
	 */
	public function set(shape:B2Shape):Void
	{
	}
	
	/**
	 * Get the supporting vertex index in the given direction.
	 */
	public function getSupport(d:B2Vec2):Float
	{
		return 0;
	}
	
	/**
	 * Get the supporting vertex in the given direction.
	 */
	public function getSupportVertex(d:B2Vec2):B2Vec2
	{
		return null;
	}
	
	/**
	 * Get the vertex count.
	 */
	public function getVertexCount():Int
	{
		return 0;
	}
	
	/**
	 * Get a vertex by index. Used by b2Distance.
	 */
	public function getVertex(index:Int):B2Vec2
	{
		return null;
	}
	
	
	public function new () {	
	}
	
	public var m_vertices:Array <B2Vec2>;
	public var m_count:Int;
	public var m_radius:Float;
}