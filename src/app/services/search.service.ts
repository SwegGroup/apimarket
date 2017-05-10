import { Injectable } from '@angular/core';
import { Http } from '@angular/http'; 
import { Observable } from 'rxjs';

import { ApiPreview } from '../model/api';

@Injectable()
export class SearchService {
	error:string;
	
  	constructor(private http:Http) {}
	execute(key:string, category:string)/*:Observable<ApiPreview[]>*/{
		/*return this.http
			.get("localhost:1010/nomeFunzione?chiave="+key+"&categoria="+category)
			.map((responseData) => responseData.json())
			.catch(this.handleError);*/
	}
	 /*private handleError (error: Response | any){
		 this.error="indirizzo errato";
		 return Observable.throw(this.error);
	 }*/
}
