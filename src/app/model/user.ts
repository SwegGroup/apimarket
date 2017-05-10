import { Data } from './data';

export class User {
    username : string;
    password : string;
    mail : string;
    birthday : Data;
    cardnumber : string;
    name : string;
    surname : string;
    address : string;
    phone : string;
    photo : string;
    bio : string;
    coin : string;
    isAdmin : string;

constructor(u?:string, p?:string, m?:string, b?:Data, c?:string, n?:string, s?:string, a?:string, phone?:string, photo?:string, bio?:string, co?:string, ad?:string){
		this.username = u;
		this.password = p;
		this.mail = m;
		this.birthday = b;
		this.cardnumber = c;
		this.name = n;
		this.surname = s;
		this.address = a;
		this.phone = phone;
		this.photo = photo;
		this.bio = bio;
		this.coin = co;
		this.isAdmin = ad;
	}
}
