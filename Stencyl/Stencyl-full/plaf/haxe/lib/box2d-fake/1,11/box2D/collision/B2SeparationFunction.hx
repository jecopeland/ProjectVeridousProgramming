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
import box2D.common.math.B2Mat22;
import box2D.common.math.B2Math;
import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;


class B2SeparationFunction
{
	//enum Type
	public static var e_points:Int = 0x01;
	public static var e_faceA:Int = 0x02;
	public static var e_faceB:Int = 0x04;
	
	public function initialize(cache:B2SimplexCache,
								proxyA:B2DistanceProxy, transformA:B2Transform,
								proxyB:B2DistanceProxy, transformB:B2Transform):Void
	{
		
	}
	
	public function evaluate(transformA:B2Transform, transformB:B2Transform):Float
	{
		return 0;
	}
	
	
	public function new () {
		
	}
	
	public var m_proxyA:B2DistanceProxy;
	public var m_proxyB:B2DistanceProxy;
	public var m_type:Int;
	public var m_localPoint:B2Vec2;
	public var m_axis:B2Vec2;
}