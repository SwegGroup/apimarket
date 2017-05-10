//service per la gestione della pagina API
import { Injectable } from '@angular/core';
import { ApiPage } from '../model/api';
import { SessionService } from '../services/session.service';
import { Observable } from 'rxjs';
import { Http } from '@angular/http';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

//DA RIMUOVERE
import { Comment } from '../model/comment';
import { Data } from '../model/data';
import { Policy } from '../model/policy';
import { User } from '../model/user';
@Injectable()
export class ApiPageService {
  	constructor(private http:Http, private tkn:SessionService) {}
	getApi(name:string):Observable<ApiPage>{//richiedo al server l'api con con codice identificativo id
		//controllo se è impostato sessionToken
		if(this.tkn.sessionCheck()){
			return this.http
				.get("http://localhost:10000/viewAPI?param="+name+'&tkn='+this.tkn.getSessionNumber())
				.map((responseData) => responseData.json()); 
		}
		else{
			return this.http
				.get("http://localhost:10000/viewAPI?param="+name)
				.map((responseData) => responseData.json()); 
		}
	}
	private serverRequest(){}
}

