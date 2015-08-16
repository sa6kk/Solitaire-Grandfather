package Games.GrandFather 
{
	import flash.display.Sprite;
	import SharedClasses.Card;
	/**
	 * ...
	 * @author 
	 */
	public class DeckPile extends Sprite
	{
		private var cardsInDeckPile:Vector = new Vector.<Card>();
		private var topCard:Card;
		
		public function DeckPile() 
		{
			
		}
		
		public function pushCard(card:Card) :void{
			this.cardsInDeckPile.push(card);
			this.addChild(card);
			this.topCard = card;
		}
		
		
		public function giveTopCard():Card {
			var currentTopCard:Card = this.topCard;
			this.removeChild(this.topCard);
			this.cardsInFieldPile.pop();
			if (this.cardsInFieldPile.length != 0) {
				this.topCard = this.cardsInFieldPile[cardsInFieldPile.length - 1];
			}
			if (this.cardsInFieldPile.length == 0) {
				this.topCard = null;
			}
			return currentTopCard;
		}
	}

}