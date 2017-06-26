include "database.iol"
include "console.iol"
include "string_utils.iol"
include "../constants.iol"

include "DAOInterface.iol"
include "DAOApiInterface.iol"

execution{ concurrent }

inputPort DAOApi {
	Location: DAOApiLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOApiInterface
}

include "databaseConnection.iol"

main {
	//INSERT INTO API(nomeAPI, linkFile, linkPdf, descrizione, logoAPI, numeroVoti, ratingMedio, tempoMedioRisposta, totaleChiamate, traffico, tempoRispostaTotale, username, idCategoria, location, protocol) VALUES ("hello","Uploads/Interface/hello.iol","Uploads/Documentation/hello.pdf","Io sono una descrizione","Uploads/Logos/hello.png",0,0.0,0.0,0,0.0,0.0,"PinoG",0,"socket://localhost:33333","sodep")

	[create( request )( response ) {
			q = "INSERT INTO API(nomeAPI, linkFile, linkPdf, descrizione, logoAPI, numeroVoti, ratingMedio, tempoMedioRisposta, totaleChiamate, traffico, tempoRispostaTotale, username, idCategoria, location, protocol) VALUES (:a,:b,:c,:l,:m,:d,:e,:f,:g,:h,:i,:j,:k,:p,:q)";
			q.a = request.nomeAPI;
			q.b = request.linkFile;
			q.c = request.linkPDF;
			q.d = request.numeroVoti;
			q.e = request.ratingMedio;
			q.f = request.tempoMedioRisposta;
			q.g = request.totaleChiamate;
			q.h = request.traffico;
			q.i = request.tempoRispostaTotale;
			q.j = request.username;
			q.k = request.idCategoria;
			q.l = request.descrizione;
			q.m = request.logoAPI;
			q.p = request.location;
			q.q = request.protocol;
			valueToPrettyString@StringUtils( q )( qry );
			println@Console( qry )();
			update@Database( q )( response ) // sarebbe response.status nel suo esempio

		}]

	[delete( request )( response ) {		
			q = "DELETE FROM API WHERE nomeAPI=:nomeApi";
			q.nomeApi = request;
			update@Database( q )( response )
		}]

	[find( request )( response ) {
			q = "SELECT * FROM API WHERE nomeAPI=:nomeApi";
			q.nomeApi = request;
			query@Database( q )( result );
	
			if ( #result.row == 1 ) {
				response -> result.row[0]
			} else {
				println@Console("Query error find")()
			}
		}]

	[update( request )( response ) {
			q = "UPDATE API SET linkFile=:b,linkPdf=:c,descrizione=:l,logoAPI=:m,numeroVoti=:d,ratingMedio=:e,tempoMedioRisposta=:f,totaleChiamate=:g,traffico=:h,tempoRispostaTotale=:i,username=:j,idCategoria=:k, location=:p, protocol=:q WHERE nomeAPI=:a";
			q.a = request.nomeAPI;
			q.b = request.linkFile;
			q.c = request.linkPdf;
			q.d = request.numeroVoti;
			q.e = request.ratingMedio;
			q.f = request.tempoMedioRisposta;
			q.g = request.totaleChiamate;
			q.h = request.traffico;
			q.i = request.tempoRispostaTotale;
			q.j = request.username;
			q.k = request.idCategoria;
			q.l = request.descrizione;
			q.m = request.logoAPI;
			q.p = request.location;
			q.q = request.protocol;
			//valueToPrettyString@StringUtils( q )( qry );
			//println@Console( qry )();
			update@Database( q )( response )
		}]

	[findAll( request )( response ) {		
			q = "SELECT * FROM API";
			query@Database( q )( result );
	
			if ( #result.row == 0 ) {
				println@Console("API database empty")()
			} else {
				response -> result
			}
		}]

		// Leggi nell'interfaccia per avere un idea di cosa ritornano
	[getMostDownloadedAPIsId( undefined )( response ){
			q = "SELECT API.nomeAPI FROM API LEFT JOIN (SELECT nomeAPI, COUNT(*) AS num FROM Chiave GROUP BY nomeAPI ORDER BY num DESC) as k ON k.nomeAPI = API.nomeAPI ORDER BY COALESCE(k.num, 0) DESC LIMIT 10";
		    query@Database( q )( result );
		    //valueToPrettyString@StringUtils(result)(dc);
		    //println@Console( dc )();
	
			if ( #result.row == 0 ) {
				println@Console("Query error getMostDownloadedAPIsId")()
			} else {
				response -> result
			}
		}]

	[getMostDownloadedAPIsIdFromCategory( request )( response ){
			q = "SELECT API.nomeAPI FROM API LEFT JOIN (SELECT nomeAPI FROM Chiave GROUP BY nomeAPI ORDER BY COUNT(*) DESC) as k ON API.nomeAPI = k.nomeAPI WHERE idCategoria = :categoria LIMIT 10";
		    q.categoria = request;
		    query@Database( q )( result );
	
			if ( #result.row == 0 ) {
				println@Console("Query error getMostDownloadedAPIsIdFromCategory")()
			} else {
				response -> result
			}
		}]

	[getAPIPreview( request )( response ){
			q = "SELECT nomeAPI, username, logoAPI, ratingMedio, traffico FROM API WHERE nomeAPI=:nomeAPI";
			q.nomeAPI = request.nomeAPI;
			query@Database( q )( result );
			
			if ( #result.row == 0 ) {
				println@Console("Query error getAPIPreview")()
			} else {
				response -> result.row[0]
			}
		}]

	[getAPIPage( request )( response ){
			q = "SELECT descrizione, linkPDF, linkFile FROM API WHERE nomeAPI=:nomeAPI";
			q.nomeAPI = request.nomeAPI;
			query@Database( q )( result );
			
			if ( #result.row == 0 ) {
				println@Console("Query error getAPIPage")()
			} else {
				response -> result.row[0]
			}
		}]
		//SELECT COUNT(*) FROM Acquisti JOIN Chiave ON Acquisti.chiave = Chiave.chiave JOIN API ON Chiave.nomeAPI = API.nomeAPI WHERE Chiave.nomeAPI = "pippo"
	[getAPIStats( request )( response ){
			q = "SELECT COUNT(*) as downloads, tempoMedioRisposta, totaleChiamate, traffico, tempoRispostaTotale FROM Acquisti JOIN Chiave ON Acquisti.chiave = Chiave.chiave JOIN API ON Chiave.nomeAPI = API.nomeAPI WHERE Chiave.nomeAPI =:nomeAPI";
			q.nomeAPI = request;
			query@Database( q )( result );
			
			if ( #result.row == 0 ) {
				println@Console("Query error getAPIStats")()
			} else {
				response -> result.row[0]
			}
		}]
	[getAPIFromName( request )( response ){
		q = "SELECT * FROM API WHERE nomeAPI LIKE :k";
			q.k = "%"+request+"%";
			query@Database( q )( result );
			
			if ( #result.row == 0 ) {
				println@Console("Query error getAPIFromName")()
			} else {
				response -> result.row
			}
	}]
	[getApiFromDescription(request)(response){
		q = "SELECT * FROM API WHERE (UCASE(descrizione) LIKE UCASE(:k) OR UCASE(nomeAPI) LIKE UCASE(:k))";
		q.k = "%"+request.root+"%";
		if( is_defined( request.idCategoria ) ) {
			q += " AND idCategoria = :j";
			q.j = request.idCategoria
		};
		query@Database( q )( result );

		valueToPrettyString@StringUtils(result)(str);
		println@Console( str )();
		
		if ( #result.row == 0 ) {
			println@Console("Query error getApiFromDescription")()
		} else {
			response -> result
		}
	}]

	[saveAcquisto( request )(response ){
		q = "INSERT INTO Acquisti(username, chiave) VALUES (:a,:b)";
		q.a = request.username;
		q.b = request.encryptedKey;
		update@Database( q )( response )
	}]

	[getBoughtApiFromUsername( request )( response ){
		q = "SELECT DISTINCT API.nomeAPI AS nome,linkFile,location,protocol,linkPdf AS linkPDF,logoAPI,descrizione,numeroVoti AS numVoti,ratingMedio,tempoMedioRisposta,totaleChiamate,traffico,tempoRispostaTotale,API.username, Chiave.chiave, Chiave.dataScadenza, Chiave.usedByte, Chiave.maxByte FROM Chiave, Acquisti, API WHERE Chiave.nomeAPI = API.nomeAPI AND Chiave.chiave = Acquisti.chiave AND Chiave.username = :username";
		q.username = request;
		query@Database( q )( result );
	
		if ( #result.row == 0 ) {
			println@Console("API database empty")()
		} else {
			response -> result
		}
	}]

	[getUploadedApiFromUsername( request )( response ){
		q = "SELECT nomeAPI as nome,linkFile,location,protocol,linkPdf as linkPDF,logoAPI,descrizione,numeroVoti AS numVoti,ratingMedio,tempoMedioRisposta,totaleChiamate,traffico,tempoRispostaTotale,username  FROM API WHERE username = :username";
		q.username= request;
		query@Database( q )( result );
	
		if ( #result.row == 0 ) {
			println@Console("API database empty")()
		} else {
			response -> result
		}
	}]
	// tipo policy senza id
	[addPolicyToAPI( request )( response ){
		q = "INSERT INTO policy(nomeAPI, nome, descrizione, prezzo, byte, giorni) VALUES (:a,:b,:c,:d,:e,:f)";
		q.a = request.nomeAPI;
		q.b = request.nome;
		q.c = request.descrizione;
		q.d = request.prezzo;
		q.e = request.byte;
		q.f = request.giorni;
			valueToPrettyString@StringUtils( q )( qry );
			println@Console( qry )();
		update@Database( q )( response )
	}]
	// tipo int = id
	[removePolicyFromAPI( request )( response ){
		q = "DELETE FROM policy WHERE id=:id";
		q.id = request;
		update@Database( q )( response )
	}]
	// tipo int = id
	[getPolicyFromId( request )( response ){
		q = "SELECT * FROM policy WHERE id=:id";
		q.id = request;
		query@Database( q )( result );
	
		if ( #result.row == 0 ) {
			throw( PolicyOrdealException )
		} else {
			response -> result.row[0]
		}
	}]

	[getPoliciesFromApiName( request )( response ){
		q = "SELECT * FROM policy WHERE nomeAPI=:nomeAPI";
		q.nomeAPI = request;
		query@Database( q )( result );
	
		if ( #result.row == 0 ) {
			println@Console("didn't find policies")()
		} else {
			response -> result
		}
	}]
	[getAllGateway( request )( response ){
		q = "SELECT CONCAT(nomeAPI,'Courier') as outputname, CONCAT(nomeAPI,'Courier.ol') as filecouriername, nomeAPI as nameofservice from API";
		query@Database( q )( response );
		println@Console("found"+#result.row+" apis info for GW")()
	}]
}

