import { User } from './user';
import { Comment } from './comment';
import { Policy } from './policy';
import { ApiStat } from './apiStat';

//preview nell'API sullla home page o sulla pagina dei risultati di ricerca
export class ApiPreview{
	name:string; //nome API
	author:User; //autore
	logo:string; //link del logo
	rating:number; //rating 0/5
	genericPrice:number; //prezzo più basso
	downloads:number; //numero di downloads
	constructor(name?:string, author?:User, logo?:string, rating?:number, genericPrice?:number, downloads?:number){
		this.name=name;
		this.author=author;
		this.logo=logo;
		this.rating=rating;
		this.genericPrice=genericPrice;
		this.downloads=downloads;
	}
};

//informazioni dell'API disponibili nella pagina d'acquisto
export class ApiPage extends ApiPreview{
	description:string; //descrizione dell'API 
	comments:Comment[]; //elenco commenti degli utenti
	sellingPolicy:Policy[]; //insieme delle policy di vendita
	documentation?:string; //link di download della documentazione
	ntf?:string; //interfaccia API

	addComment(comm:Comment){} //aggiunge un commento collegato a questa API
};

//Gestione API a livelli utente
export class UserApi extends ApiPage{
	stat:ApiStat;

	addSellingPolicy(Policy){}
	deleteSellingPolicy(Policy){}
}
