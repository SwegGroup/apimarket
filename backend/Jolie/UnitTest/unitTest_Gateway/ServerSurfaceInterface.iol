type Aggregator_string:string{
	.key:string
}


interface AggregatorSurface {
RequestResponse:
	mock( string )( string ),
	helloworld( Aggregator_string )( Aggregator_string )
}

outputPort Aggregator{
	Location:"local"
	Protocol:null
	Interfaces:AggregatorSurface
}
