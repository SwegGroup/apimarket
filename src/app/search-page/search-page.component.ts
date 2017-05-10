import { Component, OnInit } from '@angular/core';
import { ActivatedRoute } from '@angular/router';

import { SearchService } from '../services/search.service';
import { ApiPreview } from '../model/api';
import { User } from '../model/user';
@Component({
  selector: 'searchResult',
  templateUrl: './search-page.component.html',
  styleUrls: ['./search-page.component.css']
})
export class SearchPageComponent implements OnInit{
	api:ApiPreview[];
	key:string;
	category:string;
	test:string;
	private sub:any;

	constructor(private route: ActivatedRoute, private search:SearchService) { }

  	ngOnInit() {
		this.api=[
			//new ApiPreview("API di roberto",new User("ciccio","pasticcio","a@b.c","domani","100345","banano","patato","la sua","è povero non ce l'ha","bruttissima","mi fa schifo la biologia","0","false"),"http://localhost",3.7,1.50,10000),
		]
		/*this.sub=this.route.params.subscribe(params =>{
			this.key = params['key'];
			this.category = params['cat'];
		});
		this.search.execute(this.key, this.category).subscribe(result => {
                      this.api = result;
                    });
		this.test=this.key;*/
  	}
}
