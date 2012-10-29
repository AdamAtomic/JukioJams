package 
{
	import org.flixel.*;
	
	public class SinThing extends FlxSprite
	{
		[Embed(source="data/particle_circloid.png")] protected var ImgCircle:Class;
		[Embed(source="data/particle_diamond_big.png")] protected var ImgDiamond:Class;
		[Embed(source="data/particle_square.png")] protected var ImgSquare:Class;
		
		public var s:FlxPoint;
		public var flipped:Boolean;
		public var half:Boolean;
		
		protected var _timer:Number;
		
		public function SinThing(Toggled:Boolean)
		{
			super();
			
			var base:int = 0;
			var fr:Number = 10 + FlxG.random() * 10;
			switch(int(FlxG.random()*3))
			{
				case 0:
					loadGraphic(ImgSquare,true,false,18,18);
					if(Toggled)
						base = 5;
					addAnimation("idle",[base+0,base+1,base+2,base+3,base+4,base+3,base+2,base+1],20);
					break;
				case 1:
					loadGraphic(ImgCircle,true,false,18,18);
					if(Toggled)
						base = 5;
					addAnimation("idle",[base+0,base+1,base+2,base+3,base+4,base+3,base+2,base+1],20);
					break;
				case 2:
					loadGraphic(ImgDiamond,true,false,31,31);
					if(Toggled)
						base = 8;
					addAnimation("idle",[base+0,base+1,base+2,base+3,base+4,base+5,base+6,base+7,base+6,base+5,base+4,base+3,base+2,base+1],20);
					break;
				default:
					break;
			}
			play("idle");
			
			s = new FlxPoint(FlxG.width*FlxG.random(),FlxG.height*FlxG.random());

			if(FlxG.random() < 0.5)
				flipped = true;
			
			if(FlxG.random() < 0.3)
				half = true;
			
			_timer = 0;
		}
		
		override public function update():void
		{
			var amount:Number = FlxG.elapsed*(60/TempoController.timing)*0.0075;
			if(flipped)
				amount = -amount;
			s.x += amount;
			s.y += amount;
			x = FlxG.width*0.5 + Math.sin(s.x)*FlxG.width*0.5*(half?0.5:1);
			y = FlxG.height*0.5 + Math.sin(s.y)*FlxG.height*0.5*(half?0.5:1);
			
			_timer += FlxG.elapsed;
			if(_timer > TempoController.timing)
			{
				_timer = 0;
				color = Colors.random();
			}
		}
	}
}