export class Policy{
	condition:string;
	price:number;
	
	constructor(condition:string, price:number){
		this.condition=condition;
		if(price>=0)
			this.price=price;
		else
			this.price=0;	
	}
	setPrice(n:number){
		if(n>=0)
			this.price=n;
	}
	setCondition(c:string){
		this.condition=c;
	}
}
