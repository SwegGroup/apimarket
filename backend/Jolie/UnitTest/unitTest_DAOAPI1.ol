include "DAOInterface.iol"
include "DAOApiInterface.iol"
include "console.iol"
include "string_utils.iol"
include "../constants.iol"

outputPort DAOApi {
	Location: DAOApiLocation
	Protocol: sodep
	Interfaces: DAOInterface, DAOApiInterface
}

main
{
	stri = "10";
	find@DAOApi( stri )( ris );
	valueToPrettyString@StringUtils(ris)(str);
	println@Console( str )();
	ris.linkFile = "11";
	//ris.nomeAPI = "12";
	/*valueToPrettyString@StringUtils( ris )( ka );
	println@Console( ka )();*/
	//update@DAOApi( ris )( response );
	//create@DAOApi(ris)(response);
	update@DAOApi(ris)(response);
	println@Console( response )()
}