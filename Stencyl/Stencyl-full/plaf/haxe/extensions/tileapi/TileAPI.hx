import box2D.common.math.B2Vec2;
import box2D.collision.shapes.B2Shape;
import box2D.collision.shapes.B2PolygonShape;

import haxe.xml.Fast;

import com.stencyl.Engine;
import com.stencyl.Data;
import com.stencyl.utils.Utils;
import com.stencyl.models.Actor;
import com.stencyl.models.actor.Collision;
import com.stencyl.models.actor.CollisionPoint;
import com.stencyl.models.scene.Tile;
import com.stencyl.models.scene.Tileset;
import com.stencyl.models.GameModel;
import com.stencyl.io.SpriteReader;

class TileAPI
{
	public static function setTileAt(row:Dynamic, col:Dynamic, layerID:Dynamic, tilesetID:Dynamic, tileID:Dynamic)
	{
		var engine = Engine.engine;
	
		row = Std.int(row);
		col = Std.int(col);
		layerID = Std.int(layerID);
		tilesetID = Std.int(tilesetID);
		tileID = Std.int(tileID);
	
		var tlayer = engine.tileLayers.get(layerID);
		
		if(tlayer == null)
		{
			return;
		}
		
		var tset = cast(Data.get().resources.get(tilesetID), Tileset);
		var tile:Tile = tset.tiles[tileID];
		
		//add the Tile to the TileLayer
		tlayer.setTileAt(row, col, tile);    
		
		//If animated tile and not already in update list, add to update list
		if (tile != null && tile.pixels != null && !(Utils.contains(engine.animatedTiles, tile)))
		{
			if(tile.durations.length > 1)
			{
				engine.animatedTiles.push(tile);
			}
		}
		
		//Now add the shape as a body
		if(tile != null && tile.collisionID != -1)
		{
			// Copy the default shape into a new one that can be scaled to fit the tile size.
			var refTileShape = GameModel.get().shapes.get(tile.collisionID);
			var vertices = refTileShape.getVertices();
			var vertexCount = refTileShape.getVertexCount();
			var tileShape = B2PolygonShape.asArray(vertices,vertexCount);
			
			// Adjust the collison shape based on the tile size.
			for(vec in tileShape.getVertices())
			{
			vec.x *= (engine.scene.tileWidth/32);
			vec.y *= (engine.scene.tileHeight/32);
			}
			
			var x = col * engine.scene.tileWidth;
			var y = row * engine.scene.tileHeight;
			
			if(!Engine.NO_PHYSICS && tileShape != null)
			{
				createDynamicTile(tileShape, Engine.toPhysicalUnits(x), Engine.toPhysicalUnits(y), layerID, engine.scene.tileWidth, engine.scene.tileHeight);
			}
			else if (tileShape != null)
			{
				engine.tileLayers.get(layerID).grid.setTile(col, row);
			}
		}
		
		engine.tileUpdated = true;
	}
	
	public static function tileExistsAt(row:Dynamic, col:Dynamic, layerID:Dynamic):Bool
	{
		return getTileAt(Std.int(row), Std.int(col), Std.int(layerID)) != null;
	}
	
	//tileCollisionAt function added to return True if ANY collision shape exists, or False for no tile or collision shape
	//if the user gives it a negative value for the layer, it will loop through all layers instead of a specific one
	public static function tileCollisionAt(row:Dynamic, col:Dynamic, layerID:Dynamic):Bool
	{
		if(layerID < 0)
		{
			var engine = Engine.engine;
			var i:Int = 0;
			for (layer in engine.tileLayers)
			{
				var tile = getTileAt(Std.int(row), Std.int(col), i);
				i++;
				if((tile == null) || (tile.collisionID == -1))
				{
					continue;
				}
				else
				{
					return true;
				}
			}
			return false;
		}
		else
		{
			var tile = getTileAt(Std.int(row), Std.int(col), Std.int(layerID));
			if((tile == null) || (tile.collisionID == -1))
			{
				return false;
			}
			else
			{
				return true;
			}
		}
	}
	//to easily get a column or row coordinate at a given X or Y coordinate
	public static function getTilePosition(axis:Dynamic, val:Dynamic):Int
	{
		var engine = Engine.engine;
		var tileH = engine.scene.tileHeight;
		var tileW = engine.scene.tileWidth;
		
		if(axis == 0)
		{
			return Std.int(Math.floor(val / tileW));
		}
		else
		{
			return Std.int(Math.floor(val / tileH));
		}
	}
	public static function getTileIDAt(row:Dynamic, col:Dynamic, layerID:Dynamic):Int
	{
		var tile = getTileAt(Std.int(row), Std.int(col), Std.int(layerID));
		
		if(tile == null)
		{
			return -1;
		}
		
		return tile.tileID;
	}
	
