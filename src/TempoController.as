package
{
	import org.flixel.*;
	
	public class TempoController extends FlxObject
	{
		public static const SLOWEST_TIME:Number = 2;
		public static var timing:Number;
		
		public var beat:Function;
		
		protected var _gap:Number;
		protected var _last:Number;
		protected var _check:Number;
		
		public function TempoController(Beat:Function)
		{
			super();
			beat = Beat;
			_gap = _check = 0;
			_last = timing = 0.5;
		}
		
		override public function update():void
		{
			_gap += FlxG.elapsed;
			if(FlxG.keys.justPressed("SPACE"))
			{
				if(_gap > SLOWEST_TIME)
					_last = timing;
				else
				{
					timing = (timing + _gap + _last)/3;
					
					var bpm:int = int(60/timing);
					bpm = int((bpm + 2.5)/5)*5 + 3;
					timing = 60/bpm;
					
					_last = _gap;
				}
				_gap = 0;
				_check = timing;
			}
			
			_check += FlxG.elapsed;
			if((_check >= timing) || FlxG.keys.UP || FlxG.keys.DOWN || FlxG.keys.LEFT || FlxG.keys.RIGHT)
			{
				if(_check > 0)
					_check -= timing;
				beat();
			}
			
			if( FlxG.keys.justPressed("UP") ||
				FlxG.keys.justPressed("DOWN") ||
				FlxG.keys.justPressed("LEFT") ||
				FlxG.keys.justPressed("RIGHT") )
			{
				FlxG.flash(0xffffff,0.2,null,true);
			}
			
			if(FlxG.keys.justPressed("ONE"))
				timing *= 2;
			if(FlxG.keys.justPressed("TWO"))
				timing *= 0.5;
		}
	}
}