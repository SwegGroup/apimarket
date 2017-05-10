include "console.iol"
include "../constants.iol"

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

main
{
	// request is api name
	[getComments ( request )( response ){
			getCommentsFromApiId@DAOComment(request)(response)
	}]
	// request = {testo, rating, username, nomeAPI}
	[putComment ( request )( response ){
		create@DAOComment( request )( response )
	}]
	// Admin methods
	[updateComment ( request )( response ){
		// modifica solo testo per moderazione
		// request = {idCommento, newText}
		find@DAOComment( request )( comm );
		comm.testo = request.newText;
		update@DAOComment( comm )( response )
	}]
	[deleteComment ( request )( response ){
		delete@DAOComment( request )( response )
	}]
}