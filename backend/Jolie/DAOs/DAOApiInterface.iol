type DAOPolicy: void {
  .id?: int
  .nomeAPI: string
  .nome: string
  .descrizione: string
  .byte: int
  .giorni: int
  .prezzo: double
}

interface DAOApiInterface {
	RequestResponse:
		getMostDownloadedAPIsId( undefined )( undefined ),
		getMostDownloadedAPIsIdFromCategory( undefined )( undefined ),
		getAPIPreview( undefined )( undefined ),
		getAPIPage( undefined )( undefined ),
		getAPIStats( undefined )( undefined ),
		saveAcquisto( undefined )( undefined ),
		getAPIFromName( undefined )( undefined ),
		getApiFromDescription( undefined )( undefined ),
		getBoughtApiFromUsername( undefined )( undefined ),
		getUploadedApiFromUsername( undefined )( undefined ),
		addPolicyToAPI( DAOPolicy )( undefined ),
		removePolicyFromAPI( int )( undefined ),
		getPolicyFromId( int )( undefined ),
		getPoliciesFromApiName( string )( undefined ),
		getAllGateway( undefined )( undefined )
}

//API preview =
// Id
// Name 
// Author 
// Logo
// Rating
// Price
// Download

// getAPIPage =
//Descrizione 
//Commenti array
//Politics di vendita array (boh non so di sta cosa)
//Documentazione 
//Interfaccia (?)