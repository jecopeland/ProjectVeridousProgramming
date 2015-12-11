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

package box2D.dynamics;


import box2D.common.B2Settings;
import box2D.common.math.B2Math;
import box2D.common.math.B2Vec2;
import box2D.dynamics.contacts.B2Contact;
import box2D.dynamics.contacts.B2ContactConstraint;
import box2D.dynamics.contacts.B2ContactSolver;
import box2D.dynamics.joints.B2Joint;

class B2Island
{
	
	public function new ()
	{
	}
	
	public function initialize(
	bodyCapacity:Int,
	contactCapacity:Int,
	jointCapacity:Int,
	allocator:Dynamic,
	listener:B2ContactListener,
	contactSolver:B2ContactSolver):Void
	{
		
	}

	public function clear() : Void
	{
	}

	public function solve(step:B2TimeStep, gravity:B2Vec2, allowSleep:Bool) : Void
	{
	}
	
	
	public function solveTOI(subStep:B2TimeStep) : Void
	{
	}

	private static var s_impulse:B2ContactImpulse = new B2ContactImpulse();
	public function report(constraints:Array <B2ContactConstraint>) : Void
	{
	}
	
	public function addBody(body:B2Body) : Void
	{
	}

	public function addContact(contact:B2Contact) : Void
	{
	}

	public function addJoint(joint:B2Joint) : Void
	{
	}

	private var m_allocator:Dynamic;
	private var m_listener:B2ContactListener;
	private var m_contactSolver:B2ContactSolver;

	public var m_bodies:Array <B2Body>;
	public var m_contacts:Array <B2Contact>;
	public var m_joints:Array <B2Joint>;

	public var m_bodyCount:Int;
	public var m_jointCount:Int;
	public var m_contactCount:Int;

	private var m_bodyCapacity:Int;
	public var m_contactCapacity:Int;
	public var m_jointCapacity:Int;
	
}