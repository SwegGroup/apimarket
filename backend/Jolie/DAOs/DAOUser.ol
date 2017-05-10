include "database.iol"
include "console.iol"
include "../constants.iol"
include "string_utils.iol"

include "DAOInterface.iol"
include "DAOUserInterface.iol"

execution{ concurrent }

inputPort DaoUser {
	Location: DAOUserLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOUserInterface
}

include "databaseConnection.iol"

main {
	[create( request )( response ) {		
		q = "INSERT INTO Users(username, password, nome, cognome, dataNascita, mail, numeroCarta, indirizzo, telefono, bio, fotoProfilo, saldoCoin, isAdmin) VALUES (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m)";
		q.a = request.username;
		q.b = request.password;
		q.c = request.nome;
		q.d = request.cognome;
		q.e = request.dataNascita;
		q.f = request.mail;
		q.g = request.numeroCarta;
		q.h = request.indirizzo;
		q.i = request.telefono;
		q.j = request.bio;
		q.k = request.fotoProfilo;
		q.l = request.saldoCoin;
		q.m = request.isAdmin;
		update@Database( q )( result )
	}]

	[delete( request )( response ) {		
		q = "DELETE FROM Users WHERE username=:username";
		q.username = request;
		update@Database( q )( result )

	}]

	[find( request )( response ) {		
		q = "SELECT * FROM Users WHERE username=:username";
		q.username = request;
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			throw( PersonNotFound )
		} else {
			response -> result.row[ 0 ]
		}
	}]

	[update( request )( response ) {		
		q = "UPDATE Users SET password=:b, nome=:c, cognome=:d, dataNascita=:e, mail=:f, numeroCarta=:g, indirizzo=:h, telefono=:i, bio=:j, fotoProfilo=:k, saldoCoin=:l, isAdmin=:m WHERE username=:a";
		q.a = request.username;
		q.b = request.password;
		q.c = request.nome;
		q.d = request.cognome;
		q.e = request.dataNascita;
		q.f = request.mail;
		q.g = request.numeroCarta;
		q.h = request.indirizzo;
		q.i = request.telefono;
		q.j = request.bio;
		q.k = request.fotoProfilo;
		q.l = request.saldoCoin;
		q.m = request.isAdmin;
		update@Database( q )( result )

	}]

	[findAll( request )( response ) {		
		q = "SELECT * FROM Users";
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("User database empty")()
		} else {
			response -> result.row
		}
	}]

	[searchByUsername( request )( response ) {		
		q = "SELECT * FROM Users WHERE username LIKE '%"+":k"+"%'";
		q.k = request;
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("User database empty")()
		} else {
			response -> result.row
		}
	}]

	[createSession (request)(response){
		scope( update )
		{
			install( SQLException => 
				println@Console( "User already logged in" )()
			);
			q = "INSERT INTO Sessioni(user, sid) VALUES (:user,:sid)";
			q.user = request.user;
			q.sid = sid = new;
			update@Database( q )( status );
			with( response ){
			  .status = status;
			  .sid = sid
			}
		}
	}]
	[verifySession (request)(response){
		q = "SELECT user FROM Sessioni WHERE sid=:sid";
			q.sid = request.sid;
			query@Database( q )( result );
			
			if ( #result.row == 1 ) {
				response.user = result.row[0].user
			} else {
				throw( SidOrdealException )
			}
	}]

}

