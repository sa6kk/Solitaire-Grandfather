package Games.GrandFather 
{
	/**
	 * ...
	 * @author Kolarov
	 */
	import flash.display.Sprite;
	import flash.events.*;
	import SharedClasses.Card;
	public class Engine 
	{
		private var deck:Deck;
		private var deckPile:DeckPile;
		private var fieldPiles:Array;
		private var sidePiles:Array;
		
		private var generalContainer:Sprite;
		
		private var takenCard:Card;
		private var takenCardFieldPile:FieldPile;
		
		public function Engine(deckPar:Deck,deckPilePar:DeckPile,fieldPilesPar:Array,sidePilesPar:Array,generalContainerPar:Sprite) 
		{
			this.deck = deckPar;
			this.deckPile = deckPilePar;
			this.fieldPiles = fieldPilesPar;
			this.sidePiles = sidePilesPar;
			this.generalContainer = generalContainerPar;
			Assistant.dealing(this.deck, this.fieldPiles);
			makeInteraction();
		}
		
		private function makeInteraction():void {
			makeDeckInteractive(); 
			makeInteractiveFieldPiles();
		}
		
		private function makeDeckInteractive():void {
			Assistant.addEventListenerTo(deck, MouseEvent.CLICK, putCardOnDeckPile);
		}
		
		private function makeInteractiveFieldPiles():void {		
			for (var fieldPileIndex:int = 0; fieldPileIndex < fieldPiles.length; fieldPileIndex++) {
			var currentFieldPile:FieldPile = fieldPiles[fieldPileIndex];
				if (currentFieldPile.TopCard != null) {
					Assistant.addEventListenerTo(currentFieldPile, MouseEvent.MOUSE_DOWN, dragTopCardFromFieldPile);
				}
			}
		}
		/////////////////////////////////////////////////// MouseEvents	
		private function putCardOnDeckPile(e:MouseEvent):void {
			//tween from deck to deck pile
			var deckTopCard:Card = deck.giveTopCard();
			this.deckPile.pushCard(deckTopCard);
		}
		
		private function dragTopCardFromFieldPile(e:MouseEvent):void {
			this.takenCardFieldPile = e.currentTarget as FieldPile;
			this.takenCard = takenCardFieldPile.giveTopCard() as Card;
			this.generalContainer.addChild(this.takenCard);
			this.takenCard.x = this.takenCardFieldPile.x;
			this.takenCard.y = this.takenCardFieldPile.y;
			this.takenCard.startDrag();
			Assistant.addEventListenerTo(takenCard, MouseEvent.MOUSE_UP, dropTakenCardFromFieldPile);
		}
		
		private function dropTakenCardFromFieldPile(e:MouseEvent):void {
			takenCard.stopDrag();
			var isAllowed:Boolean = false;
			
			for (var sidePileIndex:int = 0; sidePileIndex < sidePiles.length; sidePileIndex++) {
				var currentSidePile:SidePile = sidePiles[sidePileIndex];
				if (this.takenCard.hitTestObject(currentSidePile)) {
					if (this.takenCard.CardValue == 1 && this.takenCard.CardSign == currentSidePile.Sign && currentSidePile.TopCard == null && currentSidePile.StartValue == 1) {
						isAllowed = true;
						this.generalContainer.removeChild(this.takenCard);
						currentSidePile.pushCard(this.takenCard);
					}
					if (currentSidePile.StartValue == 1 && this.takenCard.CardSign == currentSidePile.Sign && this.takenCard.CardValue == currentSidePile.TopCard.CardValue + 1) {
						isAllowed = true;
						this.generalContainer.removeChild(this.takenCard);
						currentSidePile.pushCard(this.takenCard);
					}
					if (currentSidePile.StartValue == 13 && this.takenCard.CardSign == currentSidePile.Sign && this.takenCard.CardValue == currentSidePile.TopCard.CardValue - 1) {
						isAllowed = true;
						this.generalContainer.removeChild(this.takenCard);
						currentSidePile.pushCard(this.takenCard);
					}
					if (this.takenCard.CardValue == 13 && this.takenCard.CardSign == currentSidePile.Sign && currentSidePile.TopCard == null && currentSidePile.StartValue == 13) {
						isAllowed = true;
						this.generalContainer.removeChild(this.takenCard);
						currentSidePile.pushCard(this.takenCard);
					}
				}
			}
			
			if (!isAllowed) {
				returnTakenCardToFieldPile();
			}
		}
		
		private function returnTakenCardToFieldPile():void {
			this.takenCard.parent.removeChild(this.takenCard);
			this.takenCardFieldPile.pushCard(this.takenCard);
		}
		
	}

}