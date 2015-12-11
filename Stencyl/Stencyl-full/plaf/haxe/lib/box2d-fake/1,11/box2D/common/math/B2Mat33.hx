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
* A 3-by-3 matrix. Stored in column-major order.
*/
class B2Mat33
{
	public function new(c1:B2Vec3=null, c2:B2Vec3=null, c3:B2Vec3=null)
	{
	}
	
	public function setVVV(c1:B2Vec3, c2:B2Vec3, c3:B2Vec3) : Void
	{
	}
	
	public function copy():B2Mat33{
		return null;
	}
	
	public function setM(m:B2Mat33) : Void
	{
	}
	
	public function addM(m:B2Mat33) : Void
	{
	}
	
	public function setIdentity() : Void
	{
	}

	public function setZero() : Void
	{
	}
	
	// Solve A * x = b
	public function solve22(out:B2Vec2, bX:Float, bY:Float):B2Vec2
	{
		return null;
	}
	
	// Solve A * x = b
	public function solve33(out:B2Vec3, bX:Float, bY:Float, bZ:Float):B2Vec3
	{
		return null;
	}

	public var col1:B2Vec3;
	public var col2:B2Vec3;
	public var col3:B2Vec3;
}