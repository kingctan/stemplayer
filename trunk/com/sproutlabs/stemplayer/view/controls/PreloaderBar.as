package com.sproutlabs.stemplayer.view.controls
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.setTimeout;
	
	public class PreloaderBar extends Sprite
	{
		public function PreloaderBar()
		{
			if ( stage ) init ();
			else addEventListener (Event.ADDED_TO_STAGE, init);
		}
		
		private function init ( e:Event = null ):void
		{ 
			removeEventListener( Event.ADDED_TO_STAGE, init);
			//
			preloaderBodyClip = new preloaderBody();			 
			preloaderBarClip = new preloaderBar ();
			
			preloaderBarClip.width = 0;
			
			addChild ( preloaderBodyClip );			
			addChild ( preloaderBarClip );
			if (_width) { 
				preloaderBodyClip.width = _width;
			}
			if (_height) { 
				preloaderBodyClip.height = _height;
				preloaderBarClip.height = _height;
			}			
		}
		
		private var _width:Number;
		private var _height:Number;
		
		private var preloaderBodyClip:DisplayObject;
		private var preloaderBarClip:DisplayObject;
		
		[Embed(source="/assets/stem-skin.swf", symbol="PreloaderSkin_Body")]		
		private var preloaderBody:Class;
		
		[Embed(source="/assets/stem-skin.swf", symbol="PreloaderSkin_Bar")]
		private var preloaderBar:Class;
		
		/**
		 * Set the dimension of the preloader component. 
		 * @param width
		 * @param height
		 * 
		 */		
		public function setDimensions ( width:Number, height:Number ):void {
			_width = width;
			_height = height;
			if (stage) {
				preloaderBodyClip.width = _width;
				preloaderBodyClip.height = _height;
			}
		}
		private var _percentile:Number;
		public function set percentile ( n:Number ):void
		{	
			_percentile = n;	
			if (stage) {
				// _width 100%;
				preloaderBarClip.width = _width * (n * .01);
			}
		}
		public function get percentile ():Number 
		{
			return _percentile;
		}
	}
}