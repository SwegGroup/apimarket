type timeDiffType: void {
  .start: undefined
  .end: undefined
}

interface AnalyzerInterface {
	RequestResponse:
		getTime( void )( undefined ),
		timeDiff( timeDiffType )( double ),
		getValueSize( undefined )( int )
}