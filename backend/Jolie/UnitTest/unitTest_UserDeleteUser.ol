include "../UserManager/UserManagerInterface.iol"
include "../constants.iol"
include "string_utils.iol"
include "console.iol"

outputPort UserManager {
	Location: UserManagerLocation
	Protocol: sodep
	Interfaces: UserManagerInterface
}

main {
	u = "PinoG";
	u.sid = "1234";
	deleteUser@UserManager( u )( response );
	println@Console( response )()
}