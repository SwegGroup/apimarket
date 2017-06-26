include "../APIManager/APIManagerInterface.iol"
include "../constants.iol"
include "string_utils.iol"
include "console.iol"

outputPort APIManager {
	Location: APIManagerLocation
	Protocol: sodep
	Interfaces: APIManagerInterface
}

main {
	u.root = "Poxi";
	u.sid = "1234";
	u.username = "PinoG";
	deleteAPI@APIManager( u )( response );
	println@Console( response )()
}