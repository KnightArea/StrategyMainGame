package SaffronsGameEngine.mcManager
{
	import flash.display.FrameLabel;
	import flash.display.MovieClip;

	public class ReadyFrameLable
	{
		private static var lables:Array ;
		
		private static var lable:FrameLabel ;
		
		/**This function will returns the first frame lable's frame number of the inserted mc. If no lables defined, it will return 0*/
		public static function getTheReadyFrameLable(mc:MovieClip):uint
		{
			lables = mc.currentLabels ;
			if(lables.length>0)
			{
				lable = lables[0] as FrameLabel ;
				//Returns the frame number for the first frame lable
				return lable.frame ;
			}
			else
			{
				//This means there is no lable defined here
				return 0 ;
			}
		}
	}
}