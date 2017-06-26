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
	u.root = "PinoG";
	getBoughtApisList@APIManager( u )( response );
	valueToPrettyString@StringUtils(response)(r);
	println@Console( r )()
}