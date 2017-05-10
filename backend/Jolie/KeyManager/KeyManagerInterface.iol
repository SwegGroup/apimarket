type DateType: void {
	.giorno: int
	.mese: int
	.anno: int
}

type KeyType: void {
	.key: string
	.dataScadenza: /*dateType*/ string
	.maxByte: double
	.tempoUso: int
	.username: string
	.nomeAPI: string
}

interface KeyManagerInterface {
	RequestResponse:
		checkKey ( string )( KeyType ),
		keygen ( KeyType )( bool ),
		validateKey ( string )( KeyType )
}