package SaffronsGameEngine
{
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLStatement;
	import flash.filesystem.File;
	import flash.utils.getTimer;

	internal class Core
	{
		internal static const coreFolder:String = "Data";
		
		private static const configFile:String = "config" ; 
		
		private var coreDB:CoreDB ;
		
		public function Core()
		{
		}
		
	//////////////////////////////////////////
		public function start():void
		{
			var coreFile:File = File.applicationDirectory.resolvePath(coreFolder) ;
			if(!coreFile.exists)
			{
				coreFile.createDirectory();
			}
			coreFile = coreFile.resolvePath(configFile) ;
			coreDB = new CoreDB(coreFile); 
		}
	}
}