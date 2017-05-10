import { Component } from '@angular/core';
import { NewApiService } from '../services/new-api.service';
import { UserApi } from '../model/api';
import { SessionService } from '../services/session.service';
import { Router } from '@angular/router';

@Component({
  	selector: 'app-new-api',
  	templateUrl: './new-api.component.html',
  	styleUrls: ['./new-api.component.css'],
	providers: [NewApiService]
})

export class NewApiComponent{
	api:UserApi;
	serverError:string;
	
  	constructor(private service:NewApiService, private router:Router) { 
		this.api=new UserApi();
	}
	
  	submit(){
		this.service.upload(this.api) 
        	.subscribe(result => { 
				this.router.navigateByUrl("/user");
          	});		
	}
}
