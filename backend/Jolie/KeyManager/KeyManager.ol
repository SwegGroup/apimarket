include "console.iol"

include "KeyManagerInterface.iol"
include "../DAOs/DAOKeyInterface.iol"
include "../DAOs/DAOInterface.iol"

execution { concurrent }

include "deploy.iol"

outputPort DAOKey {
	Location: DAOKeyLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOKeyInterface
}

main
{	// request is key
	[checkKey ( request )(response){
		// install scope
		find@DAOKey( request )( k )
		// check date
		// check byte
	}]
	/*
		request {
			dataScadenza
			maxByte
			username
			nomeApi
		}
	*/
	[keygen ( request )(response){
		// return new key 36 char and put into database
		key = new;
		// fai roba nel database
		with( keyRequest ){
			.key = new;
			.dataScadenza = request.dataScadenza;
			.maxByte = request.maxByte;
			.tempoUso = 0;
			.username = request.username;
			.nomeAPI = request.nomeAPI;
			.usedByte = 0
		};
		create@DAOKey(keyRequest)(response)
	}]
	[decodeKey ( request )(response){
		// calcola md5 della chiave in chiaro e confronta con DB
		x = "Hello"
	}]
}