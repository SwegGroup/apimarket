include "database.iol"
include "console.iol"
include "../constants.iol"

include "DAOInterface.iol"

execution{ concurrent }

inputPort DaoKey {
	Location: DAOKeyLocation
	Protocol: sodep
	Interfaces: DAOInterface
}

include "databaseConnection.iol"

main {
	[create( request )( response ) {		
		q = "INSERT INTO Key(key, dataScadenza, maxByte, tempoUso, username, nomeAPI, usedByte) VALUES (:a,:b,:c,:d,:e,:f,:g)";
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
		q = "DELETE FROM Key WHERE key=:key";
		q.key = request.key;
		update@Database( q )( response );

	}]

	[find( request )( response ) {		
		q = "SELECT * FROM Key WHERE key=:key";
		q.key = request.key;
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("Query error")()
		} else {
			response.address = result.row[ 0 ].address
		}
	}]

	[update( request )( response ) {		
		q = "UPDATE Key SET dataScadenza=:b, maxByte=:c, tempoUso=:d, username=:e, nomeAPI=:f WHERE key=:a";
		q.a = request.key;
		q.b = request.dataScadenza;
		q.c = request.maxByte;
		q.d = request.tempoUso;
		q.e = request.username;
		q.f = request.nomeAPI;
		update@Database( q )( response );

	}]

	[findAll( request )( response ) {		
		q = "SELECT * FROM Key";
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("Key database empty")()
		} else {
			response.address = result.row[ 0 ].address
		}
	}]
}

