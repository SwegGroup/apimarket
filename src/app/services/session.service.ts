import { Injectable } from '@angular/core';
import { Http } from '@angular/http'; 
import { Observable } from 'rxjs';
import { Router } from '@angular/router';

@Injectable()
export class SessionService {
	private sessionNumber:string;
	private name:string;

	constructor(private http:Http, private router:Router) { 
		this.sessionNumber="";
	}
	sessionRequest(username:string, password:string){
		//chiamata al serve per eseguire login ed ottenere sessionNumber
		this.http
			.get("http://localhost:10003/login?username="+username+"&password="+password)
			.map((responseData) => responseData.json())
			.subscribe(result => {
				this.sessionNumber=result.sid;
				this.router.navigateByUrl("/user");
		})
		return true;
	}
	sessionRefresh(){
		//chiamata al server per refreshare session
	}
	sessionCheck(){
		if(this.sessionNumber!="")
			return true;
		else
			return false;
	}
	sessionDestroy(){
		//chiamata al server per distruggere la sessione
		this.sessionNumber="";
	}
	getName(){
		return this.name;
	}	
	getSessionNumber(){
		return this.sessionNumber;	
	}
	setSessionNumber(s:string){
		this.sessionNumber=s;	
	}
}