﻿package stem.model{		/**	* This is really just a wrapper for the XML file data so that XML data format 	* could be chnaged.	* @author Robin Petterd	*/	public class InteractionData 	{			private var myData:XML; 				public function InteractionData (... x):void 			{				try 				{					myData = x[0]; 				}				catch (errObject:Error) {} 								//trace(myData); 			}						public function setMyData(value:XML):void 		{			myData = value;		}				public function get getMessageXML():XMLList {			//trace(myData);			return myData.messages;		}						public function get getMessageScoreDisplayDuring():Boolean {			//trace(myData);						if (myData.messages.finalscore.@displayduring == "yes") {						return true; 						} else { 						return false;						} 					    }				public function get getMessageFinalScore():String {			//trace(myData);			return myData.messages.finalscore;		}				public function get getMessageFactorDisplay():Boolean {			//trace(myData);			if (myData.messages.finalfactors.@display == "yes") {				return true; 			} else { 				return false;			} 		}				public function get getMessagesPadding():Number {			return myData.messages.padding.@x; 		}										public function get getReports():XMLList		{			return myData.reports; 		}								public function get getBackground():XMLList		{			return myData.space; 		}				public function get getHelp():XMLList		{			return myData.helper; 		}												public function get getFactors():XMLList		{			return myData.factors; 		}				public function get getType():String {			trace("About to return the image"); 			//trace(myData);			return myData.interaction.name.@type; 		}		public function get getImage():String {			//trace(myData);			return myData.interaction.visual;		}				public function get imageData(){			return myData.interaction.visual; 			}						public function get imagex():Number {			return myData.interaction.visual.@x; 			}						public function get imagey():Number {			return myData.interaction.visual.@y; 			}						public function getStatementLength():Number {			return myData.interaction.statements.statement.length();				}		public function getStatementAt(n:Number):String {			return myData.interaction.statements.statement[n].reaction.toString();		} 				/*		Takes a string and find the statement number for string		*/		 public function getStatementCalled(Name:String):Number {			 		 	 trace('SSSSSS - about to search for the next statement'); 			 //trace(myData.interaction.statements.statement.length());			 var statementLenght = myData.interaction.statements.statement.length(); 			 			 var next = 0;			 for each (var statement:XML in myData.interaction.statements.statement) 				{ 				trace(statement.@["id"]);				if ((statement.@["id"]) == Name)  {			 			return next;					}				next ++; 			  }			  return "";			 //trace(myData.interaction.statements.statement.(@id == 2));			 			 			//return myData.interaction.statements.statement[n].reaction.toString();		} 								public function getStatementAtasXML(n:Number):XML {			return myData.interaction.statements.statement[n];		} 						public function ResponseExists(n:Number):Boolean {					if (myData.interaction.statements.statement[n].responses.length() == 0) {				return false; 			} else {				return true;			} 		}				public function getResponses(n:Number):XMLList {			return myData.interaction.statements.statement[n].responses; 		}										} }