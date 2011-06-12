package stem.model
{
	public class ResultBoxStyleVO
	{
		public var bgColor:Number;
		public var bgAlpha:Number;
		public var fontColor:Number;
		public function ResultBoxStyleVO(bgColor:Number, bgAlpha:Number, fontColor:Number)
		{
			this.bgColor = bgColor;
			this.bgAlpha = bgAlpha;
			this.fontColor = fontColor;
		}
		public function toString():String { 
			return "ResultBoxStyleVO: {bgColor:"+bgColor+", bgAlpha:"+bgAlpha+", fontColor:"+fontColor+"}";
		}
	}
}