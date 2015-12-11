package com.nmefermmmtools.geometry;

class AspectratioResize 
{

	/**
	 * Changes width and height of an Object with aspect ratio 
	 * and returns the object just in case you need a reference to it.
	 * 
	 * @param	image Can be a MovieClip, Sprite or any object containing width and height properties.
	 * @param	newWidth The new with of the object
	 * @return
	 */
	public static function width(image:Dynamic, newWidth:Float):Dynamic
	{
		image.height = newWidth * (image.height / image.width);
		image.width = newWidth;
		return image;
	}
	
	/**
	 * Changes width and height of an Object with aspect ratio 
	 * and returns the object just in case you need a reference to it.
	 * 
	 * @param	image Can be a MovieClip, Sprite or any object containing width and height properties.
	 * @param	newHeightThe new height of the object
	 * @return
	 */
	public static function height(image:Dynamic, newHeight:Float):Dynamic
	{
		image.width = newHeight * (image.width / image.height);
		image.height = newHeight;
		return image;
	}
	
	/**
	 * image will be resized to fill all the area, 
	 * will be bigger than area if necessary.
	 * 
	 * @param	image Can be a MovieClip, Sprite or any object containing width and height properties.
	 * @param	areaWidth
	 * @param	areaHeight
	 */
	public static function toFillArea(image:Dynamic, areaWidth:Float, areaHeight:Float):Void
	{
		if (width({ width:image.width, height:image.height }, areaWidth).height >= areaHeight)
			width(image, areaWidth);
		else
			height(image, areaHeight);
	}
	
	/**
	 * image will be resized to fill the width or height 
	 * of an area dimentions. Image will never be 
	 * more big than the area dimentions.
	 * 
	 * @param	image Can be a MovieClip, Sprite or any object containing width and height properties.
	 * @param	areaWidth
	 * @param	areaHeight
	 */
	public static function toFitArea(image:Dynamic, areaWidth:Float, areaHeight:Float):Void
	{	
		if (width({ width:image.width, height:image.height }, areaWidth).height > areaHeight)
			height(image, areaHeight);
		else
			width(image, areaWidth);
	}
	
	/**
	 * With this method you set a number of pixels you want the image to have and the image gets resized to the neccessary size.
	 * 
	 * @param	image Can be a MovieClip, Sprite or any object containing width and height properties.
	 * @param	pixelsSize (width * height) of the new image size will be the same than pixelsSize parameter.
	 */
	public static function toPixelsSize(image:Dynamic, pixelsSize:Int):Void
	{
		height(image, Math.sqrt(pixelsSize / (image.width / image.height))); 
	}
}