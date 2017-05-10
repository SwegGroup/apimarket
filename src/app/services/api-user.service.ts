import { Injectable } from '@angular/core';
import { Policy } from '../model/policy';
import { SessionService } from './session.service';
import { UserApi } from '../model/api';
import { Http } from '@angular/http';
import { Observable } from 'rxjs';
//import { AppConfig } from '../app.config'

@Injectable()
export class ApiUserService{
	constructor(private http:Http, /*private config:AppConfig*/) {}

	/*		return this.http
			.get("this.config.apiUrl + /?","")
			.map((responseData)=>responseData.json());
		
	}
	setApi(api:UserApi,tkn:SessionToken){
		this.http
			.post("this.config.apiUrl + /viewUser?","");
	};
	deleteApi(api:UserApi,tkn:SessionToken){
		this.http.post("this.config.apiUrl + /?","");
	}*/
}
