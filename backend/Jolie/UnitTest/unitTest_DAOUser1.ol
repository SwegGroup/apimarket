include "DAOInterface.iol"
include "DAOUserInterface.iol"
include "console.iol"
include "string_utils.iol"
include "../constants.iol"

outputPort DAOUser {
	Location: DAOUserLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOUserInterface
}

main
{
	find@DAOUser( "MarioRossi" )( ris );
	ris.nome = "Carlo";
	ris.username = "CarloRossi";
	valueToPrettyString@StringUtils(ris)(newris);
	println@Console( newris )();
	/*valueToPrettyString@StringUtils( ris )( ka );
	println@Console( ka )();*/
	//update@DAOApi( ris )( response );
	create@DAOUser(ris)(response);
	println@Console( response )()
}