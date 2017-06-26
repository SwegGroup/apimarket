type apiData: void {
  .outputname: string	// outputPort name = API_name
  .filecouriername: string	// courier file name = API name + "Courier.ol"
  .nameofservice: string	// API name in DB
}

interface GatewayInterface {
RequestResponse:
	setnewredirection(undefined)( void )
}