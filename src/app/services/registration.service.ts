import { Injectable } from '@angular/core';
import { User } from '../model/user';
import { Observable } from 'rxjs';
import { Http } from '@angular/http';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Injectable()
export class RegistrationService {

	constructor(private http:Http) { }

	registration(u:User):Observable<any>{
		return this.http.get('http://localhost:10003/'+
			'signIn?username='+u.username+
			'&password='+u.password+ 
			'&nome='+u.name+ 
			'&cognome='+u.surname+
			'&dataNascita=1978-02-12'+
			'&mail='+u.mail+
			'&numeroCarta=1'+
			'&indirizzo='+u.address+
			'&telefono='+u.phone+
			'&bio='+u.bio+
			'&fotoProfilo=mypic.jpg'+
			'&saldoCoin=0&isAdmin=false')
				.map((responseData) => responseData.json());
	}
}

