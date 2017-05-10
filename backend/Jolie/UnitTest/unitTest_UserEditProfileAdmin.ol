include "../UserManager/UserManagerInterface.iol"
include "../constants.iol"
include "string_utils.iol"
include "console.iol"

outputPort UserManager {
	Location: UserManagerLocation
	Protocol: sodep
	Interfaces: UserManagerInterface
}

main {
	u.username = "PinoG";
	u.password = "pwd";
	u.nome = "Pino";
	u.cognome = "Gina";
	u.dataNascita = "1978-02-12";
	u.mail = "gpino@gmail.com";
	u.numeroCarta = "1";
	u.indirizzo = "via Foresta";
	u.telefono = "23";
	u.bio = "mi sento impiantato";
	u.fotoProfilo = "mypic.jpg";
	u.saldoCoin = 1;
	u.isAdmin = true;
	editProfileAdmin@UserManager( u )( r );
	println@Console( r )()
}