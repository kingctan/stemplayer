package stem.model { 
	/**
	* 
	* @author Robin Petterd
	*/
		
	import flash.events.*; 
	import flash.utils.*; 

	/**
	 * A Class for stores cores that have come a from a XML list. It's draws the scores from the response model 
	 * works with a object this is some like 
	 * currentScores[factor1] = 10; 
	 * currentScores[factor2] = 14;
	 * MyScore = 24; 
	 */

	public class ScoreModel extends EventDispatcher {
		
		private var model; 
		private var factors;
		
		private var myScore:Number = 0; // The running total of the score 
		private var myFactorsScores:Object = new Object(); // This is where we keep the actual scores 
		public var myLog:LogModel; 
		
		// Constructor
		
		public function ScoreModel(m,f:XMLList) {
			
			this.model = m; 
			this.factors = f; 
			
			myLog = new LogModel();
			myLog.init(this.model); 
			setupFactorScores(); 
		}
	

		/**
		 * Set up the Factors from the XML and set up object. 
		 */
		
		private function setupFactorScores():void //moved 
		{
			//trace("The lenght of factors is" + Factors.factor.length()); 		
			for (var i:Number = 0; i <factors.factor.length(); i++) {
				myFactorsScores[factors.factor[i]] = 0; 				 
			}
		}
	
	public function UpDataScores(e:Event) { // expecting this to come from the responseModel 
	
		trace("------UPDATING SCORES------")
		
		//Get the scores to start with 
		var currentScores:Object = e.currentTarget.reportScores(); 
		
		//myLog.update(e.currentTarget.selectedItem.label); 
	
		//Total up the score
		myScore += currentScores.Score; 
		
		myLog.update(currentScores.MyLabel);
		//trace(myScore);
		
		
		
		//Now total up the factors.
		
			for (var i:Number = 0; i <factors.factor.length(); i++) {
			
				trace("Updating Scores for this response " + factors.factor[i] + " the score is " + currentScores[factors.factor[i]]); 
				//now add that our data structure 
				myFactorsScores[factors.factor[i]] = myFactorsScores[factors.factor[i]] + currentScores[factors.factor[i]]; 
				trace(myFactorsScores[factors.factor[i]]); 
			}
			
		
	}
	
	public function get Score():Number { return myScore; }
	
	public function get FactorsScores():Object { return myFactorsScores; } //what get called by the score view

	public function get MessageFinalScore():Number {
		//trace(model);
		return model.myData.getMessageFinalScore;
	
		}
	

		
		public function get getMessageXML():XMLList { 
			return model.myData.getMessageXML;
		}
		
		
		
		public function get MessageFactorDisplay():Boolean { 
			return model.myData.getMessageFactorDisplay;
		}
		
		public function get Factors() { return factors; }
		
		public function get MessagesPadding():Number {
			return model.myData.getMessagesPadding; 
		}
		
		
		
	}
	
}