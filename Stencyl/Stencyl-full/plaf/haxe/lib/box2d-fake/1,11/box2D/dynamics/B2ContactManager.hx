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


import box2D.collision.B2ContactPoint;
import box2D.collision.B2DynamicTreeBroadPhase;
import box2D.collision.IBroadPhase;
import box2D.dynamics.contacts.B2Contact;
import box2D.dynamics.contacts.B2ContactEdge;
import box2D.dynamics.contacts.B2ContactFactory;


// Delegate of b2World.
/**
* @private
*/
class B2ContactManager 
{
	public function new () {
	}

	// This is a callback from the broadphase when two AABB proxies begin
	// to overlap. We create a b2Contact to manage the narrow phase.
	public function addPair(proxyUserDataA:Dynamic, proxyUserDataB:Dynamic):Void {
	}

	public function findNewContacts():Void
	{
	}
	
	static private var s_evalCP:B2ContactPoint = new B2ContactPoint ();
	public function destroy(c:B2Contact) : Void
	{
	}
	

	// This is the top level collision call for the time step. Here
	// all the narrow phase collision is processed for the world
	// contact list.
	public function collide() : Void
	{
	}

	
	public var m_world:B2World;
	public var m_broadPhase:IBroadPhase;
	
	public var m_contactList:B2Contact;
	public var m_contactCount:Int;
	public var m_contactFilter:B2ContactFilter;
	public var m_contactListener:B2ContactListener;
	public var m_contactFactory:B2ContactFactory;
	public var m_allocator:Dynamic;
}