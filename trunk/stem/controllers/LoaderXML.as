
package stem.controllers { 
	
	import flash.net.*; 
	import flash.utils.*;
	import flash.events.*;
	
	
	public class LoaderXML extends EventDispatcher {
		
		private var mySource:String; 
		private var myData:XML; 

		
		// Constructor
		
		public function LoaderXML()  {	
			trace("just made our xmlLoader" ); 		
			
		}
		
		//Getter and Setter 
		public function set setSource(s:String) {
			
			mySource = s; 
			//now that I have source I'm going have start to load it 
			Load(); 
		} 
		
		public function get Data():XML {
			trace("get about return my Data"); 
			return myData; 
		} 
		
		public function set setData(xml:XML) {
			myData = xml; 
		} 
		
		
		private function Load() {
			
			trace("starting to load the xml"); 
			var loader:URLLoader = new URLLoader(); 
			loader.addEventListener(Event.COMPLETE, handleComplete);
			loader.addEventListener(ProgressEvent.PROGRESS, handleProgress); 
			loader.load(new URLRequest(mySource)); 
			
		}
		
		private function handleProgress(evt:ProgressEvent):void
		{
		 dispatchEvent(new ProgressEvent(ProgressEvent.PROGRESS));
		}
		
		private function handleComplete(e:Event) {
			try { 					
				XML.ignoreWhitespace = true;
				myData = new XML(e.target.data);
				
				dispatchEvent(new Event(Event.COMPLETE));

				trace("xml file loaded"); 

				
			} catch (e:TypeError) {
				trace("there is a error in the XML file"); 	
				trace(e.message); 
			}
		} 
		
			
	} 

}