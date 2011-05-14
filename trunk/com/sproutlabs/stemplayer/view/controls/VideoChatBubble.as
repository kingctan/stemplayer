package com.sproutlabs.stemplayer.view.controls
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.NetStatusEvent;
	import flash.events.SecurityErrorEvent;
	import flash.media.Video;
	import flash.net.NetConnection;
	import flash.net.NetStream;
	
	public class VideoChatBubble extends Sprite
	{
		public static const VIDEO_PROGRESS:String = "videoProgress";
		
		private var conn:NetConnection;
		private var stream:NetStream;
		
		public function VideoChatBubble()
		{
			conn = new NetConnection();
			conn.addEventListener(NetStatusEvent.NET_STATUS, handleNetStatusEvent);
			conn.addEventListener(SecurityErrorEvent.SECURITY_ERROR, handleSecurityError);
			if ( source ) {
				conn.connect ( null );
			}
			if ( stage ) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init ( e:Event = null ):void 
		{
			removeEventListener( Event.ADDED_TO_STAGE, init );
		}
		private function handleNetStatusEvent (e:NetStatusEvent):void {
			switch (e.info.code) {
				case "NetConnection.Connect.Success":
					connectStream();
					break;
				case "NetStream.Play.StreamNotFound":
					trace ( "Stream not found" );
					//throw an event here					
					break;
				default:
					trace ( e.info.code );
					break;
			}
		}
		
		private var _bytesLoaded:Number;
		private var _bytesTotal:Number;
		/**
		 *  
		 * @param e
		 * 
		 */		
		private function progressCheck (e:Event):void {
			_bytesLoaded = stream.bytesLoaded;
			_bytesTotal = stream.bytesTotal;			
			if ( _bytesLoaded == _bytesTotal ) { 
				removeEventListener(Event.ENTER_FRAME, progressCheck );
				//dispatch complete;
				dispatchEvent (new Event ( Event.COMPLETE ) ) ;
			} else {
				dispatchEvent( new Event ( VIDEO_PROGRESS ) );
			}
		}
		/**
		 * Read-only 
		 * @return 
		 * 
		 */		
		public function get bytesLoaded ():Number {
			return _bytesLoaded;			
		}
		
		/**
		 * Read-only 
		 * @return 
		 * 
		 */		
		public function get bytesTotal ():Number {
			return _bytesTotal;
		}
		
		private function connectStream ():void
		{
			addEventListener(Event.ENTER_FRAME, progressCheck);
			
			stream = new NetStream (conn);
			stream.addEventListener (NetStatusEvent.NET_STATUS, handleNetStatusEvent);			
			stream.client = new CustomClient();
			stream.bufferTime = 3;
			var video:Video = new Video ();
			video.attachNetStream( stream );
			stream.play( source );
			addChild ( video );			
		}
		
		private function handleSecurityError (e:SecurityErrorEvent ):void {
			
		}
		private var _source:String;
		public function set source (s:String):void
		{
			_source = s;
			if ( conn ) {
				conn.connect( null );
			}
		}
		public function get source ():String {
			return _source;
		}
		public function clear ():void {
			if (hasEventListener(Event.ENTER_FRAME) ) {
				removeEventListener(Event.ENTER_FRAME, progressCheck );				
			}	
			stream.close();
			conn.close();
		}
	}
}

class CustomClient {
	public function onMetaData (info:Object):void {
		trace ( info );
	}
	public function onCuePoint (info:Object):void {
		trace ( info );
	}
	public function onXMPData (info:Object):void {
		trace ( info );
	}
}
	
