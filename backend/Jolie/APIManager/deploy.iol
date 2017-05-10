include "../constants.iol"

inputPort APIManager {
	Location: APIManagerLocation
	Protocol: sodep
	Interfaces: APIManagerInterface
}

inputPort APIManagerJSON {
	Location: APIManagerLocationJSON
	Protocol: http {
		.format = "json";
		//.keepAlive = false
		.response.headers.("Access-Control-Allow-Methods") = "POST,GET,OPTIONS";
		.response.headers.("Access-Control-Allow-Origin") = "*";
    	.response.headers.("Access-Control-Allow-Headers") = "Content-Type"
	}
	Interfaces: APIManagerInterface
}