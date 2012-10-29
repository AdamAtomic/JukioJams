package
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Matrix;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	
	import org.flixel.FlxG;

	public class Mirror
	{
		static public var bmp:Bitmap;
		static public var rect:Rectangle;
		static public var point:Point;
		static public var matrix:Matrix;
		
		public function Mirror()
		{
			point = new Point();
			rect = new Rectangle(0,0,FlxG.width*0.5,FlxG.height*0.5);
			matrix = new Matrix();
			bmp = new Bitmap(new BitmapData(rect.width,rect.height,false));
		}
		
		public static function flip(Source:BitmapData):void
		{
			bmp.bitmapData.copyPixels(Source,rect,point);
			
			matrix.identity();
			matrix.scale(-1,1);
			matrix.translate(rect.width*2,0);
			Source.draw(bmp,matrix);
			
			matrix.identity();
			matrix.scale(1,-1);
			matrix.translate(0,rect.height*2);
			Source.draw(bmp,matrix);
			
			matrix.identity();
			matrix.scale(-1,-1);
			matrix.translate(rect.width*2,rect.height*2);
			Source.draw(bmp,matrix);
		}
	}
}