package com.nmefermmmtools.geometry;

import nme.geom.Rectangle;
import com.nmefermmmtools.math.MathTools;
  
class AreaDivider 
{

	public static function bySize(areaWidth:Float, areaHeight:Float, segmentsWidth:Float, segmentsHeight:Float):Array<Rectangle>
	{
		var segments:Array<Rectangle> = new Array<Rectangle>();
		
		var finalSegmentsWidth:Float	= MathTools.findDivisor(areaWidth, segmentsWidth);
		var finalSegmentsHeight:Float	= MathTools.findDivisor(areaHeight, segmentsHeight);
			
		for (i in 0...Math.ceil(areaHeight / finalSegmentsHeight)) 
		{
			for (j in 0...Math.ceil(areaWidth / finalSegmentsWidth)) 
			{
				segments.push(new Rectangle(finalSegmentsWidth * j, finalSegmentsHeight * i, finalSegmentsWidth, finalSegmentsHeight));
			}
		}
		
		return segments;
	}
}