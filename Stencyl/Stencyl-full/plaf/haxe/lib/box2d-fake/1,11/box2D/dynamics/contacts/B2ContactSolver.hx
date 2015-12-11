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

package box2D.dynamics.contacts;


import box2D.collision.B2Manifold;
import box2D.collision.B2ManifoldPoint;
import box2D.collision.B2WorldManifold;
import box2D.collision.shapes.B2Shape;
import box2D.common.B2Settings;
import box2D.common.math.B2Mat22;
import box2D.common.math.B2Math;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.B2TimeStep;


/**
* @private
*/
class B2ContactSolver
{
	private static var staticFix = B2Settings.b2_maxManifoldPoints;
	
	public function new()
	{
	}
	
	private static var s_worldManifold:B2WorldManifold = new B2WorldManifold();
	public function initialize(step:B2TimeStep, contacts:Array <B2Contact>, contactCount:Int, allocator:Dynamic):Void
	{
	}

	public function initVelocityConstraints(step: B2TimeStep) : Void{
	}
	
	public function solveVelocityConstraints() : Void{
	}
	
	public function finalizeVelocityConstraints() : Void
	{
	}

	// Sequential solver.
	private static var s_psm:B2PositionSolverManifold = new B2PositionSolverManifold();
	public function solvePositionConstraints(baumgarte:Float):Bool
	{
		return false;
	}
	
	private var m_step:B2TimeStep;
	private var m_allocator:Dynamic;
	public var m_constraints:Array <B2ContactConstraint>;
	private var m_constraintCount:Int;
}
