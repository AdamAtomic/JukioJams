package
{
	import org.flixel.*;
	[SWF(width="1024", height="768", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class JukioJams extends FlxGame
	{
		public function JukioJams()
		{
			super(256,192,PlayState,4,60,60,true);
			FlxG.stretch = true;
		}
	}
}
