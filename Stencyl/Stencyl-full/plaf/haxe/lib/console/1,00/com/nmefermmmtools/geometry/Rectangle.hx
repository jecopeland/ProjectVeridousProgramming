package com.nmefermmmtools.geometry;

/**
 * ...
 * @author Fernando Medina
 */

class Rectangle 
{
	public var x:Float;
	public var y:Float;
	public var width:Float;
	public var height:Float;
	  
	public function new(x:Float = 0, y:Float = 0, width:Float = 0, height:Float = 0)
	{
	  this.x = x;
	  this.y = y;
	  this.width = width;
	  this.height = height;
	}

	public function intersects(b:Rectangle):Bool 
	{
	  return !(this.x > b.x + (b.width - 1) || this.x + (this.width - 1) < b.x || this.y > b.y + (b.height - 1) || this.y + (this.height - 1) < b.y);
	}
	
	public function equals(b:Rectangle):Bool
	{
		if (b.x == x)
		{
			if (b.y == y)
			{
				if (b.width == width)
				{
					if (b.height == height)
					{
						return true;
					}
				}
			}
		}
		return false;
	}
}