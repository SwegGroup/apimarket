import { Component, OnInit } from '@angular/core';

import { UserService } from '../services/user.service';
import { User } from '../model/user';
import { SessionService } from '../services/session.service';
import { Router } from '@angular/router';

@Component({
 selector: 'user',
  templateUrl: './user-page.component.html',
  styleUrls: ['./user-page.component.css']
})
export class UserPageComponent implements OnInit {

	user:User;
	private response:string;
	
  	constructor(private service:UserService, private session:SessionService, private router:Router) { }

  	ngOnInit() {
		this.user=this.service.getUser();
			/*.subscribe(result => { 
				this.user = result; 
		});*/ 
	}
	submitData(){
		this.service.editUser(this.user) 
			.subscribe(result => { 
				this.response = result; 
				this.router.navigateByUrl("/user");
		}); 
	}

}
