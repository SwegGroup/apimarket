type CommentType: void {
	.id: int
	.testo: string
	.rating: int
	.username: string
	.nomeApi: string
}

/*interface CommentManager {
	RequestResponse:
		getComments ( string )( CommentType )
		putComment ( CommentType )( bool )
		updateComment ( string )( CommentType )
		deleteComment ( string )( bool )
}*/

interface CommentManagerInterface {
	RequestResponse:
		getComments ( string )( CommentType ),
		putComment ( CommentType )( bool ),
		updateComment ( CommentType )( bool ),
		deleteComment ( string )( bool )
}