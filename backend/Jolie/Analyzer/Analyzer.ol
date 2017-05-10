include "AnalyzerInterface.iol"
include "../constants.iol"

include "deploy.iol"

include "../constants.iol"

execution{ concurrent }

outputPort JavaAnalyzer {
	Interfaces: AnalyzerInterface
}

embedded {
	Java:
		"com.apim.server.services.dataanalysis.ServiceAnalyzer" in JavaAnalyzer
}

main {
	[getTime( request )( response ) {
		getTime@JavaAnalyzer( request )( response )
	}]
	[timeDiff( request )( response ) {
		timeDiff@JavaAnalyzer( request )( response )
	}]
	[getValueSize( request )( response ) {
		response = 0;
		for ( value in request ) { // in case it's array
			getValueSize@JavaAnalyzer( request )( size );
			response = response + size
		}
	}]
}

