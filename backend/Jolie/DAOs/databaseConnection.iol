
init {
    with( connectionInfo ) {        
	    .host = "localhost"; 
	    .driver = "mysql";
	    .port = 3306;
	    .database= "Apim"; 
	    .username = "root";
	    .password = ""
    };	
    connect@Database( connectionInfo )();
    println@Console("Dao connected, connection is running on host:" + connectionInfo.host )()
}