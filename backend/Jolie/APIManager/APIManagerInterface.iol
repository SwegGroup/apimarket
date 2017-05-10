type APIType: void {
	.nome: string
	.linkFile: string
	.linkPDF: string
	.descrizione: string
	.logoAPI: string
	.prezzo: string
	.policy: string
	.numVoti: int
	.ratingMedio: double
	.tempoMedioRisposta: double
	.totaleChiamate: int
	.traffico: double
	.tempoRispostaTotale: double
	.username: string
}

/*interface APIManager {
	RequestResponse:
		getAPI ( string )( APIType )
		putAPI ( APIType )( bool )
		updateAPI ( string )( APIType )
		deleteAPI ( string )( bool )
}*/


// IN REALTA` SEARCH DOVREBBE RITORNARE UN ARRAY DI API NON APITYPE
// VIEWSTATS DOVREBBE RITORNARE UN TIPO APPROPRIATO
// GLI EDIT PRENDONO UN OGGETTO DI TIPO ENTITY (API QUI) NON STRING
interface APIManagerInterface {
  RequestResponse:
  	editAPIAdmin (APIType)(bool),
  	deleteAPIAdmin (string)(bool),
  	viewAPI (string)(APIType),
  	insertAPI (APIType)(bool),
  	searchAPI (string)(APIType),
  	deleteAPI (string)(bool),
  	editAPI (APIType)(bool),
  	viewStats (string)(string),
  	buyApi (string)(string),
  	incrementInterval(undefined)(undefined),
  	incrementSize(undefined)(undefined),
}

// buyApi richiede l'id e ritorna la chiave?