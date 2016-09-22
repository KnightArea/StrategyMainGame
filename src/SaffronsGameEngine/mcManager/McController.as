package SaffronsGameEngine.mcManager
{
	import SaffronsGameEngine.events.McEvent;
	
	import flash.display.MovieClip;
	import flash.events.Event;
	import flash.events.EventDispatcher;

	/**MovieClip reached to its middle labled frame*/
	[Event(name="MC_READY", type="SaffronsGameEngine.events.McEvent")]
	/**MovieClip reached to its final frame*/
	[Event(name="MC_ENDED", type="SaffronsGameEngine.events.McEvent")]
	public class McController extends EventDispatcher
	{
		private var myMC:MovieClip ;
		
		private var requiredFrame:uint = 1 ;
		
		private var labledFrame:uint ;
		
		private var totalFrames:uint ;
		
		public function McController(mc:MovieClip)
		{
			myMC = mc ;
			myMC.addEventListener(Event.ENTER_FRAME,anim);
			myMC.addEventListener(Event.REMOVED_FROM_STAGE,unLoad);
			
			labledFrame = ReadyFrameLable.getTheReadyFrameLable(myMC); 
			totalFrames = myMC.totalFrames ;
			
			myMC.stop();
		}
		
		protected function unLoad(event:Event):void
		{
			myMC.removeEventListener(Event.ENTER_FRAME,anim);
			myMC.removeEventListener(Event.REMOVED_FROM_STAGE,unLoad);
			myMC = null ;
		}
		
		/**Controll the movieClip frame*/
		protected function anim(event:Event):void
		{
			if(myMC.currentFrame<requiredFrame)
			{
				myMC.nextFrame() ;
				controllLablesAndDispatchEvents();
			}
			else if(myMC.currentFrame>requiredFrame)
			{
				myMC.prevFrame() ;
				controllLablesAndDispatchEvents();
			}
		}
		
		
		/**This will dispatches an Event related to the current situation*/
		private function controllLablesAndDispatchEvents():void
		{
			if(myMC.currentFrame == labledFrame)
			{
				//The animation is ready 
				this.dispatchEvent(new McEvent(McEvent.MC_READY));
			}
			if(myMC.currentFrame == totalFrames)
			{
				//MovieClip reachd to its final frame
				this.dispatchEvent(new McEvent(McEvent.MC_ENDED));
			}
		}
		
	/////////////////////////////////////////Player controller
		public function playTillReachToReadyLable():void
		{
			requiredFrame = labledFrame ;
			controllLablesAndDispatchEvents();
		}
		
		public function playTillEnds():void
		{
			requiredFrame = totalFrames ;
			controllLablesAndDispatchEvents();
		}
	}
}