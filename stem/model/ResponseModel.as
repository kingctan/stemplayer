﻿package stem.model {		import fl.data.DataProvider;	import flash.events.*;	public class ResponseModel extends EventDispatcher {				private var Factors:XMLList; 				 	private var responses:XMLList; 							private var MyScore:Number = 0; 	private var FactorScores:Array = new Array(); 		public var myEvents = new InteractionEvents();	public var MyLabel:String ="";	private var model;			public function ResponseModel(m) {			model = m; 			trace("just made a reponse list model"); }		public function init() {						buildFactorScores();}public function buildFactorScores() {	//intialise the FactorScores	trace("there is " + Factors.factor.length() + " number of factors"); 	for (var i:Number = 0; i < Factors.factor.length(); i++) {		 FactorScores[i] = 0; 	}}public function buildChoices ():Array {		var CurrentChoices:Array = new Array (); 		//Loop over each of our choices 	for (var c:Number = 0; c < Responses.choice.length(); c++) {										//now loop each of the factors and grab the score each of the factors.				//trace("The scores are " + Responses.choice[c].scores.factor.length()); 				try { //It's in a try loop in case the data is on correc 					var CurrentFactors:Array = new Array (); 			for (var i:Number = 0; i < Responses.choice[c].scores.factor.length(); i++) {				trace(Responses.choice[c].scores.factor[i].@score); 					CurrentFactors.push(Number(Responses.choice[c].scores.factor[i].@score)); 			} 		}		catch (e:ArgumentError) {  		trace(e); // output: ArgumentError: Error #2024: An object may not be added as a child of itself.		}				///trace("the branch is " + Responses.choice[c].@branch);		//Now add that our list of current factors 		CurrentChoices.push({label: Responses.choice[c].statement, data:CurrentFactors,branch:Responses.choice[c].@branch}); 						//trace(Responses.choice[i]); 	}		return CurrentChoices} 	public function updateChoice(event:Event) {		trace("a choices has been made"); 		//	trace(event.target.selectedItem.label);		for (var i:Number = 0; i < Factors.factor.length(); i++) {			trace( Factors.factor[i] + " = " + event.target.selectedItem.data[i]); 			MyScore += event.target.selectedItem.data[i]; 			MyLabel = event.target.selectedItem.label;			FactorScores[i] += event.target.selectedItem.data[i]; 					}				//now see if have branch 				if ((event.target.selectedItem.branch > 0) && (event.target.selectedItem.branch != "end")) {//BUG - if the branch is 0 it will not work 					trace("######### the branch is " + event.target.selectedItem.branch); 			model.nextStatement = event.target.selectedItem.branch[0]; 						} else if (event.target.selectedItem.branch != "end") {								trace("no branch was found"); 				model.nextStatement = null; 			} else { 				model.nextStatement = event.target.selectedItem.branch[0]; 			}				/* OLD based on array pos 		if ((event.target.selectedItem.branch > 0) && (event.target.selectedItem.branch != "end")) {//BUG - if the branch is 0 it will not work 					trace("######### the branch is " + event.target.selectedItem.branch); 			model.nextStatement = event.target.selectedItem.branch[0]; 						} else if (event.target.selectedItem.branch != "end") {								trace("no branch was found"); 				model.nextStatement = null; 			} else { 				model.nextStatement = event.target.selectedItem.branch[0]; 			}								*/ 				//trace(			dispatchEvent(new Event(myEvents.SCORE_UPDATE)); 	dispatchEvent(new Event(myEvents.SCORE_DISPLAY_UPDATE)); //HACK	dispatchEvent(new Event("killme"));						 	}	public function reportScores():Object{ 		var responseScores = new Object(); 		responseScores.Score = MyScore; 				trace("The total score for this response is " + MyScore); 					for (var i:Number = 0; i <Factors.factor.length(); i++) {				trace("For this response " + Factors.factor[i] + " the score is " + FactorScores[i]); 				//now add that our data structure 				responseScores[Factors.factor[i]] = FactorScores[i]; 			}		responseScores.MyLabel = MyLabel; 		return responseScores; 	}		public function set setFactors(x:XMLList){		//trace(x); 		Factors = x; 	}			public function set setResponses(x:XMLList){		//trace(x); 		Responses = x; 	}		public function get Responses():XMLList { return responses; }	public function set Responses(r) { responses = r;} 				}}