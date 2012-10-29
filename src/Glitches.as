package
{
	import org.flixel.*;
	
	public class Glitches extends FlxGroup
	{
		public function Glitches()
		{
			super();
			
			for(var i:uint = 0; i < 16; i++)
				add(new Glitch());
		}
		
		public function onBeat():void
		{
			var sprite:Glitch;
			for(var i:uint = 0; i < length; i++)
			{
				sprite = members[i] as Glitch;
				sprite.reset(int(FlxG.random()*16)*16,int(FlxG.random()*12)*16);
			}
		}
	}
}