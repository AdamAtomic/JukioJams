package
{
	import org.flixel.*;
	
	public class Glitch extends FlxSprite
	{
		[Embed(source="data/glitch.png")] protected var ImgGlitch:Class;
		
		public var frame1:int;
		public var color1:uint;
		public var frame2:int;
		public var color2:uint;
		public var color3:uint;
		
		public function Glitch()
		{
			super();
			loadGraphic(ImgGlitch,true,false,32,16,true);
		}
		
		override public function reset(X:Number,Y:Number):void
		{
			super.reset(X,Y);
			
			color1 = Colors.random();
			color2 = Colors.random();
			color3 = Colors.random();
			
			frame1 = 1 + FlxG.random()*20;
			frame2 = 1 + FlxG.random()*20;
		}
		
		override public function draw():void
		{
			//color = color1;
			//frame = 0;
			//super.draw();
			color = color2;
			frame = frame1;
			super.draw();
			color = color3;
			frame = frame2;
			super.draw();
		}
	}
}