package Games.GrandFather 
{
	import flash.text.TextField;
	import flash.geom.*;
    import flash.display.*;	
	import flash.events.*;
	import flash.text.TextFormat;
	/**
	 * ...
	 * @author Mitko
	 */
	public class GameButton extends Sprite
	{
		private var buttonText:String;
		 
		
		public function GameButton(buttonTextPar:String) 
		{
			var type:String = GradientType.RADIAL; 
			var colors:Array = [0xF2290D, 0x000000]; 
			var alphas:Array = [0.8, 0.8]; 
			var ratios:Array = [50, 250]; 						// цвета на елипсата в средата е по наситена
			var spreadMethod:String = SpreadMethod.PAD; 
			var interp:String = InterpolationMethod.RGB; 
			var focalPtRatio:Number = 0;
			var matrix:Matrix = new Matrix(); 
			var boxWidth:Number = 200; 							//увеличава площта на елипсата в средата
			var boxHeight:Number = 100; 
			var boxRotation:Number = Math.PI/2; // 90° 
			var tx:Number = 0; 								// от къде да започва червената елипса по Х
			var ty:Number = 0; 
			matrix.createGradientBox(boxWidth, boxHeight, boxRotation, tx, ty);; 
			this.graphics.beginGradientFill(type,colors,alphas,ratios, matrix, spreadMethod, interp, focalPtRatio);
			this.graphics.drawRoundRect(0,0,200,35,20,20)
			
			this.buttonText = buttonTextPar;			
			var buttonTxtFiled:TextField = new TextField();
			buttonTxtFiled.text = this.buttonText;			
			
			var levelOnetxtFormat:TextFormat = new TextFormat();
			buttonTxtFiled.setTextFormat(levelOnetxtFormat);
			buttonTxtFiled.defaultTextFormat = new TextFormat('Comic Sans MS', 20, 0xFF0000, 'bold');
			buttonTxtFiled.text = this.buttonText;
			this.addChild(buttonTxtFiled);
			buttonTxtFiled.x = this.x + (this.width / 2) -( buttonTxtFiled.width / 2);
			buttonTxtFiled.y = 0;
			//levelOneTxt.autoSize = TextFieldAutoSize.LEFT;
			buttonTxtFiled.mouseEnabled = false;
			buttonTxtFiled.selectable = false;
			buttonTxtFiled.textColor = 0X000000;
			buttonTxtFiled.height = 50;
			buttonTxtFiled.width = 200;
			buttonTxtFiled.border = false;
			buttonTxtFiled.borderColor = 0X000000;			
			buttonTxtFiled.background = false;
			buttonTxtFiled.backgroundColor = 0X0000CC;
			
			
		}
		
	}

}