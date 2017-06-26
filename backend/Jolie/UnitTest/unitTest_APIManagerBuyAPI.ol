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
	u.nomeAPI = "Boxis";
	u.sid = "1234";
	u.durata = "30-12-2020";
	u.maxByte = 100;
	buyApi@APIManager( u )( response );
	println@Console( response )()
}