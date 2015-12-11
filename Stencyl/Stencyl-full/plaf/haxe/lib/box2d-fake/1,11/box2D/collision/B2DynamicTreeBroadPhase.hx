package box2D.collision;


import box2D.common.math.B2Vec2;

	
/**
 * The broad-phase is used for computing pairs and performing volume queries and ray casts.
 * This broad-phase does not persist pairs. Instead, this reports potentially new pairs.
 * It is up to the client to consume the new pairs and to track subsequent overlap.
 */
class B2DynamicTreeBroadPhase implements IBroadPhase
{
	/**
	 * Create a proxy with an initial AABB. Pairs are not reported until
	 * UpdatePairs is called.
	 */
	public function createProxy(aabb:B2AABB, userData:Dynamic):Dynamic
	{
		return null;
	}
	
	/**
	 * Destroy a proxy. It is up to the client to remove any pairs.
	 */
	public function destroyProxy(proxy:Dynamic):Void
	{
	}
	
	/**
	 * Call MoveProxy as many times as you like, then when you are done
	 * call UpdatePairs to finalized the proxy pairs (for your time step).
	 */
	public function moveProxy(proxy:Dynamic, aabb:B2AABB, displacement:B2Vec2):Void
	{
	}
	
	public function testOverlap(proxyA:Dynamic, proxyB:Dynamic):Bool
	{
		return false;
	}
	
	/**
	 * Get user data from a proxy. Returns null if the proxy is invalid.
	 */
	public function getUserData(proxy:Dynamic):Dynamic
	{
		return null;
	}
	
	/**
	 * Get the AABB for a proxy.
	 */
	public function getFatAABB(proxy:Dynamic):B2AABB
	{
		return null;
	}
	
	/**
	 * Get the number of proxies.
	 */
	public function getProxyCount():Int
	{
		return 0;
	}
	
	/**
	 * Update the pairs. This results in pair callbacks. This can only add pairs.
	 */
	public function updatePairs(callbackMethod:Dynamic):Void
	{
	}
	
	/**
	 * @inheritDoc
	 */
	public function query(callbackMethod:Dynamic -> Bool, aabb:B2AABB):Void
	{
	}
	
	/**
	 * @inheritDoc
	 */
	public function rayCast(callbackMethod:B2RayCastInput -> Dynamic -> Float, input:B2RayCastInput):Void
	{
	}
	
	
	public function validate():Void
	{
	}
	
	public function rebalance(iterations:Int):Void
	{
	}
	
	
	// Private ///////////////
	
	private function bufferMove(proxy:B2DynamicTreeNode):Void
	{
	}
	
	private function unBufferMove(proxy:B2DynamicTreeNode):Void
	{
	}
	
	private function comparePairs(pair1:B2DynamicTreePair, pair2:B2DynamicTreePair):Int
	{
		return 0;
	}
	
	public function new () {
		
	}
	
	private var m_tree:B2DynamicTree;
	private var m_proxyCount:Int;
	private var m_moveBuffer:Array <B2DynamicTreeNode>;
	
	private var m_pairBuffer:Array <B2DynamicTreePair>;
	private var m_pairCount:Int;
}