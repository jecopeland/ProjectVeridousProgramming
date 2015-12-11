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


import box2D.common.B2Settings;
import box2D.common.math.B2Math;
import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;


class B2Simplex
{
	
public function new ()
{
}

public function readCache(cache:B2SimplexCache, 
			proxyA:B2DistanceProxy, transformA:B2Transform,
			proxyB:B2DistanceProxy, transformB:B2Transform):Void
{
}

public function writeCache(cache:B2SimplexCache):Void
{
}

public function getSearchDirection():B2Vec2
{
	return null;
}

public function getClosestPoint():B2Vec2
{
	return null;
}

public function getWitnessPoints(pA:B2Vec2, pB:B2Vec2):Void
{
}

public function getMetric():Float
{
	return 0;
}

public function solve2():Void
{
}

public function solve3():Void
{
}

public var m_v1:B2SimplexVertex;
public var m_v2:B2SimplexVertex;
public var m_v3:B2SimplexVertex;
public var m_vertices:Array <B2SimplexVertex>;
public var m_count:Int;
}