include "console.iol"
include "metajolie.iol"
include "metaparser.iol"
include "file.iol"
include "string_utils.iol"
include "../constants.iol"

include "CourierGeneratorInterface.iol"

inputPort CourierGenerator {
	Location: CourierGeneratorLocation
	Protocol: sodep
	Interfaces: CourierGeneratorInterface
}

execution{ concurrent }

init
{
	println@Console( "CourierGenerator running" )()
}

main
{
	// request { protocol, location, name}
	generate( request )( response ){

		r.filename = "CourierExample.ol";
		readFile@File(r)(courierFile);
		with( courierFile ){
		  .replacement = request.location;
		  .regex = "FaxLocation"
		};
		replaceAll@StringUtils( courierFile )( courierFile );
		println@Console( "Replaced Location" )();
		with( courierFile ){
		  .replacement = request.name+"Interface";
		  .regex = "FaxInterface"
		};
		replaceAll@StringUtils( courierFile )( courierFile );
		println@Console( "Replaced Interface" )();
		with( courierFile ){
		  .replacement = request.protocol;
		  .regex = "FaxProtocol"
		};
		replaceAll@StringUtils( courierFile )( courierFile );
		println@Console( "Replaced Protocol" )();
		with( courierFile ){
		  .replacement = request.name;
		  .regex = "Fax"
		};
		replaceAll@StringUtils( courierFile )( courierFile );
		println@Console( "Replaced Name" )();

		with( writeFileRequest ){
		  .content = courierFile;
		  .filename = request.name+"Courier.ol"
		};
		writeFile@File( writeFileRequest )();
		println@Console( "Written Courier File" )();

		with( inputPortMetaDataRequest ){
		  .name.name = "Aggregator";
		  .filename = writeFileRequest.filename;
		  .name.domain = "whatever"
		};
		getInputPortMetaData@MetaJolie( inputPortMetaDataRequest )( participant );
		println@Console( "Obtained Aggregator MetaData" )();
		getSurfaceWithoutOutputPort@Parser( participant.input )( surface );

		println@Console( "Generated Surface" )();

		// now we write a custom output port

		surface = surface + "outputPort "+request.name+" {
	Location: \""+GatewayLocation+"/!/"+request.name+"\"
	Protocol: "+request.protocol+"
	Interfaces: "+request.name+"Interface
}";

		println@Console( "Generated new outputPort" )();

		with( surface ){
		  .replacement = request.name+"Interface";
		  .regex = "AggregatorInterface"
		};
		replaceAll@StringUtils( surface )( surface );
		println@Console( "Changed port name to actual interface" )();

		// write in gateway folder the courier file:
		writeFileRequest.filename = "../Gateway/"+writeFileRequest.filename;
		writeFile@File( writeFileRequest )();
		println@Console( "Placed in Gateway folder" )();

		with( writeFileRequest ){
		  .content = surface;
		  .filename = "../Uploads/Surfaces/"+request.name+".iol"
		};
		writeFile@File( writeFileRequest )();
		println@Console( "Placed in Surface Folder" )();
		delete@File( request.name+".iol" )();
		delete@File( request.name+"Courier.ol" )();
		println@Console( "Clean up" )()
	}
}

