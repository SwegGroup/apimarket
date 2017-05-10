//service per la chiamata al server per le API nella home page
import { Injectable } from '@angular/core';
import { ApiPreview } from '../model/api';
import { Observable } from 'rxjs';
import { Http } from '@angular/http';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Injectable()
export class ApiHomeService {
	constructor(private http:Http){};//chiamata al server per ottenere le api nella home
	getApiPreview():Observable<ApiPreview[]>{
		return this.http
			.get("http://localhost:10000/getFrontPageApis")
			.map((responseData) => responseData.json()); 
	};
}
