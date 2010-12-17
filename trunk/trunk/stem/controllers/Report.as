package stem.controllers 

{
	import flash.display.*;
	import stem.*;

	
	/**
	* This is the main report controller - that then actually get extend/decorated to actually be used
	* @author Robin Petterd
	*/
	public class Report 
	{
		public var ScoreModel;
	
		public function Report () {
			trace("just built the Report object"); 
			
			
		}
			
	
		public function init(sm) {
		 ScoreModel = sm; 
			}
				
			public function sendReport() {
		
			
				trace("report is about to be sent"); 
				
			}
			
			public function get Score() {
				return ScoreModel.Score; 
			}
			
			public function get FactorLength()
			{ 
				return ScoreModel.Factors.factor.length();

			}
			public function get Factors() {
				return ScoreModel.Factors; 
			}
			public function get FactorScores() 
			{ 
				return ScoreModel.FactorsScores;//returns the factors scores as an object 
			}
		
			public function get Logs () 
			{
				return ScoreModel.myLog.Logs; 
			}
			public function get tabSeperatedLogs():String {
			
				//BUG - if this longer than 4096 characters it will not be sent
				trace("the logs are --------------------"); 
				//Loop of the actual Log entries 
				var logReport:String = ""; 
				
				for (var i:int = 0; i < this.Logs.length; i++ ) {
					
					for (var a:int = 0; a < Logs[i].length; a++ ) {
						
						trace(Logs[i][a]);
						logReport = logReport + Logs[i][a];
						logReport = logReport + "\t"; 
						
					}
					logReport = logReport + ";"; 
				}
									
				return logReport 
				}
			
	}
}
	
