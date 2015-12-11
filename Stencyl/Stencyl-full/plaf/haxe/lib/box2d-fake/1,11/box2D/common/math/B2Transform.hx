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
* A transform contains translation and rotation. It is used to represent
* the position and orientation of rigid frames.
*/
class B2Transform
{
	/**
	* The default constructor does nothing (for performance).
	*/
	public function new (pos:B2Vec2=null, r:B2Mat22=null) : Void 
	{
	}

	/**
	* Initialize using a position vector and a rotation matrix.
	*/
	public function initialize(pos:B2Vec2, r:B2Mat22) : Void 
	{
	}

	/**
	* Set this to the identity transform.
	*/
	public function setIdentity() : Void
	{
	}

	public function set(x:B2Transform) : Void{
	}
	
	/** 
	 * Calculate the angle that the rotation matrix represents.
	 */
	public function getAngle():Float
	{
		return 0;
	}
	 

	public var position:B2Vec2;
	public var R:B2Mat22;
}