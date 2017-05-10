//service per la chiamata al server per le API nella home page
import { Injectable } from '@angular/core';
import { ApiPreview } from '../model/api';
import { Observable } from 'rxjs';
import { Http } from '@angular/http';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Injectable()
export class CategoryService {
	constructor(private http:Http){};
	getApiPreview(category:string):Observable<ApiPreview[]>{
		return this.http
			.get("http://localhost:10000/getFrontPageApisCategories?categoria="+category)
			.map((responseData) => responseData.json()); 
	};
}
