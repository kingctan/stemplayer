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

	public class LogModelAbstract {
		
		public var model; 
		public var Logs:Array = new Array(); 
		
		// Constructor
		
		public function init(m) 
		{
		 this.model = m; 

		}
		

		
	}
	
}