include "console.iol"
include "CourierGeneratorInterface.iol"
include "../constants.iol"

outputPort CourierGenerator {
	Location: CourierGeneratorLocation
	Protocol: sodep
	Interfaces: CourierGeneratorInterface
}

main
{
	with( request ){
	  .location = "socket://localhost:9999";
	  .name = "hello";
	  .protocol = "sodep"
	};
	generate@CourierGenerator( request )( response )
}