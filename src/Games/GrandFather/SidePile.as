package Games.GrandFather 
{
	import flash.display.Sprite;
	import flash.display.Shape;
	import SharedClasses.Card;
	/**
	 * ...
	 * @author Mitko
	 */
	public class SidePile extends Sprite
	{
		private var sidePileCards:Array = [];
		private var startValue:int;
		private var suit:int;
		private var lengthOfCardsInSidePile:int;
		
		private const CARD_WIDTH:int = 65;
		private const CARD_HEIGHT:int = 100;
				
		public function SidePile(startValuePar:int, suitPar:String) 
		{
			drawBorder();
		}
		
		private function drawBorder():void {
			var line:Shape = new Shape();
			line.graphics.lineStyle(1, 0x0);
			line.graphics.moveTo(0, 0);
			line.graphics.lineTo(CARD_WIDTH, 0);
			line.graphics.lineTo(CARD_WIDTH, CARD_HEIGHT);
			line.graphics.lineTo(0, CARD_HEIGHT);
			line.graphics.lineTo(0, 0);
			this.addChild(line);
		}
		
		public function pushCard (card:Card):void {
			//TODO
		}
		
		
		public function get Cards():Array {
			
			return this.sidePileCards;							
		}
		
		public function get StartValue():int {
			
			return this.startValue;
		}
		
		public function get Suit():int {
			
			return this.suit;
		}
		
		public function LengthOfCardsInSidePile():int {
			
			return this.sidePileCards.length;
		}
		
		
	}

}