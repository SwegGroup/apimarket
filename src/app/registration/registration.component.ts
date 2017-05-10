import { Component } from '@angular/core';
import { RegistrationService } from '../services/registration.service';
import { User } from '../model/user';
import { SessionService } from '../services/session.service';
import { UserService } from '../services/user.service'; 
import { Router } from '@angular/router';

@Component({
  	selector: 'registr',
  	templateUrl: './registration.component.html',
  	styleUrls: ['./registration.component.css'],
	providers: [RegistrationService]
})

export class RegistrationComponent{
  	reg : User;
	serverError:string;
	constructor(private service:RegistrationService, private session:SessionService, private router:Router, private user:UserService) {
      	this.reg = new User();
	}
	submit(){
		this.service.registration(this.reg) 
        	.subscribe(result => { 
				this.session.setSessionNumber(result.sid);
				this.user.getUser();
				this.router.navigateByUrl("/user");
          	});		
	}
}
