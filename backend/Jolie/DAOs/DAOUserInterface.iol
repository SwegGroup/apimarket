interface DAOUserInterface{
	RequestResponse:
		searchByUsername(undefined)(undefined),
		createSession (undefined)(undefined),
		verifySession (string)(string),
		deleteSession ( string )( int ),
		generateRecoveryCode ( string )( string ),
		verifyRecoveryCode ( string )( string )
}