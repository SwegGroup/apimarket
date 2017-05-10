include "console.iol"

include "../DAOs/DAOApiInterface.iol"
include "../DAOs/DAOKeyInterface.iol"
include "../DAOs/DAOUserInterface.iol"
include "../DAOs/DAOInterface.iol"
include "APIManagerInterface.iol"
include "../UserManager/UserManagerInterface.iol"
include "../Gateway/GatewayInterface.iol"

execution { concurrent }

include "deploy.iol"

init
{
  println@Console( "Running" )()
}

outputPort UserManager {
	Location: UserManagerLocation
	Protocol: sodep
	Interfaces: UserManagerInterface
}

outputPort Gateway {
	Location: GatewayLocation
	Protocol: sodep
	Interfaces: GatewayInterface
}

outputPort DAOApi {
	Location: DAOApiLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOApiInterface
}

outputPort DAOUser {
	Location: DAOUserLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOUserInterface
}

outputPort DAOKey {
	Location: DAOKeyLocation
	Protocol: sodep
	Interfaces: DAOKeyInterface
}

main
{
	[viewAPI ( request )(response){
		find@DAOApi( request )( response )
		}]
		// request has sid
	[editAPI ( request )(response){
	    //bisognerebbe controllare se l'utente che ha chiamato il metodo sia lo stesso utente che ha caricato
	    // il controllo possiamo lasciarlo al front-end ;)
		getUserFromSid@UserManager(request.sid)(user);
		if( request.username == user ) {
		  update@DAOApi( request )(r);
		  response = r.status
		}
		else {
		  throw( UserIsNotOriginalUploader )
		}
	}]
	[insertAPI ( request )(response){
		create@DAOApi( request )(r); // qua va anche chiamato il gateway magari in parallelo ; vs |
		setnewredirection@Gateway( something )( response );
		response = r.status && response
		}]
	[searchAPI ( request )(response){
		x = "Hello";
		getApiFromDescription@DAOApi(request)(response);
		println@Console( x )()
		}]
	[deleteAPI ( request )(response){
		getUserFromSid@UserManager(request.sid)(user);
		if( request.username == user ) {
		  delete@DAOApi( request )(r);
		  response = r.status
		}
		else {
		  throw( UserIsNotOriginalUploader )
		}
	}]
	[editAPIAdmin ( request )(response){
		update@DAOApi( request )(r);
	    response = r.status
	}]
	[viewStats ( request )(response){
	    getAPIStats@DAOApi( request )(response)
	}]
	[deleteAPIAdmin (request)(response){
	    delete@DAOApi( request )(r);
		response = r.status
	}]
	[incrementSize( request )( response ){
	 	//request {nomeAPI, key, size, interval}

	 	// aggiorna uso byte key
	 	{
	 		find@DAOKey(request.key)(key);
	 		key.usedByte = key.usedByte + request.size;
	 		update@DAOKey(key)(response1)
	 	}
	 	|
	 	// calcola rispetto all'api
	 	{
	 		find@DAOApi( request.nomeAPI )( api );
	 		api.traffico = api.traffico + request.size;
	 		update@DAOApi ( api )( response2 )
	 	};
	 	response = response1 && response2
	}]
	[incrementInterval( request )( response ){
	 	//request {nomeAPI, key, size, interval}

	 	// aggiorna uso byte key
	 	{
	 		find@DAOKey(request.key)(key);
	 		key.tempoUso = key.tempoUso + request.interval;
	 		update@DAOKey(key)(response1)
	 	}
	 	|
	 	// calcola rispetto all'api
	 	{
	 		find@DAOApi( request.nomeAPI )( api );
	 		api.tempoRispostaTotale = api.tempoRispostaTotale + request.interval;
	 		api.totaleChiamate++;
	 		api.tempoMedioRisposta = api.tempoRispostaTotale / api.totaleChiamate;
	 		update@DAOApi ( api )( response2 )
	 	};
	 	response = response1 && response2
	}]
	[buyApi( request )( response ){
	    // get price
	    {
	    	find@DAOApi( request.nomeAPI )( api );
	    	prezzo = api.prezzo
	    }
	    |
	    // get saldo coin of user
	    {
	    	getUserFromSid@UserManager( request.sid )( username );
	    	find@DAOUser( username )( user );
	    	saldo = user.saldoCoin
	    }
	    ;
	    if( saldo >= prezzo ) {
	    	// saldo -= prezzo
	    	saldo = saldo - prezzo|
			// generate key
			{
				with( keyData ){
				  .username = ;
				  .durata = ;
				  .byte = ;
				}
				keygen@KeyManager( keyData )( encryptedKey )
				// creates and saves
			};
			// save acquisto
			saveAcquisto@DAOApi( { username, encryptedKey } )( acquistoStatus )
	    }
		else {
			throw( NotEnoughCoins )
		}
	}]
	// request {}
	[sendDocumentation(request)(response){
		x = "hello"
	}]
	[getFrontPageApis( request )( response ){
		getMostDownloadedAPIsId@DAOApi()( apis );
		for ( i=0, i<#apis, i++ ) {
			response[i].nome = apis[i].nome;
			response[i].username = apis[i].username;
			response[i].logoAPI = apis[i].logoAPI;
			response[i].ratingMedio = apis[i].ratingMedio;
			response[i].prezzo = apis[i].prezzo
		}
	}]
	[getFrontPageApisCategories( request )( response ){
		getMostDownloadedAPIsIdFromCategory@DAOApi()( apis );
		for ( i=0, i<#apis, i++ ) {
			response[i].nome = apis[i].nome;
			response[i].username = apis[i].username;
			response[i].logoAPI = apis[i].logoAPI;
			response[i].ratingMedio = apis[i].ratingMedio;
			response[i].prezzo = apis[i].prezzo
		}
	}]
}