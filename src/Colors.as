package
{
	import org.flixel.FlxG;
	import org.flixel.FlxU;
	
	public class Colors
	{		
		public static function random():uint
		{
			var flipped:Boolean = FlxG.random() < 0.5;
			return FlxU.makeColor(genPair(flipped),genPair(flipped),genPair(flipped));
		}
		
		public static function genPair(Flipped:Boolean):uint
		{
			if(FlxG.random() < 0.5)
			{
				if(Flipped)
					return 0;
				else
					return 0;
			}
			else
			{
				if(Flipped)
					return 0xff;
				else
					return 0xbb;
			}
			return;
			
			switch(int(FlxG.random()*4))
			{
				case 0:
					return 0;
					break;
				case 1:
					return 0xff;
					break;
				case 2:
					return 0xff;//0x55;
					break;
				case 3:
					return 0;//0xAA;
					break;
				default:
					break;
			}
			return 0;
		}
	}
}