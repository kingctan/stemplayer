package stem.model 
{
	
	/**
	* This is somewhere to hold the events that are shared between class. 
	* @author Robin Petterd
	*/
	public class InteractionEvents 
	{
		//This are more about the MVC 
		public const INTERACTION_READY = 1;
		public const MODEL_STATE_CHANGED = 2;
		public const MODEL_STATE_CHANGING = 3; 
		public static const EXTERNAL_LOADING:String = "externalLoading";
		
		//This is our actual states 
		public const STATE_REACT = 4;
		public const STATE_READY = 5;
		public const STATE_RESPONDING = 6; 
		
		public const SCORE_UPDATE = 7; 
		public const SCORE_DISPLAY = 8; 
		public const SCORE_DISPLAY_UPDATE = 9; 

		public const HELP_UPDATE = 10; 

		public function InteractionEvents() {
			////trace("building the events worked"); 
		}
	}
	
}