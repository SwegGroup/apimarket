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
		valueToPrettyString@StringUtils( q )( str );
		println@Console( str )();
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
		q = "UPDATE Users SET Users.password=:b, nome=:c, cognome=:d, dataNascita=:e, mail=:f, numeroCarta=:g, indirizzo=:h, telefono=:i, bio=:j, fotoProfilo=:k, saldoCoin=:l, isAdmin=:m WHERE username=:a";
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
		//valueToPrettyString@StringUtils(q)(qs);
		//println@Console( qs )();
		update@Database( q )( result )

	}]

	[findAll( request )( response ) {		
		q = "SELECT * FROM Users";
		query@Database( q )( result );

		if ( #result.row == 0 ) {
			println@Console("User database empty")()
		} else {
			response -> result
		}
	}]

	[searchByUsername( request )( response ) {		
		q = "SELECT * FROM Users WHERE username LIKE :k";
		q.k = "%"+request+"%";
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
			q.sid = request;
			query@Database( q )( result );

			if ( #result.row == 1 ) {
				response = result.row[0].user
			} else {
				throw( SidOrdealException )
			}
	}]

	[deleteSession( request )( response ){
		q = "DELETE FROM Sessioni WHERE sid=:sid";
		q.sid = request;
		update@Database( q )( response )
	}]

	[generateRecoveryCode( request )( response ){
		q = "INSERT INTO passwordRecovery VALUES (:a,:b)";
		q.a = request;
		q.b = new;
		update@Database( q )();
		response = q.b
	}]

	[verifyRecoveryCode( request )( response ){
		// gen 20 char
		q = "SELECT * FROM passwordRecovery WHERE code=:code";
		q.code = request;
		query@Database( q )( result );
		if( #result.row == 1 ) {
			new_pass = new;
			substring@StringUtils({ .begin = 0, .end = 7})( new_pass );
			user = result.row[0];
			find(user)(user);
			user.password = new_pass;
			update(user)();
			response = new_pass
		}
		else {
			response = "error"
		};
		q = "DELETE FROM passwordRecovery WHERE code=:code";
		update@Database( q )()
	}]

}

