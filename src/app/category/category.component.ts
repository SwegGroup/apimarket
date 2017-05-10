//componente categorie
import { Component, OnInit, OnDestroy } from '@angular/core';
import { CategoryService } from '../services/category.service';
import { ActivatedRoute } from '@angular/router';

import { ApiPreview } from '../model/api';

@Component({
	  selector: 'msCategory',
	  templateUrl: './category.component.html',
	  styleUrls: ['./category.component.css'],
	  providers: [CategoryService]
})

export class CategoryComponent implements OnInit, OnDestroy{
	categoryApi:ApiPreview[]; //lista di api appartenenti a category
	category:string; //categoria scelta
	private sub:any;

	constructor(private categoryItems:CategoryService, private route:ActivatedRoute){ } //connessione a service

	ngOnInit():void{
		//input categoria da routing
		this.sub=this.route.params.subscribe(params =>{
			this.category = params['cat'];
		});
		
		this.categoryItems.getApiPreview(this.category) 
			.subscribe(result => { 
				this.categoryApi = result; 
		}); 
	}
	ngOnDestroy(){
		this.sub.unsubscribe();
	}
}
