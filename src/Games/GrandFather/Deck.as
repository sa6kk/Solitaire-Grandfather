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
		private var deck:Array = [];
		private var LeftCard:int;
		private var ReloadTimesLeft1:int;
		private var TopCard:Card;
		
		private var deckSkinPath:String;
		
		public function Deck(deckSkinPathPar:String)
		{
			this.deckSkinPath = deckSkinPathPar;
			fillContainerWithImg(this , "/Data/images/Cards/Skin1/0Back.png", 65, 100);
			loadDeck();
			loadDeck();
		}
		
		private function loadDeck():void
		{
			var cardUrl:String;
			var cardNumbers:int = 14;
			var cardColors:int = 4
			
			for (var i:int = 0; i < cardNumbers; i++)
			{
				if (i == 0)
				{ //pass back card
					continue;
				}
				
				for (var j:int = 0; j < cardColors; j++)
				{
					var cardColor:String;
					
					if (i == 0)
					{
						cardColor = "Back";
						cardUrl = i + cardColor;
						
						//var card:Card = new Card(cardUrl, i);
						this.deck.push(card);
						
						break;
					}
					else
					{
						switch (j)
						{
						case 0: 
							cardColor = "C";
							break;
						case 1: 
							cardColor = "D";
							break;
						case 2: 
							cardColor = "H";
							break;
						case 3: 
							cardColor = "S";
							break;
						}
					}
					
					cardUrl = i + cardColor;
					
					var card:Card = new Card(cardUrl, i);
					this.deck.push(card);
				}
			}
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
		
		public function ReloadDeck(deckPileCards:Array):void
		{
		//TODO
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