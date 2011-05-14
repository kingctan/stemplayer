﻿package stem.model { 
	
	import com.sproutlabs.stemplayer.view.controls.VideoChatBubble;
	
	import flash.display.Loader;
	import flash.events.*;
	import flash.media.Sound;
	import flash.net.*;
	import flash.utils.*;
	
	
	
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
			
			//check for the data type first
			//now link event for those
			
			var o:Object = currentLoading[currentLoading.length-1];
			switch (true) {
				case (o is Loader) :
					(o as Loader).contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, handleProgress);
					(o as Loader).contentLoaderInfo.addEventListener(Event.COMPLETE, handleComplete);
					break;
				case (o is VideoChatBubble):
					(o as VideoChatBubble).addEventListener(VideoChatBubble.VIDEO_PROGRESS, handleVideoProgress);
					(o as VideoChatBubble).addEventListener(Event.COMPLETE, handleComplete);
					break;
				case (o is Sound):
				default:
					o.addEventListener(ProgressEvent.PROGRESS, handleProgress);
					o.addEventListener(Event.COMPLETE, handleComplete);
					break;
			}			
		}
		
		protected function handleVideoProgress (e:Event):void {
			var vcb:VideoChatBubble = e.target as VideoChatBubble;
			_bytesLoaded = vcb.bytesLoaded;
			_bytesTotal = vcb.bytesTotal;						
			dispatchEvent (new ProgressEvent (ProgressEvent.PROGRESS));
		}
		
		private var _bytesLoaded:Number;
		private var _bytesTotal:Number;
		
		protected function handleProgress(evt:ProgressEvent):void 
		{
			//TODO - when the image loading is linked in MVC need to get this work a b
			//trace("############## in the load managers update area");
			_bytesLoaded = evt.bytesLoaded;
			_bytesTotal = evt.bytesTotal;
			dispatchEvent (evt);
		}
		
		public function get bytesLoaded ():Number {
			return _bytesLoaded;
		}
		public function get bytesTotal ():Number {
			return _bytesTotal;
		}
		
		private function Load() {
			
			//trace("starting to load the xml"); 
			var loader:URLLoader = new URLLoader(); 
			loader.addEventListener(Event.COMPLETE, handleComplete) 
			//loader.load(new URLRequest(mySource)); 
			
		}
		
		protected function handleComplete(e:Event) 
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
			dispatchEvent(e);
		} 
		
		
	} 
	
}