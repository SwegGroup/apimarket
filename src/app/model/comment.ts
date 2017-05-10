import { Data } from './data'

export class Comment{
	userName:string;
	apiName:string;
	date:Data;	
	text:string;
	rating:number;

	constructor(userName?:string, apiName?:string, date?:Data, text?:string, rating?:number){
		this.userName=userName
		this.apiName=apiName;
		this.date=date;
		this.text=text;
		this.rating=rating;
	}
}
