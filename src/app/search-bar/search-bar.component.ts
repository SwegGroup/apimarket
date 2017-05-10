import { Component, Input, Output, EventEmitter } from '@angular/core';
import { SearchService } from '../services/search.service';
import { Router } from '@angular/router';
@Component({
  selector: 'div[id="searchBar"]',
  templateUrl: './search-bar.component.html',
  styleUrls: ['./search-bar.component.css']
})
export class SearchBarComponent{
	@Output() submit=new EventEmitter<{}>();
	searchInput:string;
	category:string;
	constructor(private router:Router) {}
	
	submitSearch(){
		this.router.navigateByUrl("/search/"+this.category+"/"+this.searchInput);
	}
}
