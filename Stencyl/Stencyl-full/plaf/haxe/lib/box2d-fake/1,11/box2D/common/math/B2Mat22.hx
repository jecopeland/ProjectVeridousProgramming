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
	
	
/**
* A 2-by-2 matrix. Stored in column-major order.
*/
class B2Mat22
{
	public function new ()
	{
	}
	
	public static function fromAngle(angle:Float):B2Mat22
	{
		return null;
	}
	
	public static function fromVV(c1:B2Vec2, c2:B2Vec2):B2Mat22
	{
		return null;
	}

	public function set(angle:Float) : Void
	{
	}
	
	public function setVV(c1:B2Vec2, c2:B2Vec2) : Void
	{
	}
	
	public function copy():B2Mat22{
		return null;
	}
	
	public function setM(m:B2Mat22) : Void
	{
	}
	
	public function addM(m:B2Mat22) : Void
	{
	}
	
	public function setIdentity() : Void
	{
	}

	public function setZero() : Void
	{
	}
	
	public function getAngle() :Float
	{
		return 0;
	}

	/**
	 * Compute the inverse of this matrix, such that inv(A) * A = identity.
	 */
	public function getInverse(out:B2Mat22):B2Mat22
	{
		return null;
	}
	
	// Solve A * x = b
	public function solve(out:B2Vec2, bX:Float, bY:Float):B2Vec2
	{
		return null;
	}
	
	public function abs() : Void
	{
	}

	public var col1:B2Vec2;
	public var col2:B2Vec2;
}