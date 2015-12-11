package com.nmefermmmtools.geometry;

import nme.geom.Point;

class Arrangement
{	
	public var currentRows		:Float;
	public var currentColumns	:Float;
	private var widthCount		:Float;
	private var heightCount		:Float;
	private var _rows			:Float;
	private var _columns		:Float;
	private var addRowsFirst	:Bool;
	public var _rowsDist		:Float;
	public var _columnsDist		:Float;

	
	/**
	 * 
	 * @param	rows Number of rows; 0 = no limit. One of each paramenter, "rows" or "columns", must be 0, otherwise "columns" will be changed to 0.
	 * @param	columns Number of columns; 0 = no limit. One of each paramenter, "rows" or "columns", must be 0, otherwise "columns" will be changed to 0.
	 * @param	rowsDistance Distance between rows. If this is set to -1 the distance between rows will be the width of the object.
	 * @param	columnsDistance Extra distance between columns. If this is set to -1 the distance between columns will be the height of the object.
	 */
	public function new(rows:Float = 0, columns:Float = 1, rowsDistance:Float = -1, columnsDistance:Float = -1)
	{			
		currentRows			= 0;
		currentColumns		= 0;
		widthCount			= 0;
		heightCount			= 0;
		_rows 				= rows;
		_columns 			= columns;
		_rowsDist 			= rowsDistance;
		_columnsDist 		= columnsDistance;
		
		if (columns == 0)
			addRowsFirst 	= false;
		else if (rows == 0)
			addRowsFirst 	= true;	
	}
	
	/**
	 * 
	 * @param	item DisplayObject that will be moved to be arranged... (or not).
	 * @param	apply When set to "true" the "x" and "y" properties of the DisplayObject changes. When set to "false" the DisplayObject it's not changed. You can use the point object this method returns containing the new coordinates. This is usefull if you want to make a motion tween animation.
	 * @return
	 */
	public function moveItem(item:Dynamic, apply:Bool = true):Point
	{
		var itemPosition:Point = new Point(0,0);
		
		if (addRowsFirst)
		{
			if (currentRows < _rows || _rows == 0)
			{
				newRow(item, itemPosition);
			}else {
				newColumn(item, itemPosition);
				currentRows = 0;
				heightCount = 0;
				newRow(item, itemPosition);
			}
		}else {
			if (currentColumns < _columns || _columns == 0)
			{
				newColumn(item, itemPosition);
			}else {
				newRow(item, itemPosition);
				currentColumns = 0;
				widthCount = 0;
				newColumn(item, itemPosition);
			}
		}
		
		if (apply)
		{
			item.x = itemPosition.x;
			item.y = itemPosition.y;
		}
		
		return itemPosition;
	}
	
	private function newColumn(item:Dynamic, itemPosition:Point):Void
	{
		itemPosition.x  = widthCount;
		itemPosition.y  = heightCount;
		if (_columnsDist >= 0)
			widthCount 		+= _columnsDist;
		else
			widthCount 		+= item.width;
		currentColumns++;
	}
	
	private function newRow(item:Dynamic, itemPosition:Point):Void
	{
		itemPosition.x  = widthCount;
		itemPosition.y  = heightCount;
		if(_rowsDist >= 0)
			heightCount 	+= _rowsDist;
		else
			heightCount 	+= item.height;
		currentRows++;
	}
	
}