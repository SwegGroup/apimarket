import { Component } from '@angular/core';
import { SessionService } from '../services/session.service';

@Component({
  	selector: 'login',
  	templateUrl: './login-page.component.html',
  	styleUrls: ['./login-page.component.css'],
})
export class LoginPageComponent{
	user:string;
	pass:string;
	error:string;
 	constructor(private service:SessionService) {}

	login(){
		this.service.sessionRequest(this.user,this.pass);
		this.user=this.pass="";
	}

}
