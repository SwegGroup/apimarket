include "console.iol"
include "../constants.iol"
include "string_utils.iol"


include "CommentManagerInterface.iol"

include "deploy.iol"

include "../DAOs/DAOInterface.iol"
include "../DAOs/DAOCommentInterface.iol"

execution { concurrent }

outputPort DAOComment {
	Location: DAOCommentLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOCommentInterface
}

init
{
	println@Console( "CommentManager running" )()
}

main
{
	// request is api name
	[getComments ( request )( response ){
		getCommentsFromApiId@DAOComment(request.root)(r);
		/*valueToPrettyString@StringUtils( r )( rrr );
		println@Console( rrr )();*/
		for ( i=0, i<#r.row, i++ ) {
			response.array[i].id = r.row[i].idCommento;
			response.array[i].nomeApi = r.row[i].nomeAPI;
			response.array[i].rating = r.row[i].rating;
			response.array[i].testo = r.row[i].testo;
			response.array[i].username = r.row[i].username
		}
		
	}]
	[getCommentsFromUser ( request )( response ){
		getCommentsFromUser@DAOComment(request.root)(r);
		/*valueToPrettyString@StringUtils( r )( rrr );
		println@Console( rrr )();*/
		for ( i=0, i<#r.row, i++ ) {
			response.array[i].id = r.row[i].idCommento;
			response.array[i].nomeApi = r.row[i].nomeAPI;
			response.array[i].rating = r.row[i].rating;
			response.array[i].testo = r.row[i].testo;
			response.array[i].username = r.row[i].username
		}
		
	}]
	// request = {testo, rating, username, nomeAPI}
	[putComment ( request )( response ){
		create@DAOComment( request )( r );
		if( r==1 ) {
			response=true		  
		}
		else{
			response=false
		}
	}]
	// Admin methods
	[updateComment ( request )( response ){
		// modifica solo testo per moderazione
		// request = {idCommento, newText}
		find@DAOComment( request )( comm );
		comm.testo = request.text;
		update@DAOComment( comm )( r );
		if( r==1 ) {
			response=true		  
		}
		else{
			response=false
		}
	}]
	[deleteComment ( request )( response ){
		delete@DAOComment( request.root )( r );
		if( r==1 ) {
			response=true		  
		}
		else{
			response=false
		};
		find@DAOComment( request.id )( comm );
		comm.testo = request.text;
		update@DAOComment( comm )( response )
	}]
}