type CourierRequestType: void {
  .apiName: string
  .apiInterfaceName: string
  .apiPortName: string
  .apiInterfaceFileName: string
}

interface CourierGeneratorInterface {
  RequestResponse:
  	generate( CourierRequestType )( bool )
}