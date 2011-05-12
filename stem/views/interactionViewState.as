	package stem.views{

	import fl.core.UIComponent;
	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	import util.*;



	/**
	* ...
	* @author Robin Petterd
	*/

	public class interactionViewState extends MovieClip {
	//public class interactionViewState extends InteractionViewStateAbstract implements ViewStateI {

		private var aChildren:Array;

		public function interactionViewState():void {
			//trace(" ----------- InteractionViewState has been made");
			//this.setup(m); //start the loading MIGHT need to back in somewhere else 
			this.aChildren = new Array(); 
		}


		public function add(c):void {
			//trace(c);
			aChildren.push(c);
			addChild(c);
			//c.setup(m)
		}

		 public function load():void {
			//giv this to each one as a command. 
			for each (var c in aChildren) {
				c.load();
			}
		}


		public function buildReady() {
			for each (var c in aChildren) {
				c.buildReady();
			}
		}
		public function loadReact():void {

			for each (var c in aChildren) {
				c.loadReact();
			}

		}

		public function buildReact(e:Event):void {

			for each (var c in aChildren) {
				c.React();
			}
		}




		/**
		 * Puts the interaction back into the Ready static state 
		 * @parame - the event that his trigger this - it's often the timer 
		 */
		 public function Ready(e:Event):void {

			for each (var c in aChildren) {
				c.React();
			}


		}
		/**
		 * Called after the model a got the click and dispatch an event 
		 * it grab what the current statement 
		 * @parame
		 */
		 public function React(e:Event):void {

			for each (var c in aChildren) {
				c.React();
			}


		}






	}

}