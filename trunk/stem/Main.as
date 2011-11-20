package stem {	import fl.controls.List;		import flash.display.MovieClip;	import flash.events.*;	import flash.utils.*;		import stem.model.*;	import stem.views.*;
		/**
	 *  
	 * Deprecated. Please use Stem.as instead.
	 * 
	 */	
	public class Main extends MovieClip {		// Constructor		public function Main() {						if ( stage ) init ();			else addEventListener(Event.ADDED_TO_STAGE, init);		}						private function init ( e:Event = null ):void		{									var parameters:Object = this.loaderInfo.parameters;			var myDataFile:String = null;			var defaultStatement:String = "";						try {							myDataFile = parameters["file"];			} catch(errObject:Error) {					}						try { 				//currentStatement parameter;				defaultStatement = parameters["currentStatement"];			} catch (e:Error) {							}			//checked to see if we actuall have some data.  			if(myDataFile == null) {				myDataFile = "data/stem.xml";			}						if (!defaultStatement) { 				defaultStatement = "0";			}						new View(new Model(myDataFile, defaultStatement), this.stage, this);					}	} 	} 