package SaffronsGameEngine
{
	import flash.data.SQLConnection;
	import flash.data.SQLMode;
	import flash.data.SQLStatement;
	import flash.events.SQLEvent;
	import flash.filesystem.File;

	internal class CoreDB
	{
		private var configFileLocation:File ;
		
		
		private var sqlConnection:SQLConnection,
					sqlStatement:SQLStatement ;
					
		private const 	table_page:String = "page",
						table_page_id:String = "id";
		
		
		
		public function CoreDB(configFile:File)
		{
			configFileLocation = configFile ;
			if(configFile.exists)
			{
				loadConfig();
			}
			else
			{
				createConfig();
			}
		}
		
		
		/**The sql starts to create the required db*/
		private function createConfig():void
		{
			sqlConnection = new SQLConnection();
			sqlConnection.openAsync(configFileLocation,SQLMode.CREATE);
			
			sqlStatement = new SQLStatement();
			sqlStatement.sqlConnection = sqlConnection ;
			
			sqlStatement.addEventListener(SQLEvent.RESULT,tablesCreated);
			
			//Create tables
			sqlStatement.text = "Create table "+table_page+"("+
				table_page_id+"INT PRIMARY KEY  UNIQUE"+
				");";
			sqlStatement.execute();
		}
			
			/**SQL tables created*/
			protected function tablesCreated(event:SQLEvent):void
			{
				sqlStatement.removeEventListener(SQLEvent.RESULT,tablesCreated);
				throw "Tables created" ;
			}
		
		private function loadConfig():void
		{
			// TODO Auto Generated method stub
			
		}
	}
}