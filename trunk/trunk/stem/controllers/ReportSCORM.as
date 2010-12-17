package stem.controllers 

{
	import fl.accessibility.DataGridAccImpl;
	import flash.display.*;
	import stem.*;
	import pipwerks.SCORM; 

	
	/**
	* This is the main report SCORM reporting object
	* @author Robin Petterd
	*/
	public class ReportSCORM extends Report 
	{
	
	var lessonStatus:String;
	var lmsConnected:Boolean;
	var success:Boolean;


		public function ReportSCORM () {
			trace("just built the SCORM Report object"); 
		
		}

						
		override public function sendReport() {
			
			trace("report is to send a SCORM report sent"); 
				
				try {	
					var scorm:SCORM = new SCORM();
				} catch (e:Error) { }

				//try to connect in 
				try {
					lmsConnected = scorm.connect();
				} catch (e:Error) { }
				
				//success = scorm.set("cmi.core.score.raw", "100");
				//scorm.save();

			if(lmsConnected){

									
				sendScore(scorm); 
				sendFactors(scorm);
				sendRecordasText(scorm); 
				
				//disconnect from the lmms 
				scorm.save(); 
				scorm.disconnect();
				lmsConnected = false
	
				} else {

					 trace("Could not connect to LMS.");

				}
	
  
			
			}
			
			private function sendRecordasText(scorm):void
			{
			 var logs:String = this.tabSeperatedLogs;
		
			 try { success = scorm.set("cmi.comments", logs);
					} catch (e:Error) {}
				
			
			}
			
			
			private function sendScore(scorm):void
			{
					 //Must tell LMS course has not been completed yet.
					 trace("the score is " + this.Score); 
					//success = scorm.set("cmi.core.score.raw", this.Score);
					
					try { success = scorm.set("cmi.core.score.raw", this.Score)
					} catch (e:Error){}
			}
			
			private function sendFactors(scorm):void
			{
			 
				
				try { 
				
					var myFactorsScores = this.FactorScores; 
			var myFactors = this.Factors; 
			
			//trace (myFactorsScores); 
			//trace (myFactors); 
			
						
			for (var i:Number = 0; i < myFactors.factor.length(); i++) {
							
					trace("Send Scores " + myFactors.factor[i] + " the score is " + myFactorsScores[myFactors.factor[i]]); 

									
					var theFactor:String = myFactors.factor[i]; 
					theFactor = theFactor.replace(" ", "_"); 
							
					success = scorm.set("cmi.objectives." + i + ".id", theFactor);
					success = scorm.set("cmi.objectives." + i + ".score.raw", myFactorsScores[myFactors.factor[i]]); 
			}
				 } 
			 catch (e:Error) {} 
			}
	}
}
	
