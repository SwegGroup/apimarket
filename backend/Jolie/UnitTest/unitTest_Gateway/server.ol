include "ServerInterface.iol"

inputPort Server {
	Location: "socket://localhost:20000"
	Protocol: sodep
	Interfaces: ServerInterface
}

main
{
	helloworld( request )( response ){
		response = request + " World!"
	}
}