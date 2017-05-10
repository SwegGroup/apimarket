include "../constants.iol"

inputPort CommentManager {
	Location: CommentManagerLocation
	Protocol: sodep
	Interfaces: CommentManagerInterface
}

inputPort CommentManagerJSON {
	Location: CommentManagerLocationJSON
	Protocol: http {
		.format = "json";
		//.keepAlive = false
		.response.headers.("Access-Control-Allow-Methods") = "POST,GET,OPTIONS";
		.response.headers.("Access-Control-Allow-Origin") = "*";
    	.response.headers.("Access-Control-Allow-Headers") = "Content-Type"
	}
	Interfaces: CommentManagerInterface
}