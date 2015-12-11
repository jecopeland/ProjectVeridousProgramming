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

package box2D.collision;
	

// 
/**
* We use contact ids to facilitate warm starting.
*/
class B2ContactID
{
	public function new () {
	}
	public function set(id:B2ContactID) : Void{
	}
	public function copy():B2ContactID{
		return null;
	}
	
	public var key (getKey, setKey):Int;
	
	private function getKey():Int {
		return _key;
	}
	private function setKey(value:Int) : Int {
		return 0;
	}
	public var features:Features;
	/** Used to quickly compare contact ids. */
	public var _key:Int;
}