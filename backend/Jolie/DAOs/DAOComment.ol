include "database.iol"
include "console.iol"
include "../constants.iol"
include "string_utils.iol"

include "DAOInterface.iol"
include "DAOCommentInterface.iol"

execution{ concurrent }

inputPort DaoComment {
	Location: DAOCommentLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOCommentInterface
}

include "databaseConnection.iol"

main {
	[create( request )( response ) {		
		//q = "INSERT INTO Commenti(idCommento, testo, rating, username, nomeAPI) VALUES (:a,:b,:c,:d,:e)";

		// ma se supponiamo che idCommento sia auto increment

		// q.a = request.idCommento;
		q = "INSERT INTO Commenti(testo, rating, username, nomeAPI) VALUES (:b,:c,:d,:e)";
		q.b = request.testo;
		q.c = request.rating;
		q.d = request.username;
		q.e = request.nomeApi;
		update@Database( q )( response )

	}]

	[delete( request )( response ) {		
		q = "DELETE FROM Commenti WHERE idCommento=:idCommento";
		q.idCommento = request;
		update@Database( q )( response )

	}]

	[find( request )( response ) {		
		q = "SELECT * FROM Commenti WHERE idCommento=:idCommento";
		q.idCommento = request.id;
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("Query error")()
		} else {
			response -> result.row[ 0 ]
		}
	}]

	[update( request )( response ) {		
		q = "UPDATE Commenti SET testo=:b, rating=:c, username=:d, nomeAPI=:e WHERE idCommento=:a";
		q.a = request.idCommento;
		q.b = request.testo;
		q.c = request.rating;
		q.d = request.username;
		q.e = request.nomeAPI;
		update@Database( q )( response )

	}]

	[findAll( request )( response ) {		
		q = "SELECT * FROM Commenti";
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("Commenet database is empty")()
		} else {
			response -> result
		}
	}]

	[getCommentsFromApiId( request )( response ) {
		q = "SELECT * FROM Commenti WHERE nomeAPI=:nomeAPI";
		q.nomeAPI = request;
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("No comments present")()
		} else {
			response -> result
		}
	}]

	[getCommentsFromUser( request )( response ) {
		q = "SELECT * FROM Commenti WHERE username=:username";
		q.username = request;
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("No comments present")()
		} else {
			response -> result
		}
	}]

}

