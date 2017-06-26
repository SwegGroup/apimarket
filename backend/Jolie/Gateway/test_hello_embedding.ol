include "console.iol"
include "GatewayInterface.iol"
include "../constants.iol"

outputPort Gateway {
	Location: GatewayLocation
	Protocol: sodep
	Interfaces: GatewayInterface
}

main {
	with( apiData ){
	  .outputname = "hello";
	  .filecouriername = "helloCourier.ol";
	  .nameofservice = "hello"
	};
	setnewredirection@Gateway( apiData )()
}