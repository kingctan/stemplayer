﻿package stem.model 
{
	import flash.events.*;
	import helper.Helper;
	import stem.*;
	import stem.model.*;


	
	/**
	* ...
	* @author Robin Petterd
	*/
	public class Model extends EventDispatcher {
	
			public var myData:InteractionData = new InteractionData(); 
			public var myHelper = new helper.Helper();

			public var myEvents = new InteractionEvents();
			
			public var loadManager; 
			
			//the internal states 
			private var buildState; 
			public var interactState; 
			
			//set the current state 
			public var state = buildState; 
			//set the state we about to change to 
			public var changingState; 
	
			public function Model() {
			trace("n- just created the model");
						
				loadManager = new LoadManager(); 

				buildState = new BuildState(this, "data/stem.xml"); 
				state = buildState; 
				

		}
		
		/**
		 * 
		 * This sends an event the view can piece up about state need to be ready to be changed.
		 */
		private function broadcastStateChanged(e:Event):void 
		{
			trace("n --- Model State has changed ---- ");
			dispatchEvent(new Event(myEvents.MODEL_STATE_CHANGED)); 

		}
		
		/**
		 * 
		 * This sends an event the view can piece up about state is ready and the view for it need to be built 
		 * but the state is not actually active yet. Basically it way of allow the states to be in a bit flux 
		 */	
		private function broadcastStateChanging(e:Event):void 
		{
			trace("n -- Model State is changing ---- ");
			dispatchEvent(new Event(myEvents.MODEL_STATE_CHANGING)); 

		}
		
		public function getMyTypeofChanging():String {
			trace("about to return the type");
			//trace(changingState);
			return changingState.getMyType();
			//return "test"; 
		}
		
	
	}
	
}