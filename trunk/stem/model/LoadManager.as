package stem.model { 
	
	import flash.display.Loader;
	import flash.media.SoundLoaderContext;
	import flash.net.*; 
	import flash.utils.*;
	import flash.events.*;

	
	
	public class LoadManager extends EventDispatcher {
		
	
		public var currentLoading:Array; 
		
		// Constructor
		
		public function LoadManager()  {	
			//trace("just made the load Manager" ); 
			currentLoading = new Array;
			
		}
		
		public function add(l)
		{
			//trace("added something to the current loading list"); 
			////trace(l); 
			currentLoading.push(l); 
			
			//now link event for those
			currentLoading[currentLoading.length-1].addEventListener(ProgressEvent.PROGRESS, handleProgress); 
			currentLoading[currentLoading.length-1].addEventListener(Event.COMPLETE, handleComplete); 

		}
		
		private function handleProgress(evt:ProgressEvent):void 
		{
			//TODO - when the image loading is linked in MVC need to get this work a b
			//trace("############## in the load managers update area"); 
			var percent:Number = evt.bytesLoaded/evt.bytesTotal*100;
			//trace (evt);
		}
		private function Load() {
			
			//trace("starting to load the xml"); 
			var loader:URLLoader = new URLLoader(); 
			loader.addEventListener(Event.COMPLETE, handleComplete) 
			//loader.load(new URLRequest(mySource)); 
			
		}
		
		private function handleComplete(e:Event) 
		{ 					
			//To this off the current list of what we are loading 
			
		for (var i:int = 0; i < currentLoading.length; i++) 
		{
			if (currentLoading[i] == e.target) 
			{
				var toDelete = i; 
				//trace("need to delete element " + i + " of the loading array "); 
			}
		}
			
		////trace(currentLoading); 

		//currentLoading.push("test");
		var tmp:Array = currentLoading; 
		////trace(tmp);
		var spliced:Array = tmp.splice(toDelete, 1);
	
		currentLoading = tmp; 
		
		////trace(currentLoading); 

 
		dispatchEvent(new Event(Event.COMPLETE));


		} 
		
			
	} 

}