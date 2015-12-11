/*
* Copyright (c) 2009 Erin Catto http://www.gphysics.com
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


import box2D.common.B2Settings;
import box2D.common.math.B2Math;
import box2D.common.math.B2Vec2;

// A dynamic AABB tree broad-phase, inspired by Nathanael Presson's btDbvt.

/**
 * A dynamic tree arranges data in a binary tree to accelerate
 * queries such as volume queries and ray casts. Leafs are proxies
 * with an AABB. In the tree we expand the proxy AABB by b2_fatAABBFactor
 * so that the proxy AABB is bigger than the client object. This allows the client
 * object to move by small amounts without triggering a tree update.
 * 
 * Nodes are pooled.
 */
class B2DynamicTree 
{
	/**
	 * Constructing the tree initializes the node pool.
	 */
	public function new () 
	{
	}
	
	/**
	 * Create a proxy. Provide a tight fitting AABB and a userData.
	 */
	public function createProxy(aabb:B2AABB, userData:Dynamic):B2DynamicTreeNode
	{
		return null;
	}
	
	/**
	 * Destroy a proxy. This asserts if the id is invalid.
	 */
	public function destroyProxy(proxy:B2DynamicTreeNode):Void
	{
	}
	
	/**
	 * Move a proxy with a swept AABB. If the proxy has moved outside of its fattened AABB,
	 * then the proxy is removed from the tree and re-inserted. Otherwise
	 * the function returns immediately.
	 */
	public function moveProxy(proxy:B2DynamicTreeNode, aabb:B2AABB, displacement:B2Vec2):Bool
	{
		return true;
	}
	
	/**
	 * Perform some iterations to re-balance the tree.
	 */
	public function rebalance(iterations:Int):Void
	{
	}
	
	public function getFatAABB(proxy:B2DynamicTreeNode):B2AABB
	{
		return null;
	}

	/**
	 * Get user data from a proxy. Returns null if the proxy is invalid.
	 */
	public function getUserData(proxy:B2DynamicTreeNode):Dynamic
	{
		return null;
	}
	
	/**
	 * Query an AABB for overlapping proxies. The callback
	 * is called for each proxy that overlaps the supplied AABB.
	 * The callback should match function signature
	 * <code>fuction callback(proxy:B2DynamicTreeNode):Bool</code>
	 * and should return false to trigger premature termination.
	 */
	public function query(callbackMethod:B2DynamicTreeNode -> Bool, aabb:B2AABB):Void
	{
	}

	/**
	 * Ray-cast against the proxies in the tree. This relies on the callback
	 * to perform a exact ray-cast in the case were the proxy contains a shape.
	 * The callback also performs the any collision filtering. This has performance
	 * roughly equal to k * log(n), where k is the number of collisions and n is the
	 * number of proxies in the tree.
	 * @param input the ray-cast input data. The ray extends from p1 to p1 + maxFraction * (p2 - p1).
	 * @param callback a callback class that is called for each proxy that is hit by the ray.
	 * It should be of signature:
	 * <code>function callback(input:B2RayCastInput, proxy:*):Void</code>
	 */
	public function rayCast(callbackMethod:B2RayCastInput -> Dynamic -> Dynamic, input:B2RayCastInput):Void
	{
	}
	
	
	private function allocateNode():B2DynamicTreeNode
	{
		return null;
	}
	
	private function freeNode(node:B2DynamicTreeNode):Void
	{
	}
	
	private function insertLeaf(leaf:B2DynamicTreeNode):Void
	{
	}
	
	private function removeLeaf(leaf:B2DynamicTreeNode):Void
	{
	}
	
	private var m_root:B2DynamicTreeNode;
	private var m_freeList:B2DynamicTreeNode;
	
	/** This is used for incrementally traverse the tree for rebalancing */
	private var m_path:Int;
	
	private var m_insertionCount:Int;
}