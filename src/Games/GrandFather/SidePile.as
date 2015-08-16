package Games.GrandFather 
{
	import flash.display.Sprite;
	import SharedClasses.Card;
	/**
	 * ...
	 * @author Mitko
	 */
	public class SidePile extends Sprite
	{
		private var sidePileCards:Vector.<Card>;
		private var startValue:int;
		private var suit:int;
		private var lengthOfCardsInSidePile:int;
				
		public function SidePile(startValuePar:int, suitPar:int) 
		{
			//TODO
		}
		
		public function pushCard (card:Card) {
			//TODO
		}
		
		
		public function get Cards():Vector.<Card> {
			
			return this.sidePilecards;							
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