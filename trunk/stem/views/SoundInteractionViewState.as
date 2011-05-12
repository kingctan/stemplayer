package stem.views{

	import fl.core.UIComponent;
	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	import util.*;

	import flash.media.Sound;
	import flash.media.SoundChannel;

	import flash.net.URLRequest;



	/**
	* ...
	* @author Robin Petterd
	*/
	public class SoundInteractionViewState extends InteractionViewStateAbstract implements ViewStateI {

		private var myStatementsSounds:Array;
		public var currentSound:Sound;
		public var currentChannel:SoundChannel;

		private var mode:String="debugNO";//when this set to debug you can skip thru the choices quickly  
		public function SoundInteractionViewState(m,rc):void {
			//trace("######## Sound InteractionViewState has been made");
			this.setup(m,rc);//start the loading 

		}


		override public function load():void {

			//buildBackground(); 
			buildReady();
			//loadReact();
		}

		public function buildReady() {
			//trace("###### Building the sound");

			myStatementsSounds = new Array ();

			currentSound = new Sound();


			//now we need to find all the sounds 
			//loop thru all the statements find all the sounds and put them into multi dimensional array that reflects the
			//statement data structure. 
			var i:Number=0;

			while (i < model.myData.getStatementLength()) {

				////trace(model.myData.getStatementAtasXML(i)); 
				var statement:XML=model.myData.getStatementAtasXML(i);
				i++;

				////trace(statement);

				for each (var bit:XML in statement) {
					var currentReactions:Array = new Array();

					for each (var react:XML in bit.reaction) {

						//trace(react.@sound.toString());

						if (react.@sound.toString()!="") {
							//trace("yes it has a sound");
							var thisSound = new Sound();
							thisSound.load(new URLRequest(react.@sound.toString()));
							try { 
								model.loadManager.add (thisSound);
							} catch (e:Error) {
								trace ( "An error occured while trying to load the sound.");
							}
							currentReactions.push(thisSound);
						}

						//trace(currentReactions);

					}

				}
				myStatementsSounds.push(currentReactions);
			}
			//trace("---------------");
			//trace(myStatementsSounds);


		}

		public function loadReact():void {

			/*reactMC= new MovieClip(); 
			var reactLoader = new Loader();
			
			reactLoader.load(new URLRequest("media/ReadyBackground.swf")); // could be good make this so it's not hard wired in 
			reactMC.addChild(reactLoader);
			
			//add that to the load 
			model.loadManager.add(reactLoader) 
			
			reactMC.x = 0;
			reactMC.y = 20; 
			myClip.addChild(reactMC); 
			
			reactLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, buildReact); 
			
			*/


		}

		public function buildReact(e:Event):void {


		}




		/**
		 * Puts the interaction back into the Ready static state 
		 * @parame - the event that his trigger this - it's often the timer 
		 */
		override public function Ready(e:Event):void {

			/*//trace("make sure the visuals are in the ready state"); 
			
			reactMC.visible = false;
			myText.htmlText = "";*/

		}
		/**
		 * Called after the model a got the click and dispatch an event 
		 * it grab what the current statement 
		 * @parame
		 */
		override public function React(e:Event):void {

			var currentStatement=model.state.getCurrentStatementNo();

			try {
				//trace("888888888888888 - about to close a sound %%%%%%");
				currentChannel.stop();
				//lastSound.close(); 
			} catch (e) {
				//trace(e);
			}

			//trace("The current statement is " + currentStatement);


			if (myStatementsSounds[currentStatement]) {

				currentSound=myStatementsSounds[currentStatement][0];
				currentChannel=currentSound.play();
				currentChannel.addEventListener(Event.SOUND_COMPLETE,onComplete);
				
				model.interactState.buildRespond();
				
				//trace("what it started playing the date is "+model.state.getCurrentStatementNo());  
				if (mode=="debug") {
					if (ReponseControl) {
						model.interactState.Respond();//NEXT - move the trigger of this to a view
					}
				}


			}



		}


		public function onComplete(e:Event):void {
			//trace("-------- Sounds has finished ------------");

			if (mode!="debug") {

				if (ReponseControl) {
					model.interactState.Respond();//NEXT - move the trigger of this to a view
				}
			}
		}

		override public function handleLoadedComplete(e:Event):void {
			/* //trace(" -------------------------- LOADED ----------------------");
			 addChild(myClip); 
			layout.SetScale(myClip, model.myData.imageData); //BUG - seem to stop the character working 
			*/

		}



	}

}