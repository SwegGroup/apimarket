import { Injectable } from '@angular/core';
import { UserApi } from '../model/api';
import { Observable } from 'rxjs';
import { Http } from '@angular/http';
import 'rxjs/add/operator/catch';
import 'rxjs/add/operator/map';

@Injectable()
export class NewApiService {

	constructor(private http:Http ) { }

	upload(a:UserApi):Observable<any>{
		return this.http.get('http://localhost:10000/'+
			'insertAPI?nome='+a.name+
			'&linkFile='+a.ntf+ 
			'&linkPDF='+a.documentation+ 
			'&descrizione='+a.description+
			'&logoAPI='+a.logo+
			'&prezzo=0'+
			'&policy=null'+
			'&numVoti=0'+
			'&ratingMedio=0'+
			'&tempoMedioRisposta=0'+
			'&totaleChiamte=0'+
			'&traffico=0'+
			'&tempoRispostaTotale=0'+
			'&username=username')
				.map((responseData) => responseData.json());
	}
}