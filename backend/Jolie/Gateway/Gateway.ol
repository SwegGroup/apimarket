include "runtime.iol"
include "console.iol"
include "GatewayInterface.iol"
include "../APIManager/APIManagerInterface.iol"
include "CourierGenerator.iol"
include "../constants.iol"

include "deploy.iol"

outputPort APIManager {
	Location: APIManagerLocation
	Protocol: sodep
	Interfaces: APIManagerInterface
}

outputPort CourierGenerator {
	Interfaces: CourierGeneratorInterface
}

embedded {
  Java: "com.apim.server.services.gateway.ServiceCourierGenerator" in CourierGenerator
}

define courier_redirection_op {
	//TODO: Courier creator
	//dynamic embedding
	with( emb ) {
	    .filepath = filecouriername;
	    .type = "Jolie"
	 };
	loadEmbeddedService@Runtime( emb )( handle );
	//setting embedded service to output port
	with (op) {
		.location = handle;
		.name = outputname
	};
	setOutputPort@Runtime( op )();
	//setting redirection dynamically
	with( redirection ){
		.outputPortName = outputname;
		.resourceName = nameofservice;
		.inputPortName = "Gateway"
	};
	setRedirection@Runtime ( redirection )()
}

define set_api_data {
	outputname = apiData.outputname;
	filecouriername = apiData.filecouriername;
	nameofservice = apiData.nameofservice
}

init {
	println@Console( "Running" )()
	/*getAll@APIManager()( array ); // array di ApiType
	for ( i=0, i<#array, i++ ) {
		apiData -> array[ i ];
		set_api_data;
		//outputname = "FaxCourier";
		//filecouriername = "FaxCourier.ol";
		//nameofservice = "fax";
		//calling operation
		courier_redirection_op
	}*/
}

main
{
	// Call on Api created or updated
  [setnewredirection( request )( response ) {
       apiData = request;
       set_api_data;
       courier_redirection_op
  }]
}