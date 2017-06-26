include "../constants.iol"
include "console.iol"

include "AnalyzerInterface.iol"

include "deploy.iol"

execution{ concurrent }

outputPort JavaAnalyzer {
	Interfaces: AnalyzerInterface
}

embedded {
	Java:
		"com.apim.server.services.dataanalysis.ServiceAnalyzer" in JavaAnalyzer
}

init
{
	println@Console( "Analyzer running" )()
}

main {
	// Calculates the current timestamp in nanoseconds and returns it.
	[getTime( request )( response ) {
		getTime@JavaAnalyzer( request )( response )
	}]
	// Calculates the time difference between request.start and request.end and returns in milliseconds
	[timeDiff( request )( response ) {
		timeDiff@JavaAnalyzer( request )( response )
	}]
	// Calculates the byte size of the whole value as a tree and returns it
	[getValueSize( request )( response ) {
		response = 0;
		for ( value in request ) { // in case it's array
			getValueSize@JavaAnalyzer( request )( size );
			response = response + size
		}
	}]
}

