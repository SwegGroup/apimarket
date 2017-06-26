include "runtime.iol"
include "console.iol"
include "string_utils.iol"
include "../constants.iol"
include "GatewayInterface.iol"
include "../APIManager/APIManagerInterface.iol"
include "../CourierGenerator/CourierGeneratorInterface.iol"

include "deploy.iol"

execution{ concurrent }

outputPort APIManager {
	Location: APIManagerLocation
	Protocol: sodep
	Interfaces: APIManagerInterface
}

define courier_redirection_op {
	//TODO: Courier creator
	//dynamic embedding
	with( emb ) {
	    .filepath = filecouriername;
	    .type = "Jolie"
	};
	println@Console( "Embedding "+filecouriername )();
	loadEmbeddedService@Runtime( emb )( handle );
	//setting embedded service to output port
	with (op) {
		.location = handle;
		.name = outputname
	};
	setOutputPort@Runtime( op )();
	println@Console( "Creating outputPort "+outputname )();
	//setting redirection dynamically
	with( redirection ){
		.outputPortName = outputname;
		.resourceName = nameofservice;
		.inputPortName = "Gateway"
	};
	println@Console( "Setting redirection "+nameofservice+" to outputport" )();
	setRedirection@Runtime ( redirection )()
}

define set_api_data {
	outputname = apiData.outputname;
	filecouriername = apiData.filecouriername;
	nameofservice = apiData.nameofservice
}

init {
	println@Console( "Gateway running" )();
	for ( i=0, i<10000000, i++ ) {i=i};
	getAllGateway@APIManager()( array ); // array di ApiType
	for ( i=0, i<#array.row, i++ ) {
		apiData -> array.row[ i ];
		set_api_data;
		courier_redirection_op
	}
}

main
{
	// Call on Api created or updated

	[setnewredirection( request )( response ) {
		apiData -> request;
		set_api_data;
		courier_redirection_op
	}]
}