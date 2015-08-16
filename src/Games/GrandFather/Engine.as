package Games.GrandFather 
{
	/**
	 * ...
	 * @author Kolarov
	 */
	import flash.events.*;
	public class Engine 
	{
		private var deck:Deck;
		private var deckPile:DeckPile;
		private var fieldPiles:Array;
		private var sidePiles:Array;
		
		public function Engine(deckPar:Deck,deckPilePar:DeckPile,fieldPilesPar:Array,sidePilesPar:Array) 
		{
			this.deck = deckPar;
			this.deckPile = deckPilePar;
			this.fieldPiles = fieldPilesPar;
			this.sidePiles = sidePilesPar;
			Assistant.dealing(this.deck, this.fieldPiles);
			//Assistant.addEventListenerTo(deck, MouseEvent.CLICK, putCardOnDeckPile);
		}
		
		
		
	}

}