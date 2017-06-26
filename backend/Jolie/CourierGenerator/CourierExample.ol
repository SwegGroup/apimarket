/*
		This file is a template and you need to replace:
			FaxProtocol
			FaxLocation
			FaxInterface
			Fax
*/
include "../Analyzer/AnalyzerInterface.iol"
include "../KeyManager/KeyManagerInterface.iol"
include "../APIManager/APIManagerInterface.iol"
include "../constants.iol"

//include microservice interface file
include "../Uploads/Interface/Fax.iol"

execution { concurrent }

type AuthenticationData: any {
    .key:string
}

/* this a type extender which extends all the RequestResponse of a given interface with
   type AuthenticationData in case of request message, no types in case of response messages
   and, finally, it adds fault KeyNotValid */
interface extender AuthInterfaceExtender {
	RequestResponse:
	    *( AuthenticationData )( void ) 
}

interface AggregatorInterface {
RequestResponse:
    mock(string)(string)
}

outputPort Analyzer {
	Location: AnalyzerLocation
	Protocol: sodep
	Interfaces: AnalyzerInterface
}

outputPort KeyManager {
	Location: KeyManagerLocation
	Protocol: sodep
	Interfaces: KeyManagerInterface
}

outputPort APIManager {
	Location: APIManagerLocation
	Protocol: sodep
	Interfaces: APIManagerInterface
}

// outputport microservice
outputPort Fax {
	Interfaces: FaxInterface
	Location: "FaxLocation"
	Protocol: FaxProtocol
}

inputPort Aggregator {
	Location: "local"
	Interfaces: AggregatorInterface
	Protocol: sodep
  /* here we aggregates the outputPort Fax extended using the extender AuthInterfaceExtender
     thus all the interfaces of the Fax outputPort (FaxInterface) will be extended using
     the AuthInterfaceExtender */
	Aggregates: Fax with AuthInterfaceExtender
}

/* this courier will be applied to inputPort Aggregator */
courier Aggregator {
  /* all the RequestResponse of interface FaxInterface will be pre-processed by the following code */
	[ interface FaxInterface( request )( response ) ] {
    /* if the key is ok, the incoming message will be forwarded to the target port (Fax) */
    anal.nomeAPI = "Fax"; // get api name from key
    anal.key = key.root = request.key;
    key.api = "Fax";
    checkKey@KeyManager( key )( val );
    if( val ) {

	    {
	    	getTime@Analyzer()( time.start );
	    	forward ( request )( response );
	    	getTime@Analyzer()( time.end )
	    };

	    {
	    	timeDiff@Analyzer( time )( anal.interval ) |
	    	getValueSize@Analyzer( response )( anal.size )
	    };

	    {
	    	// update API data in database
	    	incrementSize@APIManager( anal )() |
	    	incrementInterval@APIManager( anal )()
	    }
    }
    else {
    	throw( KeyNotValid )
    }
  }
}

main
{
    mock( r )( rs ) {
    	rs = void
    }
}
