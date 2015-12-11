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
import box2D.common.math.B2Sweep;
import box2D.common.math.B2Transform;


/**
* @private
*/
class B2TimeOfImpact
{
	
	private static var b2_toiCalls:Int = 0;
	private static var b2_toiIters:Int = 0;
	private static var b2_toiMaxIters:Int = 0;
	private static var b2_toiRootIters:Int = 0;
	private static var b2_toiMaxRootIters:Int = 0;

	private static var s_cache:B2SimplexCache = new B2SimplexCache();
	private static var s_distanceInput:B2DistanceInput = new B2DistanceInput();
	private static var s_xfA:B2Transform = new B2Transform();
	private static var s_xfB:B2Transform = new B2Transform();
	private static var s_fcn:B2SeparationFunction = new B2SeparationFunction();
	private static var s_distanceOutput:B2DistanceOutput = new B2DistanceOutput();
	public static function timeOfImpact(input:B2TOIInput):Float
	{
		return 0;
	}

}