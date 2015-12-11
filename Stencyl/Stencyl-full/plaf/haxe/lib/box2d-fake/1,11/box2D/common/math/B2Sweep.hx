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
* This describes the motion of a body/shape for TOI computation.
* Shapes are defined with respect to the body origin, which may
* no coincide with the center of mass. However, to support dynamics
* we must interpolate the center of mass position.
*/
class B2Sweep
{
	
	public function new () {

	}
	
	public function set(other:B2Sweep):Void
	{
	}
	
	public function copy():B2Sweep
	{
		return null;
	}
	
	/**
	* Get the interpolated transform at a specific time.
	* @param alpha is a factor in [0,1], where 0 indicates t0.
	*/
	public function getTransform(xf:B2Transform, alpha:Float):Void
	{
	}
	
	/**
	* Advance the sweep forward, yielding a new initial state.
	* @param t the new initial time.
	*/
	public function advance(t:Float) : Void{
	}

	/** Local center of mass position */
	public var localCenter:B2Vec2;
	/** Center world position */
	public var c0:B2Vec2;
	/** Center world position */
	public var c:B2Vec2;
	/** World angle */
	public var a0:Float;
	/** World angle */
	public var a:Float;
	/** Time interval = [t0,1], where t0 is in [0,1] */
	public var t0:Float;
}