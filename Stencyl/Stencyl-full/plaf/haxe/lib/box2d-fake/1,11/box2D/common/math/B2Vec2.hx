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
* A 2D column vector.
*/

class B2Vec2
{
	public function new(x_:Float=0, y_:Float=0) : Void {}

	public function setZero() : Void {  }
	public function set(x_:Float=0, y_:Float=0) : Void {}
	public function setV(v:B2Vec2) : Void {}

	public function getNegative():B2Vec2 { return null; }
	public function negativeSelf():Void { }
	
	static public function make(x_:Float, y_:Float):B2Vec2
	{
		return null;
	}
	
	public function copy():B2Vec2{
		return null;
	}
	
	public function add(v:B2Vec2) : Void
	{
	}
	
	public function subtract(v:B2Vec2) : Void
	{
	}

	public function multiply(a:Float) : Void
	{
	}
	
	public function mulM(A:B2Mat22) : Void
	{
	}
	
	public function mulTM(A:B2Mat22) : Void
	{
	}
	
	public function crossVF(s:Float) : Void
	{
	}
	
	public function crossFV(s:Float) : Void
	{
	}
	
	public function minV(b:B2Vec2) : Void
	{
	}
	
	public function maxV(b:B2Vec2) : Void
	{
	}
	
	public function abs() : Void
	{
	}

	public function length():Float
	{
		return 0;
	}
	
	public function lengthSquared():Float
	{
		return 0;
	}

	public function normalize():Float
	{
		return 0;
	}

	public function isValid():Bool
	{
		return false;
	}
	
	public function winding(b:B2Vec2, c:B2Vec2):Float {return 0;}

	public var x:Float;
	public var y:Float;
}