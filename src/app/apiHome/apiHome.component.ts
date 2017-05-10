import { Component, OnInit } from '@angular/core';
import { ApiHomeService } from '../services/api-home.service';
import { ApiPreview } from '../model/api'

@Component({
	selector: 'msTop',
	templateUrl: './apiHome.component.html',
	styleUrls: ['./apiHome.component.css'],
	providers: [ApiHomeService]
})

export class ApiHomeComponent implements OnInit{
	itemsApi:ApiPreview[];
	constructor(private apiHomeItems:ApiHomeService){ }
	ngOnInit():void{
		this.apiHomeItems.getApiPreview() 
        	.subscribe(result => { 
				this.itemsApi = result; 
		}); 
	}

}
