package stem.views
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.AntiAliasType;
	import flash.text.Font;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	import stem.model.ResultBoxStyleVO;
	
	public class ResultBoxView extends Sprite
	{
		private var style:ResultBoxStyleVO;
		public function ResultBoxView(style:ResultBoxStyleVO)
		{
			super();
			this.style = style;
			if ( stage ) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private function init ( e:Event = null ):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			drawAssets ();
		}
		private var bgBox:Sprite;
		private var boxText:TextField;
		private var boxTextValue:String
		private function drawAssets ():void {
			if (!bgBox) { 
				bgBox = new Sprite();
				if (style) { 
					bgBox.graphics.beginFill(style.bgColor, style.bgAlpha);
					bgBox.graphics.drawRect(0,0,270,90);
					bgBox.graphics.endFill();
				}
				addChild (bgBox);
			}
			if (!boxText) {
				boxText = new TextField();
				
				boxText.antiAliasType = AntiAliasType.ADVANCED;
				boxText.autoSize = TextFieldAutoSize.LEFT;
				boxText.selectable = false;
				
				var tf:TextFormat = new TextFormat();
				tf.font = "_sans";
				tf.color = style.fontColor;
				
				boxText.defaultTextFormat = tf;
				boxText.x = 10;
				boxText.y = 10;
				if (boxTextValue) { 
					boxText.text = boxTextValue;
				}
				addChild(boxText);
			}
		}
		public function set text (s:String):void {
			boxTextValue = s;
			if (boxText) {
				boxText.text = boxTextValue;
			}
		}
		public function get text ():String { 
			return boxTextValue;
		}
		
	}
}
