/*
import { Injectable } from '@angular/core';
import { Http, Response, Headers, RequestOptions } from '@angular/http';

import { AppConfig } from '../app.config';
import { User } from './model/user';


@Injectable()
export class UserService {
constructor(private http: Http, private config: AppConfig) { }

    getAll() {
        return this.http.get(this.config.apiUrl + '/users', this.jwt()).map((response: Response) => response.json());
    }

    getById(username: string) {
        return this.http.get(this.config.apiUrl + '/users/' + username, this.jwt()).map((response: Response) => response.json());
    }

    create(user: User) {
        return this.http.post(this.config.apiUrl  + 'signIn?username='+user.username+'&password='+user.password+'&nome='+user.name+'&cognome='+user.surname+'&dataNascita='+user.birthday+'&mail='+user.mail+'&numeroCarta='+user.cardnumber+'&indirizzo='+user.address+'&telefono='+user.phone+'&bio='+user.bio+'&fotoProfilo='+user.photo+'&saldoCoin=0&isAdmin=false', user, this.jwt());
    }

    update(user: User) {
        return this.http.put(this.config.apiUrl + '/users/' + user.username, user, this.jwt());
    }

    delete(username: string) {
        return this.http.delete(this.config.apiUrl + '/users/' + username, this.jwt());
    }

    // private helper methods

    private jwt() {
        // create authorization header with jwt token
        let currentUser = JSON.parse(localStorage.getItem('currentUser'));
        if (currentUser && currentUser.token) {
            let headers = new Headers({ 'Authorization': 'Bearer ' + currentUser.token });
            return new RequestOptions({ headers: headers });
        }
    }
}
*/
