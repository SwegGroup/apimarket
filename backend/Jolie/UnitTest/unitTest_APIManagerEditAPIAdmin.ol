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
	u.nome = "Paperx";
	u.descrizione = "little boxis";
	u.prezzo = 12.00;
	u.sid = "1234";
	u.root = "PinoG";
	u.filename = "text.txt";
	u.file = "test";
	editAPIAdmin@APIManager( u )( response );
	println@Console( response )()
}