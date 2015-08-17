package
{
	import flash.display.Sprite;
	import Games.GrandFather.GameButton;
	import Games.GrandFather.Grandfather;
	
	/**
	 * ...
	 * @author Kolarov
	 */
	public class Main extends Sprite 
	{
		
		public function Main() 
		{
			var grandfatherSolitaire:Grandfather = new Grandfather();
			this.addChild(grandfatherSolitaire);
			
			var gradient:GameButton = new GameButton('PLAY');
			addChild(gradient);
			
			var gradient2:GameButton = new GameButton('NEW GAME');
			addChild(gradient2);
			gradient2.y = 200;
		}
		
	}
	
}