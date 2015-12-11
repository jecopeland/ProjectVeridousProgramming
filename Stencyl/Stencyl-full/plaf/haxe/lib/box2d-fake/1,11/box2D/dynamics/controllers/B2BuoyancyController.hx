/*
* Copyright (c) 2006-2007 Adam Newgas
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

package box2D.dynamics.controllers;


import box2D.common.B2Color;
import box2D.common.math.B2Math;
import box2D.common.math.B2Vec2;
import box2D.dynamics.B2Body;
import box2D.dynamics.B2DebugDraw;
import box2D.dynamics.B2Fixture;
import box2D.dynamics.B2TimeStep;


/**
 * Calculates buoyancy forces for fluids in the form of a half plane
 */
class B2BuoyancyController extends B2Controller
{
	/**
	 * The outer surface normal
	 */
	public var normal:B2Vec2;
	/**
	 * The height of the fluid surface along the normal
	 */
	public var offset:Float;
	/**
	 * The fluid density
	 */
	public var density:Float;
	/**
	 * Fluid velocity, for drag calculations
	 */
	public var velocity:B2Vec2;
	/**
	 * Linear drag co-efficient
	 */
	public var linearDrag:Float;
	/**
	 * Linear drag co-efficient
	 */
	public var angularDrag:Float;
	/**
	 * If false, bodies are assumed to be uniformly dense, otherwise use the shapes densities
	 */
	public var useDensity:Bool; //False by default to prevent a gotcha
	/**
	 * If true, gravity is taken from the world instead of the gravity parameter.
	 */
	public var useWorldGravity:Bool;
	/**
	 * Gravity vector, if the world's gravity is not used
	 */
	public var gravity:B2Vec2;
	
	
	public function new () {
		
	}
	
		
	public override function step(step:B2TimeStep):Void{
	}
	
	public override function draw(debugDraw:B2DebugDraw):Void
	{
	}
}