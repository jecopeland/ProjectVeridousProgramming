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
import box2D.collision.B2OBB;
import box2D.collision.B2RayCastInput;
import box2D.collision.B2RayCastOutput;
import box2D.common.B2Settings;
import box2D.common.math.B2Mat22;
import box2D.common.math.B2Math;
import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;


/**
* Convex polygon. The vertices must be in CCW order for a right-handed
* coordinate system with the z-axis coming out of the screen.
* @see b2PolygonDef
*/

class B2PolygonShape extends B2Shape
{
	public override function copy():B2Shape 
	{
		return null;
	}
	
	public override function set(other:B2Shape):Void 
	{
	}
	
	/**
	 * Copy vertices. This assumes the vertices define a convex polygon.
	 * It is assumed that the exterior is the the right of each edge.
	 */
	public function setAsArray(vertices:Array <Dynamic>, vertexCount:Float = 0):Void
	{
	}
	
	public static function asArray(vertices:Array <Dynamic>, vertexCount:Float):B2PolygonShape
	{
		return null;
	}
	
	/**
	 * Copy vertices. This assumes the vertices define a convex polygon.
	 * It is assumed that the exterior is the the right of each edge.
	 */
	public function setAsVector(vertices:Array <B2Vec2>, vertexCount:Float = 0):Void
	{
	}
	
	public static function asVector(vertices:Array <B2Vec2>, vertexCount:Float):B2PolygonShape
	{
		return null;
	}
	
	/**
	* Build vertices to represent an axis-aligned box.
	* @param hx the half-width.
	* @param hy the half-height.
	*/
	public function setAsBox(hx:Float, hy:Float) : Void 
	{
	}
	
	public static function asBox(hx:Float, hy:Float):B2PolygonShape
	{
		return null;
	}
	
	/**
	* Build vertices to represent an oriented box.
	* @param hx the half-width.
	* @param hy the half-height.
	* @param center the center of the box in local coordinates.
	* @param angle the rotation of the box in local coordinates.
	*/
	static private var s_mat:B2Mat22 = new B2Mat22();
	public function setAsOrientedBox(hx:Float, hy:Float, center:B2Vec2 = null, angle:Float = 0.0) : Void
	{
	}
	
	public static function asOrientedBox(hx:Float, hy:Float, center:B2Vec2 = null, angle:Float = 0.0):B2PolygonShape
	{
		return null;
	}
	
	/**
	 * Set this as a single edge.
	 */
	public function setAsEdge(v1:B2Vec2, v2:B2Vec2):Void
	{
	}
	
	/**
	 * Set this as a single edge.
	 */
	static public function asEdge(v1:B2Vec2, v2:B2Vec2):B2PolygonShape
	{
		return null;
	}
	
	
	/**
	* @inheritDoc
	*/
	public override function testPoint(xf:B2Transform, p:B2Vec2) : Bool{
		return true;
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
	public override function computeAABB(aabb:B2AABB, xf:B2Transform) : Void
	{
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
	* Get the vertex count.
	*/
	public function getVertexCount() : Int{
		return 0;
	}

	/**
	* Get the vertices in local coordinates.
	*/
	public function getVertices() : Array <B2Vec2>{
		return null;
	}
	
	/**
	* Get the edge normal vectors. There is one for each vertex.
	*/
	public function getNormals() : Array <B2Vec2>
	{
		return null;
	}
	
	/**
	 * Get the supporting vertex index in the given direction.
	 */
	public function getSupport(d:B2Vec2):Int
	{
		return 0;
	}
	
	public function getSupportVertex(d:B2Vec2):B2Vec2
	{
		return null;
	}

	// TODO: Expose this
	private function validate():Bool
	{
		return false;
	}
	//--------------- Internals Below -------------------
	
	/**
	 * @private
	 */
	public function new (){
		
		super ();
	}
	
	private function reserve(count:Int):Void
	{
	}

	// Local position of the polygon centroid.
	public var m_centroid:B2Vec2;

	public var m_vertices:Array <B2Vec2>;
	public var m_normals:Array <B2Vec2>;
	
	public var m_vertexCount:Int;
	
	
	
	/**
	 * Computes the centroid of the given polygon
	 * @param	vs		vector of b2Vec specifying a polygon
	 * @param	count	length of vs
	 * @return the polygon centroid
	 */
	static public function computeCentroid(vs:Array <B2Vec2>, count:Int) : B2Vec2
	{
		return null;
	}

	/**
	 * Computes a polygon's OBB
	 * @see http://www.geometrictools.com/Documentation/MinimumAreaRectangle.pdf
	 */
	static public function computeOBB(obb:B2OBB, vs:Array <B2Vec2>, count:Int) : Void
	{
	}	
}