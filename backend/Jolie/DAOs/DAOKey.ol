include "database.iol"
include "console.iol"
include "../constants.iol"
include "string_utils.iol"

include "DAOInterface.iol"
include "DAOKeyInterface.iol"

execution{ concurrent }

inputPort DaoKey {
	Location: DAOKeyLocation
	Protocol: sodep
	Interfaces: DAOInterface
}

include "databaseConnection.iol"

main {
	[create( request )( response ) {		
		q = "INSERT INTO Chiave(chiave, dataScadenza, maxByte, tempoUso, username, nomeAPI, usedByte) VALUES (:a,CURDATE() + INTERVAL :b DAY,:c,:d,:e,:f,:g)";
		q.a = request.key;
		q.b = request.dataScadenza;
		q.c = request.maxByte;
		q.d = request.tempoUso;
		q.e = request.username;
		q.f = request.nomeAPI;
		q.g = request.usedByte;
		update@Database( q )( response )
	}]

	[delete( request )( response ) {		
		q = "DELETE FROM Chiave WHERE chiave=:key";
		q.key = request;
		update@Database( q )( response )

	}]

	[find( request )( response ) {		
		q = "SELECT * FROM Chiave WHERE chiave=:key";
		q.key = request;
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("Query error")()
		} else {
			response.key = result.row[ 0 ].chiave;
			response.dataScadenza = result.row[ 0 ].dataScadenza;
			response.maxByte = result.row[ 0 ].maxByte;
			response.tempoUso = result.row[ 0 ].tempoUso;
			response.username = result.row[ 0 ].username;
			response.nomeAPI = result.row[ 0 ].nomeAPI;
			response.usedByte = result.row[ 0 ].usedByte
		}
	}]

	[update( request )( response ) {		
		q = "UPDATE Chiave SET dataScadenza=:b, maxByte=:c, usedByte=:g, tempoUso=:d, username=:e, nomeAPI=:f WHERE chiave=:a";
		q.a = request.key;
		q.b = request.dataScadenza;
		q.c = request.maxByte;
		q.d = request.tempoUso;
		q.e = request.username;
		q.f = request.nomeAPI;
		q.g = request.usedByte;
		update@Database( q )( response )

	}]

	[findAll( request )( response ) {		
		q = "SELECT * FROM Chiave";
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("Key database empty")()
		} else {
			response -> result

		}
	}]
}

