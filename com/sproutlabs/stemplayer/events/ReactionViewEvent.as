package com.sproutlabs.stemplayer.events
{
	import flash.events.Event;
	
	public class ReactionViewEvent extends Event
	{
		public static const LOADING_START:String = "loadingStart";
		
		private var _target:Object;
		public function ReactionViewEvent(type:String, target:Object)
		{
			_target = target;
			super(type);
		}
		public function get targetObject ():Object {
			return _target;
		}
	}
}