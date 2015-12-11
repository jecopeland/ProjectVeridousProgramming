package;

import com.stencyl.Engine;
import openfl.display.Sprite;
import openfl.events.Event;

class JoystickEvent extends Event
{	
	public var distance:Float;
	public var direction:Float;
	
	public function new(type:String, distance:Float, direction:Float)
	{
		super(type, false, false);

		this.distance = distance;
		this.direction = direction;
	}
}