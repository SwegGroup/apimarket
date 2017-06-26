include "console.iol"

include "../constants.iol"

include "../DAOs/DAOApiInterface.iol"
include "../DAOs/DAOKeyInterface.iol"
include "../DAOs/DAOUserInterface.iol"
include "../DAOs/DAOInterface.iol"
include "APIManagerInterface.iol"
include "../UserManager/UserManagerInterface.iol"
include "../Gateway/GatewayInterface.iol"
include "../KeyManager/KeyManagerInterface.iol"
include "../CourierGenerator/CourierGeneratorInterface.iol"
include "file.iol"
include "string_utils.iol"

execution { concurrent }

include "deploy.iol"

init
{
  println@Console( "APIManager running" )()
}

outputPort UserManager {
	Location: UserManagerLocation
	Protocol: sodep
	Interfaces: UserManagerInterface
}

outputPort KeyManager {
	Location: KeyManagerLocation
	Protocol: sodep
	Interfaces: KeyManagerInterface
}

outputPort Gateway {
	Location: GatewayLocation
	Protocol: sodep
	Interfaces: GatewayInterface
}

outputPort CourierGenerator {
	Location: CourierGeneratorLocation
	Protocol: sodep
	Interfaces: CourierGeneratorInterface
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
	Interfaces: DAOInterface, DAOKeyInterface
}

