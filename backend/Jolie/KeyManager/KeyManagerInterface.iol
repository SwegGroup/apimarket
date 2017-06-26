type DateType: void {
	.giorno: int
	.mese: int
	.anno: int
}

type KeyType: void {
	.key: string
	.dataScadenza: int
	.maxByte: double
	.tempoUso: int
	.username: string
	.nomeAPI: string
}

type IncrementTypeKey: void {
  .root: string
  .size: double
}

type KeyCheck: void {
  .root: string
  .api: string
}

type KeyInt: void {
  .root: int
}

interface KeyManagerInterface {
	RequestResponse:
		checkKey ( KeyCheck )( bool ),
		keygen ( KeyType )( string ),
		incrementSize ( IncrementTypeKey )( void )
}