include "../Analyzer/AnalyzerInterface.iol"
include "console.iol"
include "string_utils.iol"
include "../constants.iol"

outputPort Analyzer {
	Location: AnalyzerLocation
	Protocol: sodep
	Interfaces: AnalyzerInterface
}

main
{
	getTime@Analyzer()(start);
	for ( i=0, i<10000, i++ ) {i=i};
	getTime@Analyzer()(end);
	timeDiff@Analyzer( { .start=start, .end=end } )( result );
	with( value){
	  .fist = "first";
	  .second = "second";
	  .last = "last";
	  .lastest = "lastest"
	};
	value.a.b.c.d.e.f = 55555;
	value.e.f.g.h.i = "hahaha";
	getValueSize@Analyzer( value )( size );
	valueToPrettyString@StringUtils( result )( myr );
	valueToPrettyString@StringUtils( size )( mys );
	println@Console( "il tempo calcolato è "+myr+" e il size è "+mys )()
}