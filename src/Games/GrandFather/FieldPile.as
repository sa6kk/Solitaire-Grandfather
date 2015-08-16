package Games.GrandFather 
{
	import flash.display.Sprite;
	import SharedClasses.Card;
	/**
	 * ...
	 * @author Mitko
	 */
	public class FieldPile extends Sprite
	{
		private var fieldPileIndex:int;
		private var cardsInFieldPile:Vector.<Card>;
		private var topCard:Card;
		private var lengthOfCardsInFieldPile:int;
		
		public function FieldPile(fieldPileIndexPar:int) 
		{
			initIndex (fieldPileIndexPar);
		}
		
		private function initIndex (fieldPileIndexPar:int):void {
			this.fieldPileIndex = fieldPileIndexPar;
		}
		public function pushCard (card:Card):void {						//push card in vector
				if (this.cardsInFieldPile.length == 0) {
					this.addChild(card);
					card.x = 0;
					card.y = 0;
				}
				
				if (this.cardsInFieldPile.length == 1) {
					this.addChild(card);
					card.x = 10;
					card.y = 0;
				}
				this.cardsInFieldPile.push(card);
				this.topCard = card;
		}
		
		public function giveTopCard():Card {
			var currentTopCard:Card = this.topCard;
			this.removeChild(this.topCard);
			this.cardsInFieldPile.pop();
			if (this.cardsInFieldPile.length == 1) {
				this.topCard = this.cardsInFieldPile[cardsInFieldPile.length - 1];
			}
			if (this.cardsInFieldPile.length == 0) {
				this.topCard = null;
			}
			return currentTopCard;
		}
		
		public function get FieldPileIndex():int { 						// returns the index of field pile
			
			return this.fieldPileIndex;
		}
		
		public function get Cards():Vector.<Card> { 			 // returns all cards
			
			return this.cardsInFieldPile;									
		}
		
		public function get TopCard():Card { 							// returns the top Card
			
			return this.topCard;
		}
		
		public function get LengthOfCardsInFieldPile():int { 			// returns lenght of the vector with cards
			
			return this.cardsInFieldPile.length;					
		}
		
	}

}