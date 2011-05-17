package com.sproutlabs.stemplayer.view.controls
{
	import com.sproutlabs.stemplayer.events.ReactionViewEvent;
	
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.text.AntiAliasType;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFormat;
	
	public class ReactionView extends Sprite {
		
		public static const TYPE_SIMPLE:String = "typeSimple";
		public static const TYPE_IMAGE:String = "typeImage";
		public static const TYPE_VIDEO:String = "typeVideo";
		public static const TYPE_SOUND:String = "typeSound";
		
		public static const ANCHOR_TOPLEFT:String = "anchorTopLeft";
		public static const ANCHOR_TOPRIGHT:String = "anchorTopRight";
		public static const ANCHOR_BOTTOMLEFT:String = "anchorBottomLeft";
		public static const ANCHOR_BOTTOMRIGHT:String = "anchorBottomRight";

		private var textField:TextField;
		private var fixedPadding:Number = 7;
		private var externalSource:String;
		
		public function ReactionView (source:String = "", anchor:String = ANCHOR_TOPLEFT, text:String = ""):void {			
			var fileExtensionPattern:RegExp = /(?!\/\w+\.)(\w+$)|(?!\/\w+\.)(\w+)(?=\?.*$)/g;
			var fileExtension:String = source.match(fileExtensionPattern)[0];
			switch (fileExtension) {
				case "swf":
				case "jpg":
					externalSource = source;
					this.type = TYPE_IMAGE;
					break;
				case "flv":
					externalSource = source;
					this.type = TYPE_VIDEO;
					break;
				default:					
					this.type = TYPE_SIMPLE;
					break;
			}
			
			switch (anchor) {
				case "topleft":
				default:
					this.anchor = ANCHOR_TOPLEFT;
					break;
				case "topright":
					this.anchor = ANCHOR_TOPRIGHT;
					break;
				case "bottomleft":
					this.anchor = ANCHOR_BOTTOMLEFT;							
					break;
				case "bottomright":
					this.anchor = ANCHOR_BOTTOMRIGHT;
					break;					
			}
			this.text = text;
			//
			if ( stage ) init (); 
			else addEventListener( Event.ADDED_TO_STAGE, init);
		}
		private function init ( e:Event =  null ):void {
			removeEventListener( Event.ADDED_TO_STAGE, init );
			//create elements;
			if ( !textField ) { 
				createTextField();
			}			
			setTextFieldText();
			
			switch ( type ) {
				case TYPE_SIMPLE:
				default:
					createSimpleBackground();
					break;
				case TYPE_IMAGE:
					createImageBackground();
					break;		
				case TYPE_VIDEO:
					createVideoBackground();
					break;
			}
			
			fixPosition ();
		}
		
		private var vcb:VideoChatBubble;
		
		private function createVideoBackground ():void { 
			if ( !vcb ) {
				vcb = new VideoChatBubble ();
			}
			
			addChild ( vcb );
			
			if ( textField ) {
				swapChildren( vcb, textField );
			}
			vcb.source = externalSource;
			vcb.addEventListener( VideoChatBubble.VIDEO_PROGRESS, onVideoProgress );
			//dispatch the object that is loading
			dispatchEvent( new ReactionViewEvent (ReactionViewEvent.LOADING_START, vcb) );
		}
		
		private function onVideoProgress ( e:Event ):void {			
			vcb.removeEventListener(VideoChatBubble.VIDEO_PROGRESS, onVideoProgress );
			fixPosition();
		}
		
		private var ld:Loader;
		
		private function createImageBackground ():void {
			
			if (!ld) {
				ld = new Loader();
			}
			
			ld.contentLoaderInfo.addEventListener (Event.COMPLETE, onLoaderComplete);
			ld.load( new URLRequest (externalSource));
			//dispatch the object that is loading
			dispatchEvent( new ReactionViewEvent (ReactionViewEvent.LOADING_START, ld) );
		}
		private function onLoaderComplete (e:Event):void {
			addChild( ld );
			if ( textField ){ 
				swapChildren( textField, ld );
			}
			fixPosition();
		}
		private var simpleBG:Sprite;
		private function createSimpleBackground ():void
		{
			if (!simpleBG) {
				simpleBG = new Sprite ();				
				simpleBG.graphics.beginFill( 0xffffff, 1 );
				simpleBG.graphics.drawRoundRect( 0, 0, this.width + (fixedPadding*2), this.height + (fixedPadding*2), 20, 20);
				simpleBG.graphics.endFill();				
				addChild ( simpleBG );
				if ( textField ){ 
					swapChildren( textField, simpleBG );
				}
			}		
		}
		private function fixPosition ():void
		{ 
			var w:Number = 0;
			var h:Number = 0;
			switch ( type ) {
				case TYPE_SIMPLE:
					w = this.width;
					h = this.height;
					break;
				case TYPE_IMAGE:
					if ( ld && ld.contentLoaderInfo ) {
						try { 
							w = ld.contentLoaderInfo.width;
							h = ld.contentLoaderInfo.height;
							this.visible = true;
						} catch (e:Error) {
							w = 0;
							h = 0;
							this.visible = false;
						}
					}
					break;
				case TYPE_VIDEO:
					w = this.width;
					h = this.height;
					break;
			}
			
			switch ( anchor ) {
				case ANCHOR_TOPLEFT:
				default:
					this.x = 0;
					this.y = 0;
					break;
				case ANCHOR_TOPRIGHT:
					this.x = 0 - w;
					this.y = 0;
					break;
				case ANCHOR_BOTTOMLEFT:
					this.x = 0;
					this.y = 0 - h;
					break;
				case ANCHOR_BOTTOMRIGHT:
					this.x = 0 - w;
					this.y = 0 - h;
					break;
			}
		}
		
		private function setTextFieldText ():void {			
			textField.htmlText = text;
		}
		
		private function createTextField ():void {
			textField = new TextField();			
			textField.selectable = false;			
			
			var tf:TextFormat = new TextFormat();
			tf.font = "Arial";			
			tf.size = 12;
			
			textField.antiAliasType = AntiAliasType.ADVANCED;
			textField.defaultTextFormat = tf;
			
			textField.autoSize = TextFieldAutoSize.LEFT;
			textField.wordWrap = true;
			textField.width = 250;
			textField.height = 150;
			
			textField.x = fixedPadding;
			textField.y = fixedPadding;
			addChild(textField);
			
			/*
			textField.x = padding;
			textField.y = padding;
			textField.width = minWidth - (padding*2);
			textField.height = minHeight - (padding*2);
			*/
		}
		
		private var _type:String;		
		public function set type ( s:String ):void {
			_type = s;	
		}		
		public function get type ():String {
			return _type;
		}
		
		private var _anchor:String;		
		public function set anchor (s:String):void {
			_anchor = s;
		}
		
		public function get anchor ():String { 
			return _anchor;
		}
		
		private var _text:String;
		public function set text (s:String):void
		{
			_text = s;
		}
		public function get text ():String {
			return _text;
		}
		public function clear ():void
		{
			switch ( type ) {
				case TYPE_IMAGE:
					if ( ld ) {
						ld = null;
					}
					break;
				case TYPE_VIDEO:
					if ( vcb ) {
						vcb.clear();
						vcb = null;
					}
					break;
			}	
		}
	}
}