	public static function getTileColIDAt(row:Dynamic, col:Dynamic, layerID:Dynamic):Int
    {
    	var tile = getTileAt(Std.int(row), Std.int(col), Std.int(layerID));
                       
        if(tile == null)
        {
        	return -1;
        }
                       
        return tile.collisionID;
    }

	public static function getTileDataAt(row:Dynamic, col:Dynamic, layerID:Dynamic):String
    {
    	var tile = getTileAt(Std.int(row), Std.int(col), Std.int(layerID));
        
        if(tile == null)
        {
        	return "";
        }
        
        return tile.metadata;
    }
	
	public static function getTilesetIDAt(row:Dynamic, col:Dynamic, layerID:Dynamic):Int
	{
		var tile = getTileAt(Std.int(row), Std.int(col), Std.int(layerID));
		
		if(tile == null)
		{
			return -1;
		}
		
		return tile.parent.ID;
	}
	
	public static function getTileAt(row:Dynamic, col:Dynamic, layerID:Dynamic):Tile
	{
		var engine = Engine.engine;
		var tlayer = engine.tileLayers.get(Std.int(layerID));
		
		if(tlayer == null)
		{
			return null;
		}
		
		return tlayer.getTileAt(Std.int(row), Std.int(col));
	}
	
	public static function removeTileAt(row:Dynamic, col:Dynamic, layerID:Dynamic)
	{
		var engine = Engine.engine;
		
		row = Std.int(row);
		col = Std.int(col);
		layerID = Std.int(layerID);
	
		var tlayer = engine.tileLayers.get(layerID);
		
		if(tlayer == null)
		{
			return;
		}
		
		//grab the tile to get the shape
		var tile:Tile = getTileAt(row, col, layerID);
		
		//If we find a tile in this location
		if(tile != null)
		{
			//Remove the collision box
			if(!Engine.NO_PHYSICS && tile.collisionID != -1)
			{
				var x = col * engine.scene.tileWidth;
				var y = row * engine.scene.tileHeight;
				var key = "ID" + "-" + x + "-" + y + "-" + layerID;
				var a = engine.dynamicTiles.get(key);
				
				if(a != null)
				{
					engine.removeActor(a);
					engine.dynamicTiles.remove(key);
				}
			}
			
			else if (tile.collisionID != -1)
			{
				engine.tileLayers.get(layerID).grid.clearTile(col, row);
			}
			
			//Remove the tile image
			tlayer.setTileAt(row, col, null);
			
			engine.tileUpdated = true;
		}
	}

	public static function getTileForCollision(actor:Actor, event:Collision, point:CollisionPoint):Tile
	{
		var engine = Engine.engine;
		var xNormal:Int = Math.round(Engine.toPixelUnits(point.normalX));
		var yNormal:Int = Math.round(Engine.toPixelUnits(point.normalY));
		var x:Int = Math.round(Engine.toPixelUnits(point.x));
		var y:Int = Math.round(Engine.toPixelUnits(point.y));

		if(event.actorA != actor)
		{
			xNormal = -xNormal;
			yNormal = -yNormal;
		}

		if(xNormal < 0 && (x % engine.scene.tileWidth == 0))
			x -= 1;
		if(yNormal < 0 && (y % engine.scene.tileHeight == 0))
			y -= 1;

		x = getTilePosition(0, x);
		y = getTilePosition(1, y);

		var i:Int = 0;
		for(layer in engine.tileLayers)
		{
			var tile = getTileAt(y, x, i++);
			if((tile == null) || (tile.collisionID == -1))
				continue;
			return tile;
		}
		return null;
	}

	public static function getTileDataForCollision(actor:Actor, event:Collision, point:CollisionPoint):String
	{
		var t:Tile = getTileForCollision(actor, event, point);
		if(t != null)
			return  t.metadata;
		else
			return "";
	}
	
	//TODO: For simple physics, we stick in either a box or nothing at all - maybe it autohandles this?
	private static function createDynamicTile(shape:B2Shape, x:Float, y:Float, layerID:Int, width:Float, height:Float)
	{
		var engine = Engine.engine;
		
		var a:Actor = new Actor
		(
			engine, 
			Utils.INTEGER_MAX,
			GameModel.TERRAIN_ID,
			x, 
			y, 
			layerID,
			width, 
			height, 
			null, //sprite
			null, //behavior values
			null, //actor type
			null, //body def
			false, //sensor?
			true, //stationary?
			false, //kinematic?
			false, //rotates?
			shape, //terrain shape
			-1, //typeID?
			false, //is lightweight?
			false //autoscale?
		);
		
		a.name = "Terrain";
		a.visible = false;
		
		engine.moveActorToLayer(a, layerID);

		var key = "ID" + "-" + Engine.toPixelUnits(x) + "-" + Engine.toPixelUnits(y) + "-" + layerID;

		engine.dynamicTiles.set(key, a);
	}
}