package Games.GrandFather 
{
	import SharedClasses.Card;
	import flash.events.*
	
	/**
	 * ...
	 * @author Kolarov
	 */
	public class Assistant 
	{
		
		public function Assistant() 
		{
			
		}
		
		public static function dealing(deck:Deck,fieldPiles:Array):void {
			for (var pileIndex:int = 0; pileIndex < fieldPiles.length; pileIndex++) {
				var currentPile:FieldPile = fieldPiles[pileIndex];
				var dealtCard:Card = deck.giveTopCard();	
				currentPile.pushCard(dealtCard);
			}
		}
		
		public static function addEventListenerTo(obj:Object,cnst:String,functionToTrigger:Function):void {
			obj.addEventListener(cnst, functionToTrigger);
		}
	}

}