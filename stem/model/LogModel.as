package stem.model { 
	/**
	* 
	* @author Robin Petterd
	*/
		
	import flash.events.*; 
	import flash.utils.*; 

	/**
	 * A Class logs the statements and repsonse in array cores that have come a from a XML list. It's draws the scores from the response model 
	 *
	 */

	public class LogModel extends LogModelAbstract{
		
		// Constructor
		
		public function LogModel() {
			
		}
		
	
	/**
	 * Update is a conrete method that add what wish to log the Logs array 
	 * @param	ResponseLabel
	 */
	 public function update(ResponseLabel) { 
			
			
			//trace("The response was " + ResponseLabel);
			//trace(model.state.getCurrentStatementAsText()); 
			
			var Log:Array = new Array(); 
			var now:Date = new Date();

			Log.push(now.toTimeString());
			Log.push(model.state.getLastStatementAsText()); //TODO - BUG - Figure out why this not logging correctly
			//Log.push(model.state.getCurrentStatementAsText());
			Log.push(ResponseLabel); 
			Logs.push(Log); 
			
			trace("---------- Logs Objects being outputted---------"); 
			trace(Logs); 
			
		
		}
			

		
	}
	
}