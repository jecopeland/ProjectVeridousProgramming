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



/**
* @private
*/
class B2Distance
{

// GJK using Voronoi regions (Christer Ericson) and Barycentric coordinates.

private static var b2_gjkCalls:Int;
private static var b2_gjkIters:Int;
private static var b2_gjkMaxIters:Int;

private static var s_simplex:B2Simplex = new B2Simplex();
private static var s_saveA:Array <Int> = new Array <Int> ();
private static var s_saveB:Array <Int> = new Array <Int> ();

public static function distance(output:B2DistanceOutput, cache:B2SimplexCache, input:B2DistanceInput):Void
{
	
}

}