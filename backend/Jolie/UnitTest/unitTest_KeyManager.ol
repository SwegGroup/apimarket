include "../KeyManager/KeyManagerInterface.iol"
include "console.iol"
include "string_utils.iol"
include "../constants.iol"

outputPort KeyManager {
	Location: KeyManagerLocation
	Protocol: sodep
	Interfaces: KeyManagerInterface
}

main
{
	keygen@KeyManager()( myNewKey );
	//checkKey@KeyManager( myNewKey )( response );
	// check key expiration date and 
}