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
	u = "Pino";
	u.sid = "1234";
	searchUser@UserManager( u )( response );
	valueToPrettyString@StringUtils(response)(r);
	println@Console( r )()
}