import { Injectable } from '@angular/core';
import { Http } from '@angular/http'; 
import { Observable } from 'rxjs';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

import { Data } from '../model/data'
import { SessionService } from '../services/session.service';
import { User } from '../model/user';
@Injectable()
export class UserService {

	constructor(private http:Http, private session:SessionService) { }
	
	getUser(){
		if(this.session.sessionCheck()){
			/*return this.http
				.get("http://localhost:10003/viewUser?sid="+this.session.getSessionNumber())
				.map((responseData) => responseData.json())*/
			return new User("username","password","test@gmail.com",new Data(11,11,1989),"4023600462455875","antonio","rovazzi",
							"via banana 92 Este","09988787463","http://photo.html/098093","ciao a tutti","1243","false");
		}	
	}
	editUser(u:User){
		return this.http
			.get("http://localhost:10003/editProfile?"
				+"username="+u.username
				+"&password="+u.password
				+"&nome="+u.name
				+"&cognome="+u.surname
				+"&dataNascita="+u.birthday
				+"&mail="+u.mail
				+"&numeroCarta="+u.cardnumber
				+"&indirizzo="+u.address
				+"&telefono="+u.phone
				+"&fotoProfilo="+u.photo
				+"&bio="+u.bio
				+"&saldoCoin="+u.coin
				+"&isAdmin=false")
			.map((responseData) => responseData.json()); 
	}
}
