
package stem { 
	
	import flash.display.MovieClip; 
	import flash.events.*; 
	import flash.utils.*; 
	
	import stem.model.*;
	import stem.views.*;	
	
	public class Main extends MovieClip {
	

		
		// Constructor	
		public function Main() {	
		
			trace ("--------------Start---------------"); 
			
			var model = new Model(); 
			var view = new View(model, this.stage); 
			

		}
		
		
		

		
		

		
		
		

		
	} 

} 