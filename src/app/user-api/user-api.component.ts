import { Component, OnInit } from '@angular/core';
import { UserApiService } from '../services/user-api.service';
import { UserApi } from '../model/api';

@Component({

  	selector: 'userApi',
  	templateUrl: './user-api.component.html',
  	styleUrls: ['./user-api.component.css'],
	providers: [UserApiService]
})
export class UserApiComponent implements OnInit {
	api;
  	constructor(private service:UserApiService) { }

  	ngOnInit() {
		/*service.getApi()
			.subscribe(result => {
           	this.api = result;
      	});  */
  	}

}
