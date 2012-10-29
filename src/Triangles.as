package
{
	import org.flixel.*;
	
	public class Triangles extends FlxGroup
	{
		[Embed(source="data/triangles.png")] protected var ImgTriangles:Class;

		public function Triangles()
		{
			super();
			
			var w:int = Math.ceil((FlxG.width*0.5)/8);
			var h:int = Math.ceil((FlxG.height*0.5)/8);
			
			var sprite:FlxSprite;
			for(var r:int = 0; r < h; r++)
			{
				for(var c:int = 0; c < w; c++)
					add(new FlxSprite(c*8,r*8).loadGraphic(ImgTriangles,true));
			}
		}
		
		public function onBeat():void
		{
			var sprite:FlxSprite;
			for(var i:uint = 0; i < length; i++)
			{
				sprite = members[i] as FlxSprite;
				sprite.randomFrame();
				sprite.color = Colors.random();
			}
		}
	}
}