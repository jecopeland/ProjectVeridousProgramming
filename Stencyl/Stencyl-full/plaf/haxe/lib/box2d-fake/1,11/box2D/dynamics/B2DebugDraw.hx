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


import box2D.common.math.B2Transform;
import box2D.common.math.B2Vec2;
import box2D.common.B2Color;
import flash.display.Sprite;


/**
* Implement and register this class with a b2World to provide debug drawing of physics
* entities in your game.
*/
class B2DebugDraw
{

	public function new () {
	}

	//virtual ~b2DebugDraw() {}

	//enum
	//{
	/** Draw shapes */
	static public var e_shapeBit:Int 			= 0x0001;
	/** Draw joint connections */
	static public var e_jointBit:Int			= 0x0002;
	/** Draw axis aligned bounding boxes */
	static public var e_aabbBit:Int			= 0x0004;
	/** Draw broad-phase pairs */
	static public var e_pairBit:Int			= 0x0008;
	/** Draw center of mass frame */
	static public var e_centerOfMassBit:Int	= 0x0010;
	/** Draw controllers */
	static public var e_controllerBit:Int		= 0x0020;
	//};

	/**
	* Set the drawing flags.
	*/
	public function setFlags(flags:Int) : Void{
	}

	/**
	* Get the drawing flags.
	*/
	public function getFlags() : Int{
		return 0;
	}
	
	/**
	* Append flags to the current flags.
	*/
	public function appendFlags(flags:Int) : Void{
	}

	/**
	* Clear flags from the current flags.
	*/
	public function clearFlags(flags:Int) : Void {

	}

	/**
	* Set the sprite
	*/
	public function setSprite(sprite:Sprite) : Void {

	}
	
	/**
	* Get the sprite
	*/
	public function getSprite() : Sprite {
		return null;
	}
	
	/**
	* Set the draw scale
	*/
	public function setDrawScale(drawScale:Float) : Void {
	}
	
	/**
	* Get the draw
	*/
	public function getDrawScale() : Float {
		return 0;
	}
	
	/**
	* Set the line thickness
	*/
	public function setLineThickness(lineThickness:Float) : Void {
	}
	
	/**
	* Get the line thickness
	*/
	public function getLineThickness() : Float {
		return 0;
	}
	
	/**
	* Set the alpha value used for lines
	*/
	public function setAlpha(alpha:Float) : Void {
	}
	
	/**
	* Get the alpha value used for lines
	*/
	public function getAlpha() : Float {
		return 0;
	}
	
	/**
	* Set the alpha value used for fills
	*/
	public function setFillAlpha(alpha:Float) : Void {
	}
	
	/**
	* Get the alpha value used for fills
	*/
	public function getFillAlpha() : Float {
		return 0;
	}
	
	/**
	* Set the scale used for drawing XForms
	*/
	public function setXFormScale(xformScale:Float) : Void {
	}
	
	/**
	* Get the scale used for drawing XForms
	*/
	public function getXFormScale() : Float {
		return 0;
	}
	
	/**
	* Draw a closed polygon provided in CCW order.
	*/
	public function drawPolygon(vertices:Array <B2Vec2>, vertexCount:Int, color:B2Color) : Void{
	}

	/**
	* Draw a solid closed polygon provided in CCW order.
	*/
	public function drawSolidPolygon(vertices:Array <B2Vec2>, vertexCount:Int, color:B2Color) : Void{
	}

	/**
	* Draw a circle.
	*/
	public function drawCircle(center:B2Vec2, radius:Float, color:B2Color) : Void{
	}
	
	/**
	* Draw a solid circle.
	*/
	public function drawSolidCircle(center:B2Vec2, radius:Float, axis:B2Vec2, color:B2Color) : Void{
	}

	
	/**
	* Draw a line segment.
	*/
	public function drawSegment(p1:B2Vec2, p2:B2Vec2, color:B2Color) : Void{	
	}

	/**
	* Draw a transform. Choose your own length scale.
	* @param xf a transform.
	*/
	public function drawTransform(xf:B2Transform) : Void{
	}
	
	
	
	private var m_drawFlags:Int;
	public var m_sprite:Sprite;
	private var m_drawScale:Float;
	
	private var m_lineThickness:Float;
	private var m_alpha:Float;
	private var m_fillAlpha:Float;
	private var m_xformScale:Float;
	
}