package util { 
	
	import flash.display.*;
	
	/**
	*  A class to help with laying out movieclips
	* @author Robin Petter
	*/
	public class Layout 
	{
		
		public function Layout() 
		{
			
		}

		public function SetPosWithMargin(outsideMC,insideMC,marginPer):Boolean
		{

		//start with our width\
		var per:Number = outsideMC.width * (marginPer /100) ; 
		//trace("pppppppppppppp" + per + "==========="); 
		//top left 
		insideMC.x = per;
		insideMC.y = per; 
		//trace(outsideMC.width); 
		//top right/width 
		//trace(outsideMC.width - (per * 2));
	//	insideMC.width = 90; 
		insideMC.width = outsideMC.width - (per * 3); 
		
		return true; 
		
		
		}
		
		
		
		/**
		 * SetPos is takes some XML and use the x = something and y = something to position a movieclip 
		 * @param	mc - takes the Display hat are working with 
		 * @param	d - the XML data 
		 * @return
		 */
		public function SetPos(mc,d):Boolean
		{
		trace(mc);
				var success:Boolean  = false; 	
			//start with the x 			
			try 
				{
					mc.x = d.@x; 
					success = true;
					
				} catch (e:ArgumentError) {   trace("error in the xml file") }; 
			//now try and do the y 
			try 
				{
					mc.y = d.@y; 
					success = true;
					
				} catch (e:ArgumentError) {   trace("error in the xml file") }; 
				
				
			return success;   
		
		}
		
		/**
		 * SetPos is takes some XML and use the width = something and height = something to scale  a movieclip 
		 * @param	mc - takes the Display hat are working with 
		 * @param	d - the XML data 
		 * @return
		 */
			
		public function SetScale(mc,d:XMLList):Boolean
		{
		
			
				var success:Boolean  = false; 
		
			//start with the x 			
			try 
				{
						mc.width = d.@width; 

						success = true;
				
				} catch (e:ArgumentError) {   trace("error in the xml file") }; 
			//now try and do the y 
			try 
				{
						mc.height = d.@height; 
						success = true;
					
				} catch (e:ArgumentError) {   trace("error in the xml file") }; 
				
				
			return success;   
		
		}
		
		
		/**
		 * This takes two movieClips and puts on under the other. 
		 * 
		 * @param	top - this movie that is below 
		 * @param	under - the one below 
		 * @param	padding - a number that is padding for the space between two movieclips
		 */
		public function putUnder(top:MovieClip,under:MovieClip,padding:Number):void 
		{
			//trace("top.y = " + top.y); 
			//trace("top.height = " + top.height); 
			//trace("padding = " + padding); 
			
			under.y = top.y + top.height + padding; 
			under.x = top.x; 
			
			//trace("under y" + under.y); 
			//under.y = top.y + padding; 
		}
		
		/**
		 * This takes two movieClips and puts one to left of the  other. 
		 * 
		 * @param	right - this movie that is right 
		 * @param	left - the one left
		 * @param	padding - a number that is padding for the space between two movieclips
		 */
		public function putLeft(left:MovieClip,right:MovieClip,padding:Number):void 
		{	
			right.x = left.x + left.width + padding; 
			

		}
		
		/**
		 * This takes two movieClips and aligns the vertical centre of them 
		 * @param centered - the movie clip the that is the one we what other one to be centered with 
		 * @param tobecentered - the movie clip that needs to be centered. 
		 */
		
		public function verticalCenter(centered:MovieClip,tobecentered:MovieClip):void 
		{	
			tobecentered.x = (centered.width/2 + centered.x) - (tobecentered.width/2); 
		}
		
				
		/**
		 * This takes two movieClips and aligns the horizontal centre of them 
		 * @param centered - the movie clip the that is the one we what other one to be centered with 
		 * @param tobecentered - the movie clip that needs to be centered. 
		 */
		
		public function horizontalCenter(centered:MovieClip,tobecentered:MovieClip):void 
		{	
		
			tobecentered.y = (centered.height/2 + centered.y) - (tobecentered.height/2); 
		}
		
		
		
				/**
		 * This takes two movieClips and puts one to left of the  other. 
		 * 
		 * @param	right - this movie that is right 
		 * @param	left - the one left
		 * @param	padding - a number that is padding for the space between two movieclips
		 */
		public function putLeftCentered(left:MovieClip,right:MovieClip,padding:Number):void 
		{	
			right.x = left.x + left.width + padding; 
			

		}
		
		
		
	}
	
}