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

package box2D.common.math;

import box2D.common.B2Settings;
import box2D.collision.B2AABB;

/**
* @private
*/
class B2Math {
	
	
	/**
	* This function is used to ensure that a floating point number is
	* not a NaN or infinity.
	*/
	static public function isValid(x:Float) : Bool
	{
		return true;
	}
	

	static public function dot(a:B2Vec2, b:B2Vec2):Float
	{
		return 0;
	}

	static public function crossVV(a:B2Vec2, b:B2Vec2):Float
	{
		return 0;
	}

	static public function crossVF(a:B2Vec2, s:Float):B2Vec2
	{
		return null;
	}

	static public function crossFV(s:Float, a:B2Vec2):B2Vec2
	{
		return null;
	}

	static public function mulMV(A:B2Mat22, v:B2Vec2):B2Vec2
	{
		return null;
	}

	static public function mulTMV(A:B2Mat22, v:B2Vec2):B2Vec2
	{
		return null;
	}
	
	static public function mulX(T:B2Transform, v:B2Vec2) : B2Vec2
	{
		return null;
	}

	static public function mulXT(T:B2Transform, v:B2Vec2):B2Vec2
	{
		return null;
	}

	static public function addVV(a:B2Vec2, b:B2Vec2):B2Vec2
	{
		return null;
	}

	static public function subtractVV(a:B2Vec2, b:B2Vec2):B2Vec2
	{
		return null;
	}
	
	static public function distance(a:B2Vec2, b:B2Vec2) : Float{
		return 0;
	}
	
	static public function distanceSquared(a:B2Vec2, b:B2Vec2) : Float{
		return 0;
	}

	static public function mulFV(s:Float, a:B2Vec2):B2Vec2
	{
		return null;
	}

	static public function addMM(A:B2Mat22, B:B2Mat22):B2Mat22
	{
	return null;
	}

	// A * B
	static public function mulMM(A:B2Mat22, B:B2Mat22):B2Mat22
	{
		return null;
	}

	// A^T * B
	static public function mulTMM(A:B2Mat22, B:B2Mat22):B2Mat22
	{
		return null;
	}

	static public function abs(a:Float):Float
	{
		return 0;
	}

	static public function absV(a:B2Vec2):B2Vec2
	{
		return null;
	}

	static public function absM(A:B2Mat22):B2Mat22
	{
		return null;
	}

	static public function min(a:Float, b:Float):Float
	{
		return 0;
	}

	static public function minV(a:B2Vec2, b:B2Vec2):B2Vec2
	{
		return null;
	}

	static public function max(a:Float, b:Float):Float
	{
		return 0;
	}

	static public function maxV(a:B2Vec2, b:B2Vec2):B2Vec2
	{
		return null;
	}

	static public function clamp(a:Float, low:Float, high:Float):Float
	{
		return 0;
	}

	static public function clampV(a:B2Vec2, low:B2Vec2, high:B2Vec2):B2Vec2
	{
		return null;
	}

	static public function swap(a:Array <Dynamic>, b:Array <Dynamic>) : Void
	{
	}

	// b2Random number in range [-1,1]
	static public function random():Float
	{
		return 0;
	}

	static public function randomRange(lo:Float, hi:Float) : Float
	{
		return 0;
	}

	// "Next Largest Power of 2
	// Given a binary integer value x, the next largest power of 2 can be computed by a SWAR algorithm
	// that recursively "folds" the upper bits into the lower bits. This process yields a bit vector with
	// the same most significant 1 as x, but all 1's below it. Adding 1 to that value yields the next
	// largest power of 2. For a 32-bit value:"
	static public function nextPowerOfTwo(x:Int):Int
	{
		return 0;
	}

	static public function isPowerOfTwo(x:Int):Bool
	{
		return false;
	}
	
	static public var b2Vec2_zero:B2Vec2 = new B2Vec2(0.0, 0.0);
	static public var b2Mat22_identity:B2Mat22 = B2Mat22.fromVV(new B2Vec2(1.0, 0.0), new B2Vec2(0.0, 1.0));
	static public var b2Transform_identity:B2Transform = new B2Transform(b2Vec2_zero, b2Mat22_identity);
	
	
	#if flash
	
	public static inline var MIN_VALUE:Float = untyped __global__ ["Number"].MIN_VALUE;
	public static inline var MAX_VALUE:Float = untyped __global__ ["Number"].MAX_VALUE;
	
	#elseif js
	
	public static inline var MIN_VALUE:Float = untyped __js__ ("Number.MIN_VALUE");
	public static inline var MAX_VALUE:Float = untyped __js__ ("Number.MAX_VALUE");
	
	#else
	
    public static inline var MIN_VALUE:Float = 2.2250738585072014e-308;
    public static inline var MAX_VALUE:Float = 1.7976931348623158e+308;
	
	#end
	

}