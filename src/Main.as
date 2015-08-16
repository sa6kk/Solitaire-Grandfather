package
{
	import flash.display.Sprite;
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
		}
		
	}
	
}