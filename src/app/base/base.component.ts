import { Component } from '@angular/core';
import { SessionService } from '../services/session.service'
@Component({
  selector: 'app-root',
  templateUrl: './base.component.html',
  styleUrls: ['./base.component.css']
})
export class BaseComponent{
	constructor(private session:SessionService){}
	logout(){
		this.session.sessionDestroy();	
	}
}
