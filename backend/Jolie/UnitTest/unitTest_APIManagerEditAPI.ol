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
	u.descrizione = "long table";
	u.prezzo = 140.00;
	u.sid = "1234";
	u.root = "PinoG";
	u.filename = "text.txt";
	u.file = "test";
	editAPI@APIManager( u )( response );
	println@Console( response )()
}