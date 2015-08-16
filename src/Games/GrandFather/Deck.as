package Games.GrandFather
{
	import flash.display.Sprite;
	import SharedClasses.Card;
	import flash.display.Bitmap;
	import flash.display.Loader;
	import flash.events.*;
	import flash.net.*;
	/**
	 * ...
	 * @author
	 */
	public class Deck extends Sprite
	{
		private static var deck:Vector = new Vector.<Card>();
		private var LeftCard:int;
		private var ReloadTimesLeft1:int;
		private var TopCard:Card;
		
		public function Deck()
		{
			fillContainerWithImg(this , "", 50, 100);
		}
		
		public function RandomNumber():int
		{
			return (Math.floor(Math.random() * ((this.deck.length - 1) - 0 + 1)) + 0);
		}
		
		private function giveTopCard():Card
		{
			var randomNumber:int = RandomNumber();
			this.TopCard = deck.splice(randomNumber);
			return this.TopCard;
		}
		
		public function ReloadDeck(deckPileCards:Vector):void
		{
		
		}
		
		private function fillContainerWithImg(container:Sprite, path:String, imgWidth:int, imgHeight:int):void
		{			
			var img:Loader = new Loader();
			img.load(new URLRequest(path));
			img.contentLoaderInfo.addEventListener(Event.COMPLETE, function():void
			{
				onLoaderComplete(container, img, imgWidth, imgHeight)
			});
		}
		
		private function onLoaderComplete(container:Sprite, img:Loader, imgWidth:int, imgHeight:int):void
		{
			var bmp:Bitmap = new Bitmap();
			bmp = img.content as Bitmap;
			bmp.width = imgWidth;
			bmp.height = imgHeight;
			container.addChildAt(bmp, 0);
			bmp.x = 0;
			bmp.y = 0;
		}
	
	}

}