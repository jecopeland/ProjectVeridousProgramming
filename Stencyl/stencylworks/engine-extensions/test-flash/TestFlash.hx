import by.blooddy.crypto.Base64;
import flash.utils.ByteArray;

class TestFlash
{
	public static function base64Encode(s:String)
	{
		var byteArray = new ByteArray();
		byteArray.writeMultiByte(s, "iso-8859-1");
		trace(Base64.encode(byteArray, true));
	}
}