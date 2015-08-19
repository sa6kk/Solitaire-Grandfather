package Games.EightOff
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.geom.*;
	import Games.EightOff.*;
	import Games.GrandFather.Assistant;
	import Games.GrandFather.GameButton;
	import Games.GrandFather.Rules;
	import SharedClasses.Button;
	import SharedClasses.TimerCounter;
	
	/**
	 * ...
	 * @author Kolarov
	 */
	public class EightOff extends Sprite
	{
		private var rulesText:String = "This solitaire uses 52 cards. 48 cards are dealt into 8 tableau piles. Eight cells (reserves) are placed above the tableau piles. At the start of the game 1 card is dealt to each of the 4 cells on the left. Four foundation piles are placed to the right of tableaus. Aces are moved to the foundations as they become available.The object of the game:To build the foundations up in suit to Kings.The rulesThe top cards of tableau piles and cards from cells are available to play. You may build tableau piles down in suit. Only one card at a time can be moved. The top card of any tableau pile can also be moved to any cell. Each cell may contain only one card. Cards in the cells can be moved to the foundation piles or back to the tableau piles, if possible.";
		private var deck:Deck = new Deck();
		
		private var extraPiles:Array = [];//8
		private var fieldPiles:Array = [];//8
		private var sidePiles:Array = [];//4
		
		private var suits:Array = ["D", "H", "C", "S"];
		
		private const StartPointExtraPiles:Point = new Point(30, 30);
		private const StartPointFieldPiles:Point = new Point(30, 150);
		private const StartPointSidePiles:Point = new Point(680, 20);
		private const CARD_WIDTH:int = 65;
		private const CARD_HEIGHT:int = 100;
		
		private var gameEngine:Engine;
		
		private var isGameRunning:Boolean = true;
		private var isWin:Boolean = false;
		
		private var buttonRules:Button = new Button(120,"How To Play...");
		private var rules:Rules;
		private var isRulesHidden:Boolean = true;
		
		private var timer:TimerCounter;
		
		private var buttonSurrender:GameButton = new GameButton("Surrender");
		
		public function EightOff()
		{
			loadPiles();
			loadButtons();
			loadTimer();
			gameEngine = new Engine(this as Sprite, this.extraPiles, this.fieldPiles, this.sidePiles, this.deck, this.isGameRunning, this.isWin);
		}
		
		private function loadTimer():void {
			this.timer = new TimerCounter(0,10);
			this.timer.alpha = 0.4;
			this.addChild(timer);
			timer.x = 0;
		}
		
		private function loadButtons():void
		{
			loadButtonRules();
			loadButtonSurrender();
		}
		
		private function loadButtonSurrender():void {
			this.addChild(this.buttonSurrender);
			this.buttonSurrender.x = 720;
			this.buttonSurrender.y = 0;
			Assistant.addEventListenerTo(this.buttonSurrender, MouseEvent.CLICK, surrender)
		}
		
		private function surrender(e:MouseEvent):void {
			this.isWin = false;
			this.isGameRunning = false;
		}
		
		private function loadButtonRules():void
		{
			this.addChild(buttonRules);
			this.buttonRules.x = 0;
			this.buttonRules.y = 559;
			Assistant.addEventListenerTo(this.buttonRules, MouseEvent.CLICK, showHideRules);
			this.rules = new Rules(rulesText);
		}
		
		private function showHideRules(e:MouseEvent):void
		{
			if (this.isRulesHidden)
			{
				this.addChild(rules);
				this.isRulesHidden = false;
			}
			
			else
			{
				this.removeChild(rules);
				this.isRulesHidden = true;
			}
		}
		
		private function loadPiles():void
		{
			loadExtraPiles();
			loadFieldPiles();
			loadSidePiles();
		}
		
		private function loadExtraPiles():void
		{
			var interval:int = 10;
			for (var extraPileIndex:int = 0; extraPileIndex < 8; extraPileIndex++)
			{
				var extraPile:ExtraPile = new ExtraPile();
				this.extraPiles.push(extraPile);
				this.addChild(extraPile);
				extraPile.x = this.StartPointExtraPiles.x + (interval + this.CARD_WIDTH) * extraPileIndex;
				extraPile.y = this.StartPointExtraPiles.y;
			}
		}
		
		private function loadFieldPiles():void
		{
			var interval:int = 10;
			for (var fieldPileIndex:int = 0; fieldPileIndex < 8; fieldPileIndex++)
			{
				var fieldPile:FieldPile = new FieldPile();
				this.fieldPiles.push(fieldPile);
				this.addChild(fieldPile);
				fieldPile.x = this.StartPointFieldPiles.x + (interval + this.CARD_WIDTH) * fieldPileIndex;
				fieldPile.y = this.StartPointFieldPiles.y;
			}
		}
		
		private function loadSidePiles():void
		{
			var interval:int = 10;
			for (var sidePileIndex:int = 0; sidePileIndex < 4; sidePileIndex++)
			{
				var currentSuit:String = this.suits[sidePileIndex];
				var sidePile:SidePile = new SidePile(currentSuit);
				this.sidePiles.push(sidePile);
				this.addChild(sidePile);
				sidePile.x = this.StartPointSidePiles.x;
				sidePile.y = this.StartPointSidePiles.y + (interval + this.CARD_HEIGHT) * sidePileIndex;
			}
		}
		
		public function get IsWin():Boolean
		{
			return this.isWin
		}
		
		public function get IsGameRunning():Boolean
		{
			return this.isGameRunning
		}
	
	}

}