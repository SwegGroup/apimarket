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
	u = "PinoG";
	u.sid = "1234";
	isAdmin@UserManager( u )( response );
	println@Console( response )()
}