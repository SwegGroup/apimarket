export class Data{ //semplice classe per la gestione delle date nel formato dd//mm/yyyy
	private year:number;
	private month:number;
	private day:number;

	constructor(day:number, month:number, year:number){//nessun controllo sull'effettiva esistenza della data
		if(day<=31 && day>=1)
			this.day=day;
		else
			this.day=0;
		if(month<=12 && month>=1)
			this.month=month;
		else
			this.month=0;
		if(year>=0)
			this.year=year;
		else
			this.year=0;
	}
	
	getPlainDate(){//data testuale in formato dd/mm/yyyy
		return this.day + "/" + this.month + "/" + this.year;
	}
	getDay(){
		return this.day;
	}
	getMonth(){
		return this.month;
	}
	getYear(){
		return this.year;
	}
	setDay(n:number){
		if(n<=31 && n>=1)
			this.day=n;
	}
	setMonth(n:number){
		if(n<=12 && n>=1)
			this.month=n;
	}
	setYear(n:number){
		if(n>=0)
			this.year=n;
	}
}
