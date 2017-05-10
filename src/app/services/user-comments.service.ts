import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { Http } from '@angular/http'; 
import { SessionService } from '../services/session.service';

@Injectable()
export class UserCommentsService {
	
  	constructor(private http:Http, private session:SessionService) { }
	
	getComments(){
		if(this.session.sessionCheck()){
			//RECUPERO LE API DELL'UTENTE DAL SERVER
			/*return this.http
				.get("/funzione?param1=&param2=")
				.map((responseData) => responseData.json()); */
		}
	}
}
