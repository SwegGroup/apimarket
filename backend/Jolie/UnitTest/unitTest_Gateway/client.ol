include "console.iol"
include "../constants.iol"
include "ServerInterfaceSurface.iol"

outputPort Server {
	Location: GatewayLocation+"/!/Server"
	Protocol: sodep
	Interfaces: ServerInterfaceSurface
}

main
{
	request = "Hello";
	helloworld@Server( request )( response )
}