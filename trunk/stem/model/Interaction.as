
package stem.model{
	/**
	* This is the model for the social interactions that shared between all the types of interaction media 
	* @author Robin Petterd
	*/

	import fl.controls.TextArea;
	import flash.events.*;
	import flash.utils.*;
	import helper.Help;



	public class Interaction extends EventDispatcher implements InteractionI {

		public var myEvents = new InteractionEvents();
		public var myState;
		private var myTimer:Timer;

		private var model;
		private var _myType:String;
		public var Statements:Array = new Array();
		public var responses:ResponseModel;
		public var myScore:ScoreModel;
		public var myHelp = new Help();
		public var reports:Array = new Array();// an array of the reports the loop thru. 
		private var CurrentStatement=-1;//BUG - a small one logically this should be 0 but to get to work it has be 0
		private var _nextStatement=null;


		// Constructor

		public function Interaction(type:String,m) {

			_myType=type;
			this.model=m;
			setupStatements();

			myScore=new ScoreModel(model,model.myData.getFactors);

			myState=myEvents.STATE_REACT;// the default state of this 
			myTimer=new Timer(10000);//TODO - 10- more this out the be something that can be changed in the xml
			myTimer.addEventListener(TimerEvent.TIMER, this.Ready);
			myTimer.start();

			trace("n---------just created the interaction model");
			//now we need to dispatch and event so the view can build that right sort of Interaction view 
		}



		public function React(e:Event):void {
			//This is where the interaction Reacts to the user click 
			trace("----------back to React -----------------");

			// trace("-- Current Statement is " + CurrentStatement); 
			//trace("the lenghth is " + Statements.length); 
			if (myState==myEvents.STATE_REACT) {

				trace("yes we are Reacting");

				myTimer.start();

				//check to make sure the branch should be the end 
				//var current:XML = model.myData.getStatementAtasXML(CurrentStatement);
				//trace(current.@type);
				trace("----------the next statement is ----------- " + nextStatement);

				if (nextStatement=="end") {
					trace("################ SHOULD END UP ##################");
					this.End(e);
				} else {
					//it's not ending up so make sure that not the max 
					trace("Current Statement lenght is " + (int(CurrentStatement+1))); 
					var i:int = int(CurrentStatement+1);  
					if ( CurrentStatement < Statements.length) {
						trace("we are not the end of Statements yets");
						//This is where the branching stuff comes in 
						if (nextStatement==null) {
							//a nextStatement has been set so just move on
							CurrentStatement++;
							nextStatement=null;

						} else {
							// now make a CurrentStatement actually be the next statement 
							trace("the next statement should be " + nextStatement);
							CurrentStatement=nextStatement;
							nextStatement=null;
							///CurrentStatement++; 
						}

						trace("---- decisions about statements have been made");

						//Update the  - TODO - help turned off
						myHelp.setCurrentData=model.myData.getStatementAtasXML(CurrentStatement);
	
						
						//trace(current.@type);
						//if (current.@type == "end") {
						//trace("################ SHOULD END UP ##################"); 
						//this.End(e);
						//}

						dispatchEvent(new Event(myEvents.STATE_REACT));// so the view can be changed 
						//send a message to so 
						dispatchEvent(new Event(myEvents.HELP_UPDATE));// so the view can be changed 
						
						/* More this to the actual view because to each view type has a  different behaviour.  
						if (model.myData.ResponseExists(CurrentStatement)) {

							Respond(); //NEXT - move the trigger of this to a view
						}
						*/


					} else {
						
						trace("$$$$$$ - here from some reason $$$$$$"); 
						
						//this.End(e);//THis what I just commented out I THINK THIS IT. 
					}

					// trace("-- Current Statement at the end is " + CurrentStatement); 

				}
			}

		}

		public function End(e:Event):void {
			trace("at the end of statements or an end statment has been found");
			//This is where we are ending up. 
			//now it's time to make sure the scores are shown 
			dispatchEvent(new Event(myEvents.SCORE_DISPLAY));
			//now it also to time to see the reports 
			sendReports(e);
			this.Ready(e);
		}

		public function buildRespond():void {


			trace("----------building the responding");
			responses=new ResponseModel(this);
			responses.setFactors=model.myData.getFactors;
			responses.setResponses=model.myData.getResponses(CurrentStatement);

			
		}
		
		
		public function Respond():void {

			myState=myEvents.STATE_RESPONDING;//change the state 

			trace("----------get the responses actually happening be responding");
		

			responses.init();

			dispatchEvent(new Event(myEvents.STATE_RESPONDING));// broadcast the response state so the view can pick it up 
			responses.addEventListener(myEvents.SCORE_UPDATE,myScore.UpDataScores);//now trigger an event to update the scorees 
			
			
			responses.addEventListener("killme", killResponse);
		}



		public function killResponse(e:Event):void {

			trace("response should die");

			//myClip.removeChild(this.responses); 
			//responses.die(); 
			responses=null;

			myState=myEvents.STATE_REACT;
			React(e);
		}


		/**
		 * Set up system so that it's ready to take input 
		 * @parame
		 */
		public function Ready(e:Event = null):void {

			//Get the interaction back to point where it's ready to start over 
			//trace("about to reset"); 
			trace(model.state);
			trace("----------------- about to get the interaction Ready again");

			if (myState==myEvents.STATE_REACT) {
				myTimer.stop();
				CurrentStatement=0;
				nextStatement=null;

				//Broadcast this out so the view can pick it up 
				dispatchEvent(new Event(myEvents.STATE_READY));

			} else {
				myTimer.stop();
			}
		}

		/**
		 * This loops thru the reports and get all them be send. 
		 * @parame
		 */

		public function sendReports(e:Event) {

			trace(reports);


			for (var report in reports) {

				reports[report].sendReport();
			}

		}

		/**
		 * Set up the statements/actions in an array 
		 */

		public function setupStatements():void {
			var i:Number;

			for (i=0; i < model.myData.getStatementLength(); i++) {
				Statements.push(model.myData.getStatementAt(i));
				//Statements.push("test");
			}

		}

		/**
		 * Return the current statemetn as text - TODO - 3 re think this so that could work media other than text 
		 * @return
		 */
		public function getCurrentStatementAsText():String {
			//trace( Statements[CurrentStatement]);
			return Statements[CurrentStatement];
		}


		/**
		 * Return the last statement as text - TODO - 3 re think this so that could work media other than text 
		 * @return
		 */
		public function getLastStatementAsText():String {
			//trace( Statements[CurrentStatement]);
			return Statements[CurrentStatement-1];
		}




		public function getCurrentStatementNo():Number {
			return CurrentStatement;
		}
		/**
		 * Returns what type of interaction this so the view can be built
		 */

		public function getMyType():String {
			trace("n-trying to get the type out of the interaction");
			return _myType;
		}

		public function get nextStatement() {

			return _nextStatement;
		}

		public function set nextStatement(value):void {
			trace("---- nextStatement being set ---");
			_nextStatement=value;
		}


	}

}