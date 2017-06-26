type CourierRequestType: void {
  .name: string
  /*.apiInterfaceName: string
  .apiPortName: string
  .apiInterfaceFileName: string*/
  .location: string
  .protocol: string
}

interface CourierGeneratorInterface {
  RequestResponse:
  	generate( CourierRequestType )( void )
}