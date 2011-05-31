package
{
	import com.bit101.components.PushButton;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	import stem.Stem;
	
	[SWF (width="600", height="400", frameRate="60", backgroundColor="#f0f0f0")]
	public class StemPlayerRunner extends MovieClip
	{
		public function StemPlayerRunner() {
			if ( stage ) init ();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		private var stemObject:Stem;
		private function init (e:Event = null):void {
			//build the class with the required arguments
			//var s:Stem = new Stem("data/stem.xml", "3");
			stemObject = new Stem();
			addChild (stemObject);
			stemObject.dataFileSource = "data/stem.xml"
			//stemObject.statement = "4";
			stemObject.start();
			var p:PushButton = new PushButton (this, 10, 10, "Load to statement 4", jumpToStatement);
		}
		private function jumpToStatement (arg:MouseEvent):void
		{
			stemObject.statement = "4";
		}
	}
}
