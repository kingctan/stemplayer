﻿package stem.views {	   import fl.controls.listClasses.CellRenderer; 	   import flash.text.TextFormat;     public class MultiLineCell extends CellRenderer     {                  public function MultiLineCell()         {    			            textField.wordWrap = true;             textField.autoSize = "left"; 															textField.textColor = 0x003468;			        }         override protected function drawLayout():void {          						textField.htmlText=this.label;			var newFormat = new TextFormat();              newFormat.color = 0xFFFFFF;            //newFormat.size = 20;            //newFormat.underline = true;            ///newFormat.italic = true;						textField.setTextFormat(newFormat);            textField.width = this.width;             super.drawLayout();         }     } }