package SaffronsGameEngine
	//SaffronsGameEngine.MainClass
{
	import SaffronsGameEngine.events.McEvent;
	import SaffronsGameEngine.mcManager.McController;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	
	public class MainClass extends MovieClip
	{
		private var myCore:Core ;
		
		private var myAnimationInfo:McController ;
		
		public function MainClass()
		{
			super();
			
			myCore = new Core();
			
			myAnimationInfo = new McController(this);
			myAnimationInfo.addEventListener(McEvent.MC_READY,loadCore);
			myAnimationInfo.playTillReachToReadyLable() ;
		}
		
		/**This will load the core*/
		protected function loadCore(event:Event):void
		{
			myCore.start();
		}
	}
}