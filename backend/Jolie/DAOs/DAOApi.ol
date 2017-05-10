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
	[create( request )( response ) {		
			q = "INSERT INTO API(nomeAPI, linkFile, linkPdf, descrizione, logoAPI, prezzo, policy, numeroVoti, ratingMedio, tempoMedioRisposta, totaleChiamate, traffico, tempoRispostaTotale, username, idCategoria) VALUES (:a,:b,:c,:l,:m,:n,:o,:d,:e,:f,:g,:h,:i,:j,:k)";
			q.a = request.nomeAPI;
			q.b = request.linkFile;
			q.c = request.linkPdf;
			q.l = request.descrizione;
			q.m = request.logoAPI;
			q.n = request.prezzo;
			q.o = request.policy;
			q.d = request.numeroVoti;
			q.e = request.ratingMedio;
			q.f = request.tempoMedioRisposta;
			q.g = request.totaleChiamate;
			q.h = request.traffico;
			q.i = request.tempoRispostaTotale;
			q.j = request.username;
			q.k = request.idCategoria;
			update@Database( q )( response ) // sarebbe response.status nel suo esempio

		}]

	[delete( request )( response ) {		
			q = "DELETE FROM API WHERE nomeAPI=:nomeApi";
			q.nomeApi = request.nomeAPI;
			update@Database( q )( response )
		}]

	[find( request )( response ) {
			q = "SELECT * FROM API WHERE nomeAPI=:nomeApi";
			q.nomeApi = request;
			query@Database( q )( result );
	
			if ( #result.row == 1 ) {
				response -> result.row[0]
			} else {
				println@Console("Query error")()
			}
		}]

	[update( request )( response ) {
			q = "UPDATE API SET nomeAPI=:a,linkFile=:b,linkPdf=:c,descrizione=:l,logoAPI=:m,prezzo=:n,policy=:o,numeroVoti=:d,ratingMedio=:e,tempoMedioRisposta=:f,totaleChiamate=:g,traffico=:h,tempoRispostaTotale=:i,username=:j,idCategoria=:k WHERE nomeAPI=:a";
			q.a = request.nomeAPI;
			q.b = request.linkFile;
			q.c = request.linkPdf;
			q.l = request.descrizione;
			q.m = request.logoAPI;
			q.n = request.prezzo;
			q.o = request.policy;
			q.d = request.numeroVoti;
			q.e = request.ratingMedio;
			q.f = request.tempoMedioRisposta;
			q.g = request.totaleChiamate;
			q.h = request.traffico;
			q.i = request.tempoRispostaTotale;
			q.j = request.username;
			q.k = request.idCategoria;
			update@Database( q )( response )
		}]

	[findAll( request )( response ) {		
			q = "SELECT * FROM API";
			query@Database( q )( result );
	
			if ( #result.row == 0 ) {
				println@Console("API database empty")()
			} else {
				response -> result.row
			}
		}]

		// Leggi nell'interfaccia per avere un idea di cosa ritornano
	[getMostDownloadedAPIsId( undefined )( response ){
			q = "SELECT * FROM API WHERE nomeAPI IN (SELECT nomeApi FROM (SELECT nomeAPI, MAX(NUM) FROM (SELECT nomeAPI, COUNT(*) AS NUM FROM Key GROUP BY nomeAPI) AS B) AS C)";
		    query@Database( q )( result );
	
			if ( #result.row == 0 ) {
				println@Console("Query error")()
			} else {
				response -> result.row
			}
		}]

	[getMostDownloadedAPIsIdFromCategory( request )( response ){
			q = "SELECT * FROM API WHERE nomeAPI IN (SELECT nomeApi FROM (SELECT nomeAPI, MAX(NUM) FROM (SELECT K.nomeAPI, COUNT(*) AS NUM FROM Key AS K, API AS A, Categoria AS C WHERE K.nomeAPI=A.nomeAPI AND A.idCategoria = C.idCategoria AND C.categoria=:categoria GROUP BY nomeAPI) AS B) AS C)";
		    q.categoria = request.categoria;
		    query@Database( q )( result );
	
			if ( #result.row == 0 ) {
				println@Console("Query error")()
			} else {
				response -> result.row
			}
		}]

	[getAPIPreview( request )( response ){
			q = "SELECT nomeAPI, username, logoAPI, ratingMedio, prezzo, traffico FROM API WHERE nomeAPI=:nomeAPI";
			q.nomeAPI = request.nomeAPI;
			query@Database( q )( result );
			
			if ( #result.row == 0 ) {
				println@Console("Query error")()
			} else {
				response -> result.row[0]
			}
		}]

	[getAPIPage( undefined )( undefined ){
			q = "SELECT descrizione, policy, linkPDF, linkFile FROM API WHERE nomeAPI=:nomeAPI";
			q.nomeAPI = request.nomeAPI;
			query@Database( q )( result );
			
			if ( #result.row == 0 ) {
				println@Console("Query error")()
			} else {
				response -> result.row[0]
			}
		}]

	[getAPIStats( request )( response ){
			q = "SELECT tempoMedioRisposta, totaleChiamate, traffico, tempoRispostaTotale FROM API WHERE nomeAPI=:nomeAPI";
			q.nomeAPI = request.nomeAPI;
			query@Database( q )( result );
			
			if ( #result.row == 0 ) {
				println@Console("Query error")()
			} else {
				response -> result.row[0]
			}
		}]
	[getAPIFromName( request )( response ){
		q = "SELECT * FROM API WHERE nomeAPI LIKE %:k%";
			q.k = request.nomeAPI;
			query@Database( q )( result );
			
			if ( #result.row == 0 ) {
				println@Console("Query error")()
			} else {
				response -> result.row
			}
	}]
	[getApiFromDescription(request)(response){
		q = "SELECT * FROM API WHERE descrizione LIKE %:k%";
			q.k = request.nomeAPI;
			query@Database( q )( result );
			
			if ( #result.row == 0 ) {
				println@Console("Query error")()
			} else {
				response -> result.row
			}
	}]
	[saveAcquisto( request )(response ){
		x = 0
	}]
}

