type APIType: void {
	.nome: string
	.linkFile: string
	.linkPDF: string
	.descrizione: string
	.logoAPI: string
	.numVoti: int
	.ratingMedio: double
	.tempoMedioRisposta: double
	.totaleChiamate: int
	.traffico: double
	.tempoRispostaTotale: double
	.username: string
	.location: string
	.protocol: string
  .idCategoria?: int
}

type APIPreview: void {
	.nome: string
	.username: string
	.logoAPI: string
	.ratingMedio: double
}

type APIUploadType: void {
	.nome: string
	.interfaccia: string // iol
	.documentazione: string //raw base64 //pdf
	.logo: string //raw base64 // png
	.descrizione: string
	.location: string
	.protocol: string
  .idCategoria: int
	.sid: string
}

type APIEditType: void {
	.nome: string
	.descrizione: string
	.sid: string
	//.filename: string
  .idCategoria: int
	// .file: string     non si manda più il file in edit
}

type UploadRaw: void {
	.nome: string
	.content: string // raw base64
	.sid: string
}

type UploadInterface: void {
	.nome: string
	.location: string
	.protocol: string
	.content: string
	.sid: string
}

type BuyRequestType: void{
	.nomeAPI: string
	.sid: string
	.username: string
	.policy: int // chiave
}

type IncrementType: void {
  .nomeAPI: string
  .key: string
  .size: int
  .interval: double
}

type APIName: void {
  .root: string
}

type APIInt: void {
  .root: int
}

type SessionStringAPI: void {
  .root: string
  .sid: string
  .username: string
}

type Policy: void {
  .id?: int
  .nomeAPI: string
  .nome: string
  .descrizione: string
  .byte: int
  .giorni: int
  .prezzo: double
}

type APIPreviewArray: void {
  .apiPreviews [ 0, * ]: APIPreview
}

type Sid: void {
  .root: string
}

type Username: void {
  .root: string
}

type StringArray: void {
  .array [ 0, * ]: string
}

type APIInfoType: void {
  .nome: string
  .linkFile: string
  .linkPDF: string
  .descrizione: string
  .logoAPI: string
  .numVoti: int
  .ratingMedio: double
  .tempoMedioRisposta: double
  .totaleChiamate: int
  .traffico: double
  .tempoRispostaTotale: double
  .username: string
  .location: string
  .protocol: string
  .chiave: string
  .dataScadenza: string
  .usedByte: double
  .maxByte: double
}

type APIInfoTypeArray: void {
  .array [ 0, * ]: APIInfoType
}

type APITypeArray: void {
  .array [ 0, * ]: APIType
}

type PolicyArray: void {
  .array [ 0, * ]: Policy
}

type APIStats: void {
  .downloads: long
  .tempoMedioRisposta: double
  .totaleChiamate: int
  .traffico: double
  .tempoRispostaTotale: double
}

type GWApiArray: void {
  .row [ 0, * ]: GWApi
}

type GWApi: void {
  .outputname: string
  .filecouriername: string
  .nameofservice: string
}

type APISearchType: void {
  .root: string
  .idCategoria?: int
}



// IN REALTA` SEARCH DOVREBBE RITORNARE UN ARRAY DI API NON APITYPE
// VIEWSTATS DOVREBBE RITORNARE UN TIPO APPROPRIATO
// GLI EDIT PRENDONO UN OGGETTO DI TIPO ENTITY (API QUI) NON STRING
interface APIManagerInterface {
  RequestResponse:
  	editAPIAdmin ( APIEditType )( bool ),
  	deleteAPIAdmin ( APIName )( bool ),
  	viewAPI ( APIName )( APIType ),
  	insertAPI ( APIUploadType )( bool ),
  	searchAPI ( APISearchType )( APITypeArray ),
  	deleteAPI ( SessionStringAPI )( bool ),
  	editAPI ( APIEditType )( bool ),
  	viewStats ( APIName )( APIStats ),
  	buyApi ( BuyRequestType )( int ),
  	incrementInterval ( IncrementType )( bool ),
  	incrementSize ( IncrementType )( bool ),
  	sendDocumentation ( UploadRaw )( void ),
  	sendLogo ( UploadRaw )( void ),
  	sendInterface ( UploadInterface )( void ),
  	getFrontPageApis ( void )( APIPreviewArray ),
  	getFrontPageApisCategories ( APIInt )( APIPreviewArray ),
  	getBoughtApisList ( Username )( APIInfoTypeArray ),
  	getUploadedApisList ( Username )( APITypeArray ),
  	addPolicyToAPI( Policy )( void ),
  	removePolicyFromAPI( APIInt )( void ),
  	getPolicyFromId( APIInt )( Policy ),
  	getPoliciesFromApiName( APIName )( PolicyArray ),
    getAllGateway( void )( GWApiArray )
}

// buyApi richiede l'id e ritorna la chiave?