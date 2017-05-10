import { Component, OnInit } from '@angular/core';
import { UserCommentsService } from '../services/user-comments.service';
import { Comment } from '../model/comment';

@Component({
  	selector: 'userComments',
  	templateUrl: './user-comments.component.html',
  	styleUrls: ['./user-comments.component.css'],
	providers: [UserCommentsService]
})
export class UserCommentsComponent implements OnInit {
	comments:Comment[];
  	constructor(private service:UserCommentsService) { }


  	ngOnInit() {
		/*service.getComments()
			.subscribe(result => {
           	this.api = result;
      	});  */
  	}

}
