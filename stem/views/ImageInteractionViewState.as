﻿package stem.views { 		import fl.core.UIComponent;		import flash.display.*;	import flash.events.*;	import flash.net.*;	import flash.text.*;	import flash.utils.*;		import util.*;		/**	* ...	* @author Robin Petterd	*/	public class ImageInteractionViewState extends InteractionViewStateAbstract implements ViewStateI {				public var visual:Loader; 		public var myClip:MovieClip;		public var myText:TextField;		private var reactMC:MovieClip;				private var _lastimage;		private var _myStatementsImages:Array;		private var _currentImage:Loader;		private var _currentStatement:Number;					public function ImageInteractionViewState (m,rc):void 		{			trace("Image InteractionViewState has been made");						initializeChatBubbleAppearance();			 			this.setup(m,rc); //start the loading		}										override public function load():void		{					buildReady();			loadReact();			buildBackground(); 			//buildHelp();		}				public function buildReady() 		{			myClip = new MovieClip(); 										//Now this should go into load manager stuff.			visual = new Loader(); 			visual.load(new URLRequest(model.myData.getImage)); 									//add that to the load 						model.loadManager.add(visual);			_currentImage = visual;			visual.x = 0; 			visual.y = 0; 						myClip.x = 0; 			myClip.y = 0; 						layout.SetPos(myClip,model.myData.imageData);			//trace("Image data =----------------" + model.myData.imageData.@height); 					myClip.addChild(visual);			myClip.setChildIndex(visual, 0);									//now we need some Listenters to handle loading and load progression			visual.contentLoaderInfo.addEventListener(Event.COMPLETE, handleLoadedComplete); 						//This is a bit controller stuff as when the mouse is clicked down model needs to react 			//With a different type medium this might be different. 			myClip.addEventListener(MouseEvent.MOUSE_DOWN, model.state.React) 						// now build the list of images for each of  the 			_myStatementsImages = new Array ();			//now we need to find all the images 			//loop thru all the statements find all the images and put them into multi dimensional array that reflects the			//statement data structure. 			var i:Number=0;			while (i < model.myData.getStatementLength()) {				//trace(model.myData.getStatementAtasXML(i)); 				var statement:XML=model.myData.getStatementAtasXML(i);				i++;				//trace(statement);				for each (var bit:XML in statement) {					var currentReactions:Array = new Array();					for each (var react:XML in bit.reaction) {						trace(react.@image.toString());						var currentReaction = null; 												if (react.@image.toString()!="") {							trace("yes it has a image");							//add that to list of images 														///start to load that and add it the load manager so we can see later if it's loaded yet							visual = new Loader(); 							visual.load(new URLRequest(react.@image.toString())); 							//add that to the load er							//model.loadManager.add(visual) ;							currentReaction = visual						}						//trace(currentReactions);																		 _myStatementsImages.push(currentReaction);						 					}				}			}			trace("---------------");			trace(_myStatementsImages);					}								private var minWidth:Number;		private var minHeight:Number;				private var chatBubbleBGColor:Number;		private var chatBubbleAlpha:Number;		private var padding:Number;		private var chatBubbleSprite:Sprite;				private var chatBubbleAnchor:String;		public static const ANCHOR_TL:String = "topLeft";		public static const ANCHOR_TR:String = "topRight";		public static const ANCHOR_BL:String = "bottomLeft";		public static const ANCHOR_BR:String = "bottomRight";				private function initializeChatBubbleAppearance ():void		{			minWidth = 250;			minHeight = 150;			chatBubbleAlpha = 1;			chatBubbleBGColor = 0xf0f0f0;			padding = 5;		}		private function repositionChatBubble():void {			trace ( "POSITIONS ARE :: " , xpos, ypos );			trace ( "AND THE ANCHOR IS :: " , chatBubbleAnchor );			switch (chatBubbleAnchor) {				case ANCHOR_TL:				default:					reactMC.x = xpos;					reactMC.y = xpos;					break;				case ANCHOR_TR:					reactMC.x = xpos - reactMC.width;					reactMC.y = ypos;					break;				case ANCHOR_BL:					reactMC.x = xpos;					reactMC.y = ypos - reactMC.height;										break;				case ANCHOR_BR:					reactMC.x = xpos - reactMC.width;					reactMC.y = ypos - reactMC.height;															break;							}		}		private function updateChatBubble ():void {			reactMC.removeChild ( chatBubbleSprite );			chatBubbleSprite = null;						chatBubbleSprite = new Sprite ();			var updatedChatBubbleHeight:Number = myText.y + myText.textHeight + (padding*2);			chatBubbleSprite.graphics.beginFill( chatBubbleBGColor, chatBubbleAlpha);			 			chatBubbleSprite.graphics.drawRoundRect( 0, 0, minWidth, updatedChatBubbleHeight, 20, 20);			chatBubbleSprite.graphics.endFill();						reactMC.addChild ( chatBubbleSprite );			reactMC.swapChildren( myText, chatBubbleSprite );					}						private function createReactionChatBubble ():void {			if (chatBubbleSprite && reactMC.contains (chatBubbleSprite) ) {				reactMC.removeChild (chatBubbleSprite);				chatBubbleSprite = null;			}			chatBubbleSprite = new Sprite ();			chatBubbleSprite.graphics.beginFill(chatBubbleBGColor, chatBubbleAlpha);			//chatBubbleSprite.graphics.drawRect(0, 0, minWidth, minHeight);			chatBubbleSprite.graphics.drawRoundRect(0,0, minWidth, minHeight, 20, 20);			chatBubbleSprite.graphics.endFill();			reactMC.addChild ( chatBubbleSprite );					}		public function loadReact():void {						reactMC = new MovieClip(); 			var reactLoader = new Loader();						createReactionChatBubble();			//reactLoader.load(new URLRequest("media/ReactBackground.swf")); // TODO could be good make this so it's not hard wired in			//reactMC.addChild(reactLoader);			//add that to the load 			//model.loadManager.add(reactLoader);			myClip.addChild(reactMC);			//reactLoader.contentLoaderInfo.addEventListener(Event.COMPLETE, buildReact);			buildReact();		}				public function buildReact(e:Event = null):void {								myText = new TextField();			//myText.text = "test";						myText.selectable = false;						var format:TextFormat = new TextFormat();            format.font = "Arial";           // format.color = 0xFF0000;            format.size = 12;            //format.underline = true;						myText.antiAliasType = AntiAliasType.ADVANCED;						//myText.autoSize = TextFieldAutoSize.LEFT;            myText.defaultTextFormat = format;									//position the text so the some margin 						reactMC.addChild(myText) ;			 						myText.autoSize = TextFieldAutoSize.LEFT;			myText.wordWrap = true; 			reactMC.visible = false;			myText.x = padding;			myText.y = padding;			myText.width = minWidth - (padding*2);			myText.height = minHeight - (padding*2);								}				/**		 * Puts the interaction back into the Ready static sta te 		 * @param	e - the event that his trigger this - it's often the timer 		 */		override public function Ready(e:Event):void {					trace("make sure the visuals are in the ready state"); 							reactMC.visible = false;				myText.htmlText = "";				}		private var xpos:Number;		private var ypos:Number;		/**		 * Called after the model a got the click and dispatch an event 		 * it grab what the current statement 		 * @param	e		 */		override public function React(e:Event):void {								var currentStatment = model.state.getCurrentStatementNo();					var currentXML = model.myData.getStatementAtasXML(currentStatment);										var _currentStatment  = model.state.getCurrentStatementNo();					 					layout.SetPos(reactMC, currentXML.reaction);										xpos = reactMC.x;					ypos = reactMC.y;					trace ("currentXML.reaction.@anchor > " , currentXML.reaction.@anchor)					switch (String (currentXML.reaction.@anchor)) {						case "topleft":						default:							chatBubbleAnchor = ANCHOR_TL;							break;						case "topright":							chatBubbleAnchor = ANCHOR_TR;							break;						case "bottomleft":							chatBubbleAnchor = ANCHOR_BL;														break;						case "bottomright":							chatBubbleAnchor = ANCHOR_BR;							break;										}					trace ( "THE ANCHOR IS :: " , chatBubbleAnchor );										var currentText = model.state.getCurrentStatementAsText();										if (currentText !="") {						myText.htmlText = model.state.getCurrentStatementAsText();						reactMC.visible = true;																		updateChatBubble ();						repositionChatBubble();						//layout.SetPosWithMargin(reactMC, myText, 7);											}															//trace("The current image from the array " + _myStatementsImages[currentStatment]);										if (_myStatementsImages[currentStatment]) {						//This where we add the code to the update the image						this.updateImage(); 					} else {												if (model.myData.ResponseExists(int(this._currentStatement))) {											if(ReponseControl){												model.interactState.buildRespond(); //NEXT - move the trigger of this to a view												model.interactState.Respond(); //NEXT - move the trigger of this to a view											}									}										}			}									private function updateImage():void {				trace("about to update the image"); 			var currentStatement=model.state.getCurrentStatementNo();			if (_myStatementsImages[currentStatement]) {								var nextImage = _myStatementsImages[currentStatement]; 				trace("Next image is " + nextImage);				if (nextImage != null) {					trace("yes got a image and need to do something"); 										trace(model.myData.getStatementAtasXML(currentStatement));									myClip.addChild(nextImage);										myClip.setChildIndex(nextImage, 0);										//see if we can make go back to the start and stop. 					_lastimage =_currentImage;										try {						  _lastimage.content.gotoAndStop(1);						}						catch(errObject:Error) {						  trace("XXXXXXXXXXXXXXXXXXXXX" + errObject.message); 						}										myClip.removeChild(_currentImage); //get rid of the last image 					_currentImage = (nextImage); 										try {					  nextImage.content.gotoAndPlay(2);					}					catch(errObject:Error) {					  trace("XXXXXXXXXXXXXXXXXXXXX" + errObject.message); 					}					nextImage.content.addEventListener(Event.ENTER_FRAME, onEnterFrame); //trigger the function to check to see if the movie has finished playing. 				} else {					trace('--------- THERE is no image -------------');					// there is no image so need to build the responses 					if (model.myData.ResponseExists(int(this._currentStatement))) {											if(ReponseControl){												model.interactState.buildRespond(); //NEXT - move the trigger of this to a view												model.interactState.Respond(); //NEXT - move the trigger of this to a view											}									}													}								//updates the positon of the image ... not sure if we really need to this this.				var currentXML = model.myData.getStatementAtasXML(currentStatement);				//trace("the xml is " +  currentXML);				//layout.SetPos(myClip,currentXML); // Set the pos based on the current statement xml												//ns.play(nextVideo);															model.interactState.buildRespond(); 							}		}		private function onEnterFrame(evt:Event):void {  			trace("---checking to see if what frame we are at--");				var className:String = getQualifiedClassName( evt.target);		//trace(className);		//trace(typeof(evt.target));				//trace(evt.target.totalFrames);		if(className == "flash.display::MovieClip") {				if (evt.target.currentFrame == evt.target.totalFrames)  {									trace("last frame  so the response needs to be build ");									//trace(evt.target);																		if (model.myData.ResponseExists(int(this._currentStatement))) {											if(ReponseControl){												model.interactState.buildRespond(); //NEXT - move the trigger of this to a view												model.interactState.Respond(); //NEXT - move the trigger of this to a view											}									}									  									evt.target.stop();									evt.target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);				};  		} else {							if (model.myData.ResponseExists(int(this._currentStatement))) {										if(ReponseControl){											model.interactState.buildRespond(); //NEXT - move the trigger of this to a view											model.interactState.Respond(); //NEXT - move the trigger of this to a view										}								}												evt.target.removeEventListener(Event.ENTER_FRAME, onEnterFrame);			};				}			 override public function handleLoadedComplete(e:Event):void {		 trace(" -------------------------- LOADED ----------------------");			 addChild(myClip); 		//layout.SetScale(myClip, model.myData.imageData); //BUG - seem to stop the character working 					}				}	}