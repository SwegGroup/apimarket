include "../constants.iol"

inputPort KeyManager {
	Location: KeyManagerLocation
	Protocol: sodep
	Interfaces: KeyManagerInterface
}

inputPort KeyManagerJSON {
	Location: KeyManagerLocationJSON
	Protocol: http {
		.format = "json";
		//.keepAlive = false
		.response.headers.("Access-Control-Allow-Methods") = "POST,GET,OPTIONS";
		.response.headers.("Access-Control-Allow-Origin") = "*";
    	.response.headers.("Access-Control-Allow-Headers") = "Content-Type"
	}
	Interfaces: KeyManagerInterface
}
