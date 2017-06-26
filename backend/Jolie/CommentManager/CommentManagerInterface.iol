type CommentType: void {
	.id?: int
	.testo: string
	.rating: int
	.username: string
	.nomeApi: string
}

type CommentTypeArray: void {
  .array [ 0, * ]: CommentType
}

type CommentUpdate: void {
  .id: int
  .text: string
}

type CommentString: void {
   .root: string
 } 

 type CommentInt: void {
   .root: int
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
		getComments ( CommentString )( CommentTypeArray ),
		putComment ( CommentType )( bool ),
		updateComment ( CommentUpdate )( bool ),
		deleteComment ( CommentInt )( bool ),
		getCommentsFromUser ( CommentString )( CommentTypeArray )
}
