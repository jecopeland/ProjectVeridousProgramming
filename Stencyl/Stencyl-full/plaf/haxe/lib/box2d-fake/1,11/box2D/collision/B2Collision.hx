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
import box2D.common.B2Settings;
import box2D.common.math.B2Mat22;
import box2D.common.math.B2Math;
import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;


/**
* @private
*/
class B2Collision{
	
	// Null feature
	static public var b2_nullFeature:Int = 0x000000ff;//UCHAR_MAX;
	
	// Sutherland-Hodgman clipping.
	static public function clipSegmentToLine(vOut:Array <ClipVertex>, vIn:Array <ClipVertex>, normal:B2Vec2, offset:Float):Int
	{
		return 0;
	}
	
	
	// Find the separation between poly1 and poly2 for a give edge normal on poly1.
	static public function edgeSeparation(	poly1:B2PolygonShape, xf1:B2Transform, edge1:Int, 
											poly2:B2PolygonShape, xf2:B2Transform):Float
	{
		return 0;
	}
	
	
	
	
	// Find the max separation between poly1 and poly2 using edge normals
	// from poly1.
	static public function findMaxSeparation(edgeIndex:Array <Int>, 
											poly1:B2PolygonShape, xf1:B2Transform, 
											poly2:B2PolygonShape, xf2:B2Transform):Float
	{
		return 0;
	}
	
	
	
	static public function findIncidentEdge(c:Array <ClipVertex>, 
											poly1:B2PolygonShape, xf1:B2Transform, edge1:Int, 
											poly2:B2PolygonShape, xf2:B2Transform) : Void
	{
	}
	
	
	private static function makeClipPointVector():Array <ClipVertex>
	{
		return null;
	}
	private static var s_incidentEdge:Array <ClipVertex> = makeClipPointVector();
	private static var s_clipPoints1:Array <ClipVertex> = makeClipPointVector();
	private static var s_clipPoints2:Array <ClipVertex> = makeClipPointVector();
	private static var s_edgeAO:Array <Int> = new Array <Int>();
	private static var s_edgeBO:Array <Int> = new Array <Int>();
	private static var s_localTangent:B2Vec2 = new B2Vec2();
	private static var s_localNormal:B2Vec2 = new B2Vec2();
	private static var s_planePoint:B2Vec2 = new B2Vec2();
	private static var s_normal:B2Vec2 = new B2Vec2();
	private static var s_tangent:B2Vec2 = new B2Vec2();
	private static var s_tangent2:B2Vec2 = new B2Vec2();
	private static var s_v11:B2Vec2 = new B2Vec2();
	private static var s_v12:B2Vec2 = new B2Vec2();
	// Find edge normal of max separation on A - return if separating axis is found
	// Find edge normal of max separation on B - return if separation axis is found
	// Choose reference edge as min(minA, minB)
	// Find incident edge
	// Clip
	static private var b2CollidePolyTempVec:B2Vec2 = new B2Vec2();
	// The normal points from 1 to 2
	static public function collidePolygons(manifold:B2Manifold, 
											polyA:B2PolygonShape, xfA:B2Transform,
											polyB:B2PolygonShape, xfB:B2Transform) : Void
	{
	}
	
	
	
	static public function collideCircles(
		manifold:B2Manifold, 
		circle1:B2CircleShape, xf1:B2Transform, 
		circle2:B2CircleShape, xf2:B2Transform) : Void
	{
	}
	
	
	
	static public function collidePolygonAndCircle(
		manifold:B2Manifold, 
		polygon:B2PolygonShape, xf1:B2Transform,
		circle:B2CircleShape, xf2:B2Transform) : Void
	{
	}




	static public function testOverlap(a:B2AABB, b:B2AABB):Bool
	{
		return true;
	}
	
	
	

}