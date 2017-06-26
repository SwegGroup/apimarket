include "console.iol"
include "../constants.iol"
include "APIManagerInterface.iol"
include "string_utils.iol"
include "file.iol"
include "converter.iol"

outputPort APIManager {
	Location: APIManagerLocation
	Protocol: sodep
	Interfaces: APIManagerInterface
}

main
{
	with( APIData ){
	  .nome = "Fax";
	  .descrizione = "Io sono una descrizione LOL";
	  .location = "socket://localhost:44444";
	  .protocol = "sodep";
	  .idCategoria = 0;
	  .sid = "30057b22-d33a-43ae-87d9-16ad59b5d428"
	};
	readFileRequest.filename = "documentazione.txt";
	readFile@File(readFileRequest)(APIData.documentazione);
	readFileRequest.filename = "fax.iol";
	readFile@File(readFileRequest)(APIData.interfaccia);
	/*readFileRequest.filename = "logo.png";
	readFileRequest.format = "binary";
	readFile@File(readFileRequest)(APIData.logo);
	rawToBase64@Converter(APIData.logo)(APIData.logo);*/
	APIData.logo = "http://mylogo.png";
	insertAPI@APIManager( APIData )();
	println@Console( "Done" )()
}