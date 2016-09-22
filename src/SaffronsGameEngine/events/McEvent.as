package SaffronsGameEngine.events
{
	import flash.events.Event;
	
	public class McEvent extends Event
	{
		/**The movie clip reached to its ready frame lable*/
		public static const MC_READY:String = "MC_READY" ;
		
		/**The movieClip reached to its final frame*/
		public static const MC_ENDED:String = "MC_ENDED" ;
		
		public function McEvent(type:String)
		{
			super(type);
		}
	}
}