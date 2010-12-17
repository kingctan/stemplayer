package stem.views{

	import fl.core.UIComponent;
	import flash.display.*;
	import flash.net.*;
	import flash.events.*;
	import flash.text.*;
	import flash.media.*;
	
	import util.*;

	import flash.media.Sound;
	import flash.media.SoundChannel;

	import flash.net.URLRequest;
	


	/**
	* ...
	* @author Robin Petterd
	*/
	public class VideoInteractionViewState extends InteractionViewStateAbstract implements ViewStateI {

		private var myStatementsSounds:Array;
		
		private var myStatementsVideos:Array;
		private var nc:NetConnection;
		private var ns:NetStream;
		
		public var myClip:MovieClip;

		public var currentSound:Sound;
		public var currentVideo:Video;
		
		private var _currentDuration:uint; 


		public var currentChannel:SoundChannel;

		private var mode:String="debugNO";//when this set to debug you can skip thru the choices quickly  
		
		public function VideoInteractionViewState (m,rc):void {
			trace("######## Video InteractionViewState has been made");
			this.setup(m,rc);//start the loading 

		}


		override public function load():void {

			//buildBackground(); 
			buildReady();
			//loadReact();
		}

		public function buildReady() {
			trace("###### Building the Video's");

			myClip = new MovieClip(); 
			addChild(myClip);

			myStatementsVideos = new Array ();
			//currentVideo = new Sound();
			
			currentVideo = new Video();
			
			myClip.addChild(currentVideo);
			//myClip.visible = false;

			 
			nc = new NetConnection();
			nc.connect(null);
			 
			ns = new NetStream(nc);
			 
			currentVideo.attachNetStream(ns);
			//ns.bufferTime = 0;
			
			//now we need to find all the video
			//loop thru all the statements find all the video and put them into multi dimensional array that reflects the
			//statement data structure. 
			var i:Number=0;

			while (i < model.myData.getStatementLength()) {

				//trace(model.myData.getStatementAtasXML(i)); 
				var statement:XML=model.myData.getStatementAtasXML(i);
				i++;

				//trace(statement);

				for each (var bit:XML in statement) {
					var currentReactions:Array = new Array();

					for each (var react:XML in bit.reaction) {
						//trace("search for the video's");	
						//trace(react.@video.toString());

						if (react.@video.toString()!="") {
							trace("yes it has a video");
							currentReactions.push(react.@video.toString());
						}

						//trace(currentReactions);

					}

				}
				myStatementsVideos.push(currentReactions);
			}
			//trace("---------------");
			//trace(myStatementsVideos);


		}

		public function loadReact():void {

			
	

		}

		public function buildReact(e:Event):void {


		}




		/**
		 * Puts the interaction back into the Ready static state 
		 * @parame - the event that his trigger this - it's often the timer 
		 */
		override public function Ready(e:Event):void {

			/*trace("make sure the visuals are in the ready state"); 
			
			reactMC.visible = false;
			myText.htmlText = "";*/

		}
		/**
		 * Called after the model a got the click and dispatch an event 
		 * it grab what the current statement 
		 * @parame
		 */
		override public function React(e:Event):void {

			var currentStatement=model.state.getCurrentStatementNo();

			if (myStatementsVideos[currentStatement]) {
				
				var nextVideo:String = myStatementsVideos[currentStatement]; 
				
				//myClip.visible = false;
				
				//currentVideo.clear();// BUG - WORKAROUND if the video moves position and this flash this is a way around that.
				ns.play(nextVideo);
			
				ns.addEventListener(NetStatusEvent.NET_STATUS, onStatus); //set the height and width to the encoded width once the actual video is loaded. 
				//That function also watch to see if the video has finished playing '
				
				var client:Object = new Object();
				
				client.onMetaData = onMetaData; 
				ns.client = client; 
				
				model.interactState.buildRespond(); 
				


			}
		


		}
		
		private function onMetaData(data:Object) {
			//trace(data.duration);
			_currentDuration = data.duration; 
		}
		
		private function onStatus(event:NetStatusEvent):void {
			//trace(event);
			
			/*for(var val:* in event.info){
				trace('   [' + typeof(event.info[val]) + '] ' + val + ' => ' + event.info[val]);
			}*/

			
			if(event.info.code == "NetStream.Buffer.Full") {
				trace("got the buffer full status");
			}
			
			//trace(ns.time);
			//if (Math.round(ns.bufferLength) > Math.round(ns.bufferTime)) {//this could be a bit of a problem 
			if(event.info.code == "NetStream.Buffer.Full") {
			//if ((ns.time) > (ns.bufferTime)) {//this could be a bit of a problem 

				trace("now it's loaded");
				//resize it the encoded size 
				setPosAndWidth();
			
			}
			//trace (_currentDuration); 
			
			if(Math.round(ns.time) > Math.round(_currentDuration)) {
				//trace("video has finished playing"); 
				onComplete();
			}
			
			//trace(ns.time);
			//trace("Status event change ..."); 
		}
		
		private function setPosAndWidth():void {
			
			//base the height and width on the encoded size
			if( currentVideo.videoWidth > 0 && currentVideo.width != currentVideo.videoWidth ) {
					currentVideo.width = currentVideo.videoWidth; 
					currentVideo.height= currentVideo.videoHeight;
				} 
				
				var currentStatement=model.state.getCurrentStatementNo();
				var currentXML = model.myData.getStatementAtasXML(currentStatement);
			
				layout.SetPos(myClip,currentXML); // Set the pos based on the current statement xml
				//myClip.visible = true;//make sure it can be seen

		} 
		
		public function onComplete():void {
			trace("-------- Video has finished playing ------------");
				
			if (mode!="debug") {

				if (ReponseControl) {
					model.interactState.Respond();//NEXT - move the trigger of this to a view
				}
			}
		}

		override public function handleLoadedComplete(e:Event):void {
			/* trace(" -------------------------- LOADED ----------------------");
			 addChild(myClip); 
			layout.SetScale(myClip, model.myData.imageData); //BUG - seem to stop the character working 
			*/

		}



	}

}