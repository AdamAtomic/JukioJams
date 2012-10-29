package
{
	import org.flixel.*;
	
	public class FireText extends FlxGroup
	{
		[Embed(source="data/text_mm.png")] protected var ImgMM:Class;
		[Embed(source="data/text_kozilek.png")] protected var ImgKozilek:Class;
		[Embed(source="data/text_fish.png")] protected var ImgFish:Class;
		[Embed(source="data/text_gc.png")] protected var ImgGameCity:Class;
		[Embed(source="data/gungod.png")] protected var ImgGunGod:Class;
		
		[Embed(source="data/fire.png")] protected var ImgFire:Class;
		
		static public const MM:uint = 0;
		static public const KOZILEK:uint = 1;
		static public const FISH:uint = 2;
		static public const GAMECITY:uint = 3;
		static public const GUNGOD:uint = 4;
		
		public var mm:FlxSprite;
		public var kozilek:FlxSprite;
		public var fish:FlxSprite;
		public var gameCity:FlxSprite;
		public var gunGod:FlxSprite;
		
		public function FireText()
		{
			super();
			
			add(new FlxSprite(0,0).makeGraphic(FlxG.width,FlxG.height,0xff110000));

			var i:int;
			var e:FlxEmitter;
			i = 400;
			e = new FlxEmitter(10,10,i);
			while(i-- > 0)
				e.add(new Fire());
			e.width = FlxG.width-20;
			e.height = FlxG.height-20;
			e.setYSpeed(-100,0);
			e.gravity = -200;
			e.setXSpeed(-50,50);
			e.setRotation();
			e.start(false,2,0.002);
			add(e);
			
			mm = new FlxSprite(0,0,ImgMM);
			add(mm);
			
			kozilek = new FlxSprite().loadGraphic(ImgKozilek,true,false,256,192);
			kozilek.addAnimation("idle",[0,1,2,3,2,1],12);
			kozilek.play("idle");
			add(kozilek);
			
			fish = new FlxSprite().loadGraphic(ImgFish,true,false,256,192);
			//fish.addAnimation("idle",[0,1,2,3,4,5,6,7,8,7,6,5,4,3,2,1],16);
			//fish.play("idle");
			fish.frame = 7;
			add(fish);
			
			gameCity = new FlxSprite(0,0,ImgGameCity);
			add(gameCity);
			
			gunGod = new FlxSprite().loadGraphic(ImgGunGod,true,false,256,192);
			gunGod.addAnimation("idle",[0,1,2,0,1,2,0,1,2,0,1,2,3,4,5,3,4,5,3,4,5,3,4,5],12);
			gunGod.play("idle");
			add(gunGod);
		}
		
		public function resetText(Text:uint):void
		{
			mm.visible = kozilek.visible = fish.visible = gameCity.visible = gunGod.visible = false;
			switch(Text)
			{
				case 0:
					mm.visible = true;
					break;
				case 1:
					kozilek.visible = true;
					break;
				case 2:
					fish.visible = true;
					break;
				case 3:
					gameCity.visible = true;
					break;
				case 4:
					gunGod.visible = true;
					break;
				default:
					break;
			}
		}
	}
}