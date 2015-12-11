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
 * An edge shape.
 * @private
 * @see b2EdgeChainDef
 */
class B2EdgeShape extends B2Shape
{
	/**
	* Returns false. Edges cannot contain points. 
	*/
	public override function testPoint(transform:B2Transform, p:B2Vec2) : Bool{
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
	* Get the distance from vertex1 to vertex2.
	*/
	public function getLength(): Float
	{
		return 0;
	}

	/**
	* Get the local position of vertex1 in parent body.
	*/
	public function getVertex1(): B2Vec2
	{
		return null;
	}

	/**
	* Get the local position of vertex2 in parent body.
	*/
	public function getVertex2(): B2Vec2
	{
		return null;
	}

	/**
	* Get a core vertex in local coordinates. These vertices
	* represent a smaller edge that is used for time of impact
	* computations.
	*/
	public function getCoreVertex1(): B2Vec2
	{
		return null;
	}

	/**
	* Get a core vertex in local coordinates. These vertices
	* represent a smaller edge that is used for time of impact
	* computations.
	*/
	public function getCoreVertex2(): B2Vec2
	{
		return null;
	}
	
	/**
	* Get a perpendicular unit vector, pointing
	* from the solid side to the empty side.
	*/
	public function getNormalVector(): B2Vec2
	{
		return null;
	}
	
	
	/**
	* Get a parallel unit vector, pointing
	* from vertex1 to vertex2.
	*/
	public function getDirectionVector(): B2Vec2
	{
		return null;
	}
	
	/**
	* Returns a unit vector halfway between 
	* m_direction and m_prevEdge.m_direction.
	*/
	public function getCorner1Vector(): B2Vec2
	{
		return null;
	}
	
	/**
	* Returns a unit vector halfway between 
	* m_direction and m_nextEdge.m_direction.
	*/
	public function getCorner2Vector(): B2Vec2
	{
		return null;
	}
	
	/**
	* Returns true if the first corner of this edge
	* bends towards the solid side.
	*/
	public function corner1IsConvex(): Bool
	{
		return false;
	}
	
	/**
	* Returns true if the second corner of this edge
	* bends towards the solid side. 
	*/
	public function corner2IsConvex(): Bool
	{
		return false;
	}

	/**
	* Get the first vertex and apply the supplied transform.
	*/
	public function getFirstVertex(xf: B2Transform): B2Vec2
	{
		return null;
	}
	
	/**
	* Get the next edge in the chain.
	*/
	public function getNextEdge(): B2EdgeShape
	{
		return null;
	}
	
	/**
	* Get the previous edge in the chain.
	*/
	public function getPrevEdge(): B2EdgeShape
	{
		return null;
	}

	private var s_supportVec:B2Vec2;
	/**
	* Get the support point in the given world direction.
	* Use the supplied transform.
	*/
	public function support(xf:B2Transform, dX:Float, dY:Float) : B2Vec2{
		return null;
	}
	
	//--------------- Internals Below -------------------

	/**
	* @private
	*/
	public function new (v1: B2Vec2, v2: B2Vec2){
		super();
	}

	/**
	* @private
	*/
	public function setPrevEdge(edge: B2EdgeShape, core: B2Vec2, cornerDir: B2Vec2, convex: Bool): Void
	{
	}
	
	/**
	* @private
	*/
	public function setNextEdge(edge: B2EdgeShape, core: B2Vec2, cornerDir: B2Vec2, convex: Bool): Void
	{
	}

	public var m_v1:B2Vec2;
	public var m_v2:B2Vec2;
	
	public var m_coreV1:B2Vec2;
	public var m_coreV2:B2Vec2;
	
	public var m_length:Float;
	
	public var m_normal:B2Vec2;
	
	public var m_direction:B2Vec2;
	
	public var m_cornerDir1:B2Vec2;
	
	public var m_cornerDir2:B2Vec2;
	
	public var m_cornerConvex1:Bool;
	public var m_cornerConvex2:Bool;
	
	public var m_nextEdge:B2EdgeShape;
	public var m_prevEdge:B2EdgeShape;
	
}