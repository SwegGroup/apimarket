include "console.iol"

include "../constants.iol"

include "KeyManagerInterface.iol"
include "../DAOs/DAOKeyInterface.iol"
include "../DAOs/DAOInterface.iol"
include "time.iol"
include "string_utils.iol"

execution { concurrent }

include "deploy.iol"

outputPort DAOKey {
	Location: DAOKeyLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOKeyInterface
}

init
{
	println@Console( "KeyManager running" )()
}

main
{	// request is key
	[checkKey ( request )(response){
		// install scope
		find@DAOKey( request.root )( k );
		drequest.format = "YYYY-MM-dd";
		diffDateRequest.date1 = k.dataScadenza;
		getCurrentDateTime@Time( drequest )( diffDateRequest.date2 );
		diffDateRequest.format = "YYYY-MM-dd";
		getDateDiff@Time( diffDateRequest )( r_time );

		response = k.usedByte <= k.maxByte && r_time>=0 && k.nomeAPI == request.api
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
		with( keyRequest ){
			.key = new;
			.dataScadenza = request.dataScadenza;
			.maxByte = request.maxByte;
			.username = request.username;
			.nomeAPI = request.nomeAPI;
			.tempoUso = 0;
			.usedByte = 0
		};
		create@DAOKey(keyRequest)(r);
		if( r==1 ) {
			response = keyRequest.key		  
		}
		else{
			response= "Error"
		}
	}]
	[incrementSize( request )( response ){
		find@DAOKey( request.root )( api );
		api.usedByte = api.usedByte + request.size;
		update@DAOKey( api )( status )
	}]
}
