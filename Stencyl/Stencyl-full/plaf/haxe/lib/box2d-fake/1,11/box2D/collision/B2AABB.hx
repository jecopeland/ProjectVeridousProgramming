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
	

import box2D.common.math.B2Math;
import box2D.common.math.B2Vec2;


/**
* An axis aligned bounding box.
*/
class B2AABB
{
	/**
	* Verify that the bounds are sorted.
	*/
	public function isValid():Bool
	{
		return true;
	}
	
	/** Get the center of the AABB. */
	public function getCenter():B2Vec2
	{
		return null;
	}
	
	/** Get the extents of the AABB (half-widths). */
	public function getExtents():B2Vec2
	{
		return null;
	}
	
	/**
	 * Is an AABB contained within this one.
	 */
	public function contains(aabb:B2AABB):Bool
	{
		return true;
	}
	
	// From Real-time Collision Detection, p179.
	/**
	 * Perform a precise raycast against the AABB.
	 */
	public function rayCast(output:B2RayCastOutput, input:B2RayCastInput):Bool
	{
		return true;
	}
	
	/**
	 * Tests if another AABB overlaps this one.
	 */
	public function testOverlap(other:B2AABB):Bool
	{
		return true;
	}
	
	/** Combine two AABBs into one. */
	public function combine(aabb1:B2AABB, aabb2:B2AABB):Void {}
	
	public function new () {}

	/** The lower vertex */
	public var lowerBound:B2Vec2;
	/** The upper vertex */
	public var upperBound:B2Vec2;
}