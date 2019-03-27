import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { User, IDesignation, ITitle, ISite } from './user';
import { User1 } from './user1';
import { Observable } from 'rxjs';
import { map } from 'rxjs/operators';

import { dataLoader } from '@amcharts/amcharts4/core';
import { pipe } from '@angular/core/src/render3/pipe';
// import 'rxjs/add/operator/catch';
// import 'rxjs/add/observable/throw';

@Injectable({
  providedIn: 'root'
})
export class DataService {
/*
  private _url = '../assets/sample.json';
  private _urlMonths = '../assets/months.json';
  private _urlTitle = '../assets/title.json';

  headers = new HttpHeaders({
    'Content-Type': 'application/json',
    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
    'responseType': 'json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
    'Access-Control-Allow-Headers': 'X-Requested-With, content-type, Authorization'
});   */

private loginURL = 'http://154.0.172.85:5000/login';

  setHeader = new HttpHeaders({
    ContentType: 'application/json',
    responseType: 'json'
  });
          // URL API from server //

  constructor(private _http: HttpClient) { }



        // GET API
  getTitle(): Observable<ITitle[]> {
    return this._http.get<ITitle[]>('http://154.0.172.85:5000/title', {headers: this.setHeader});
  }

  getUsers(): Observable<User[]> {
    return this._http.get<User[]>('http://154.0.172.85:5000/users', {headers: this.setHeader});
  }

  getDesignation(): Observable<IDesignation[]> {
    return this._http.get<IDesignation[]>('http://154.0.172.85:5000/designation', {headers: this.setHeader});
  }

  getSite(): Observable<ISite[]> {
    return this._http.get<ISite[]>('http://154.0.172.85:5000/site', {headers: this.setHeader});
  }


      // POST API
  loginUser(user) {
   // this.user = 'username=' + username + '&password=' + password;
    return this._http.post<any>('http://154.0.172.85:5000/login', user);
  }

  login(user: User) {
    return this._http.post<any>(this.loginURL, user, {headers: this.setHeader} );
  }
}