main
{
	// returns the API object as saved in the database
	[viewAPI ( request )(response){
		find@DAOApi( request.root )( r );
		response.nome = r.nomeAPI;
		response.linkFile = r.linkFile;
		response.linkPDF = r.linkPdf;
		response.descrizione = r.descrizione;
		response.logoAPI = r.logoAPI;
		response.numVoti = r.numeroVoti;
		response.ratingMedio = r.ratingMedio;
		response.tempoMedioRisposta = r.tempoMedioRisposta;
		response.totaleChiamate = r.totaleChiamate;
		response.traffico = r.traffico;
		response.tempoRispostaTotale = r.tempoRispostaTotale;
		response.username = r.username;
		response.location = r.location;
		response.protocol = r.protocol;
		response.idCategoria = r.idCategoria
	}]
		// request has sid
	[editAPI ( request )(response){
		temp.sid= request.sid;
		getUserFromSid@UserManager(temp)(user);
		if( request.root == user ) {
			//Search the API in the DB
			find@DAOApi( request.nome )(a);
			//Modify only the right fields
			a.descrizione = request.descrizione;
			a.idCategoria = request.idCategoria;
			//update the old API with the new one
			update@DAOApi( a )(r);
			// request contiene anche il file dell'api e della documentazione

			if( r==1 ){
				response = true
			}
			else{
				response = false
			}
		}
		else {
		  throw( UserIsNotOriginalUploader )
		}
	}]
	/* Inserts an API in the database table by only inputing the basic data input and by zeroing the data that will be calculated later, such as the number of votes the average response time of the traffic, and so on.*/
	[insertAPI ( request )(response){
		sid.sid = request.sid;
		getUserFromSid@UserManager(sid)(user);

		//user = "PinoG";
		//nomeAPI, linkFile, linkPdf, descrizione, logoAPI, policy, numeroVoti, ratingMedio, tempoMedioRisposta, totaleChiamate, traffico, tempoRispostaTotale, username, idCategoria, location, protocol
		with( request ){
			.nomeAPI = request.nome;
			.linkFile = linkFile="Uploads/Interface/"+request.nome+".iol";
			.linkPDF = linkPDF="Uploads/Documentation/"+request.nome+".txt";
			//.logoAPI = logoAPI="Uploads/Logos/"+request.nome+".png";
			.logoAPI = request.logo; // Not a file anymore, just a link
			.numeroVoti = 0;
			.ratingMedio = 0.0;
			.tempoMedioRisposta = 0.0;
			.totaleChiamate= 0;
			.traffico= 0.0;
			.tempoRispostaTotale= 0.0;
			.username = user;
			.idCategoria = request.idCategoria
		};
		create@DAOApi( request )(r);

		// change interface name for ease of use

		replaceAllRequest = request.interfaccia;

		with( replaceAllRequest ) {
			.regex = "interface (.*) \\{";
			.replacement = "interface "+request.nome+"Interface {"
		};

		replaceAll@StringUtils( replaceAllRequest )( request.interfaccia );

		// request contiene anche il file dell'api e della documentazione
		{
			{
				with( fileRequest ){
					.content = request.interfaccia;
					.filename = "../"+linkFile
				};
				writeFile@File(fileRequest)();
				fileRequest.filename = "../CourierGenerator/"+request.nome+".iol";
				writeFile@File(fileRequest)()
			}
			|
			{
				with( fileRequest1 ){
					.content = request.documentazione;
					.filename = "../"+linkPDF
				};
				writeFile@File(fileRequest1)()
			}
			/*|
			{
				base64ToRaw@Converter( request.logo )( mylogo );
				with( fileRequest2 ){
					.content = mylogo;
					.filename = "../"+logoAPI
				};
				writeFile@File(fileRequest2)()
			}*/
		};
		//generate and save courier
		with( crequest ){
			.name = request.nome;
			.location = request.location;
			.protocol = request.protocol
		};
		generate@CourierGenerator( crequest )();
		/*
			outputname = outputport name
			filecouriername = name of courier file
			nameofservice = name of api
		*/
		with( apiData ){
		  .outputname = request.nome;
		  .filecouriername = request.nome+"Courier.ol";
		  .nameofservice = request.nome
		};
		setnewredirection@Gateway( apiData )();
		response = true
	}]
	// returns an array of APIs that contains the user requested string in the description.
	[searchAPI ( request )(response){
		getApiFromDescription@DAOApi(request)(r);
		//valueToPrettyString@StringUtils( r )( rstr );
		//println@Console( rstr )();
		for ( i=0, i<#r.row, i++ ) {
			response.array[i].nome = r.row[i].nomeAPI;
			response.array[i].linkFile = r.row[i].linkFile;
			response.array[i].linkPDF = r.row[i].linkPdf;
			response.array[i].descrizione = r.row[i].descrizione;
			response.array[i].logoAPI = r.row[i].logoAPI;
			response.array[i].numVoti = r.row[i].numeroVoti;
			response.array[i].ratingMedio = r.row[i].ratingMedio;
			response.array[i].tempoMedioRisposta = r.row[i].tempoMedioRisposta;
			response.array[i].totaleChiamate = r.row[i].totaleChiamate;
			response.array[i].traffico = r.row[i].traffico;
			response.array[i].tempoRispostaTotale = r.row[i].tempoRispostaTotale;
			response.array[i].username = r.row[i].username;
			response.array[i].location = r.row[i].location;
			response.array[i].protocol = r.row[i].protocol
		}
	}]
	// deletes an API from the database, takes api name as input
	[deleteAPI ( request )(response){
		with( r ){
	    		.sid= request.sid;
				.root= request.username
		};
		getUserFromSid@UserManager(r)(user);
		if( request.username == user ) {
			delete@DAOApi( request.root )(r);

			delete@File( "../Uploads/Interface/"+request.root+".iol" )();
			delete@File( "../Uploads/Documentation/"+request.root+".pdf" )();
			delete@File( "../Uploads/Logos/"+request.root+".png" )();
			delete@File( "../Uploads/Surfaces/"+request.root+"SurfaceInterface.iol" )();
			delete@File( "../Gateway"+request.root+"Courier.ol" )();
			if( r==1 ){
			response = true
		}
		else{
			response = false
		}
		}
		else {
			throw( UserIsNotOriginalUploader )
		}
	}]

	[editAPIAdmin ( request )(response){
		//Search the API in the DB
		find@DAOApi( request.nome )(a);
		//Modify only the right fields
		a.descrizione = request.descrizione;
		a.idCategoria = request.idCategoria;
		//update the old API with the new one
		update@DAOApi( a )(r);

	    if( r==1 ){
			response = true
		}
		else{
			response = false
		}
	}]
	// view stats of API like average response time etc...
	[viewStats ( request )( response ){
	    getAPIStats@DAOApi( request.root )( response )
	    //valueToPrettyString@StringUtils(r)(response)
	}]
	// an admin can delete any api, not only those uploaded by him
	[deleteAPIAdmin (request)(response){
	    delete@DAOApi( request.root )(r);
	    // delete interface and documentation file system
	    if( r==1 ){
			response = true
		}
		else{
			response = false
		}
	}]
	// increases the size 
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
	 		find@DAOKey(request.key)(k);
	 		k.tempoUso = k.tempoUso + request.interval;
	 		update@DAOKey(k)(response1)
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
	// request {nomeAPI, sid, durata, maxByte} // Durata o data scadenza? chiedere al front end
	[buyApi( request )( response ){
	    // get price
		{
		    {
		    	getPolicyFromId@DAOApi( request.policy )( policy );
		    	//valueToPrettyString@StringUtils( policy )( pol );
		    	//println@Console( pol )();
		    	prezzo = policy.prezzo
		    }
		    |
		    // get saldo coin of user
		    {
		    	r.sid= request.sid;
		    	getUserFromSid@UserManager(r)(username);
		    	find@DAOUser( username )( user );
		    	saldo = user.saldoCoin
		    }
		}
	    ;
	    if( saldo >= prezzo ) {
	    	// saldo -= prezzo
	    	{
	    		{
		    		saldo = saldo - prezzo;
		    		user.saldoCoin = saldo;
		    		update@DAOUser(user)()
		    	}
		    	|
				// generate key
				{
					with( keyData ){
					  .key="";
					  .username = username;
					  .dataScadenza = policy.giorni;
					  .maxByte = policy.byte;
					  .nomeAPI = request.nomeAPI;
					  .tempoUso = 0
					};
					keygen@KeyManager( keyData )( encryptedKey )
					// creates and saves
				}
	    	};
			// save acquisto
			with( myAcquisto ){
			  .username = username;
			  .encryptedKey = encryptedKey
			};
			//valueToPrettyString@StringUtils(myAcquisto)(mya);
			//println@Console( mya )();
			saveAcquisto@DAOApi( myAcquisto )( acquistoStatus );
			response = acquistoStatus
	    }
		else {
			response = 0
		}
	}]
	// request {nome, file, sid}
	[sendDocumentation(request)(response){
		r.sid= request.sid;
		r.root= request.nome;
		getUserFromSid@UserManager(r)(user)|
		find@DAOApi( request.nome )( api );
		if( api.username != user ) {
			throw( UserIsNotOriginalUploader )
		};
		with( fileRequest ){
			.content = request.file;
			.filename = "../Uploads/Documentation/"+request.nome+".pdf"
		};
		writeFile@File(fileRequest)() // throws IOException + FileNotFound
	}]
	// request {nome, file, sid}
	[sendLogo(request)(response){
		r.sid= request.sid;
		r.root= request.nome;
		getUserFromSid@UserManager(r)(user)|
		find@DAOApi( request.nome )( api );
		if( api.username != user ) {
			throw( UserIsNotOriginalUploader )
		};
		with( fileRequest ){
			.content = request.file;
			.filename = "../Uploads/Logos/"+request.nome+".png"
		};
		writeFile@File(fileRequest)() // throws IOException + FileNotFound

	}]
	// request {nome, file, sid}
	[sendInterface(request)(response){
		r.sid= request.sid;
		r.root= request.nome;
		getUserFromSid@UserManager(r)(user)|
		find@DAOApi( request.nome )( api );
		if( api.username != user ) {
			throw( UserIsNotOriginalUploader )
		};
		with( fileRequest ){
			.content = request.file;
			.filename = "../Uploads/Interface/"+request.nome+".iol"
		};
		writeFile@File(fileRequest)(); // throws IOException + FileNotFound
		fileRequest.filename = "../CourierGenerator/"+request.nome+".iol";
		writeFile@File(fileRequest)();
		with( crequest ){
			.name = request.nome;
			.location = request.location;
			.protocol = request.protocol
		};
		generate@CourierGenerator( crequest )()

	}]
	[getFrontPageApis( request )( response ){
		getMostDownloadedAPIsId@DAOApi()( api );
		//println@Console( "result of most downloaded apis id" )();
		//valueToPrettyString@StringUtils( api )( strrr );
		//println@Console( strrr )();
		for ( i=0, i<#api.row, i++ ) {
			find@DAOApi(api.row[i].nomeAPI)(apis.row[i])
		};

		//println@Console( "result of find them with find@DAOApi" )();
		//valueToPrettyString@StringUtils( apis )( strrr );
		//println@Console( strrr )();
		for ( i=0, i<#apis.row, i++ ) {
			response.apiPreviews[i].nome = apis.row[i].nomeAPI;
			response.apiPreviews[i].username = apis.row[i].username;
			response.apiPreviews[i].logoAPI = apis.row[i].logoAPI;
			response.apiPreviews[i].ratingMedio = apis.row[i].ratingMedio
		}
	}]
	[getFrontPageApisCategories( request )( response ){
		getMostDownloadedAPIsIdFromCategory@DAOApi(request.root)( api );
		for ( i=0, i<#api.row, i++ ) {
			find@DAOApi(api.row[i].nomeAPI)(apis.row[i])
		};

		/*valueToPrettyString@StringUtils( apis )( strrr );
		println@Console( strrr )();*/
		for ( i=0, i<#apis.row, i++ ) {
			response.apiPreviews[i].nome = apis.row[i].nomeAPI;
			response.apiPreviews[i].username = apis.row[i].username;
			response.apiPreviews[i].logoAPI = apis.row[i].logoAPI;
			response.apiPreviews[i].ratingMedio = apis.row[i].ratingMedio
		}
	}]
	[getBoughtApisList( request )( response ){
		getBoughtApiFromUsername@DAOApi( request.root )( r );
		//valueToPrettyString@StringUtils( r )( strrr );
		//println@Console( strrr )();
		for ( i=0, i<#r.row, i++ ) {
			foreach ( child : r.row[i] ) {
				response.array[i].(child) = r.row[i].(child)
			}
		}
		/*for ( e in r.row ) {
			response.array[#response.array] = e.nomeAPI
		}*/
	}]
	[getUploadedApisList( request )( response ){
		getUploadedApiFromUsername@DAOApi( request.root )( r );
		for ( i=0, i<#r.row, i++ ) {
			foreach ( child : r.row[i] ) {
				response.array[i].(child) = r.row[i].(child)
			}
		}
	}]

	[addPolicyToAPI( request )( response ){
		addPolicyToAPI@DAOApi( request )()
	}]
	// tipo int = id
	[removePolicyFromAPI( request )( response ){
		removePolicyFromAPI@DAOApi( request.root )()
	}]
	// tipo int = id
	[getPolicyFromId( request )( response ){
		getPolicyFromId@DAOApi( request.root )( r );
		response = r
	}]
	// tipo stringa
	[getPoliciesFromApiName( request )( response ){
		getPoliciesFromApiName@DAOApi( request.root )( r );
		response.array -> r.row
		
	}]
	[getAllGateway()( response ){
		getAllGateway@DAOApi()( response )
	}]
}