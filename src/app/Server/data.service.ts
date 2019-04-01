import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { User, IDesignation, ITitle, ISite } from './user';
import { AppComponent } from '../app.component';
import { concatMap } from 'rxjs/operators';
import { Observable } from 'rxjs';
import { forkJoin, BehaviorSubject } from 'rxjs';
import { delay, take } from 'rxjs/operators';

import { dataLoader } from '@amcharts/amcharts4/core';
import { pipe } from '@angular/core/src/render3/pipe';
// import 'rxjs/add/operator/catch';
// import 'rxjs/add/observable/throw';

@Injectable({
  providedIn: 'root'
})
export class DataService {
  /* headers = new HttpHeaders({
      'Content-Type': 'application/json',
      'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
      'responseType': 'json',
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
      'Access-Control-Allow-Headers': 'X-Requested-With, content-type, Authorization'
  });   */


  // URL API from server //
  private userURL = 'http://154.0.172.85:5000/users';
  private loginURL = 'http://154.0.172.85:5000/login';

  postHeader: HttpHeaders = new HttpHeaders({
    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8',
    'responseType': 'json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
    'Access-Control-Allow-Headers': 'X-Requested-With, content-type, Authorization'
  });

  getHeader: HttpHeaders = new HttpHeaders({
    'Content-Type': 'application/json',
    'responseType': 'json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
    'Access-Control-Allow-Headers': 'X-Requested-With, content-type, Authorization'
  });

  defaultName: AppComponent;
  userAPI;
  titleAPI;
  designationAPI;
  siteAPI;

  passName = JSON.parse(localStorage.getItem('Name'));

  constructor(private _http: HttpClient) {
  }

  private dataSource = new BehaviorSubject(this.passName);

  currentData = this.dataSource.asObservable();

  dataChanged(data: string) {
    this.dataSource.next(data);
  }


  // GET API
  getTitle() {
    return forkJoin(this._http.get<ITitle>('http://154.0.172.85:5000/title', { headers: this.getHeader }));
  }

  getUsers(): Observable<User[]> {
    return forkJoin(this._http.get<User>('http://154.0.172.85:5000/users', { headers: this.getHeader }));
  }

  getDesignation() {
    return this._http.get<IDesignation>('http://154.0.172.85:5000/designation', { headers: this.getHeader });
  }

  getSite() {
    return this._http.get<ISite>('http://154.0.172.85:5000/site', { headers: this.getHeader });
  }

  getFullData1() {
    this.userAPI = this._http.get('http://154.0.172.85:5000/users', { headers: this.getHeader });
    this.titleAPI = this._http.get('http://154.0.172.85:5000/title', { headers: this.getHeader });
   // this.designationAPI = this._http.get('http://154.0.172.85:5000/designation', { headers: this.getHeader });
   // this.siteAPI = this._http.get('http://154.0.172.85:5000/site', { headers: this.getHeader });

    return forkJoin([
      this.userAPI,
      this.titleAPI,
    //  this.designationAPI,
    //  this.siteAPI
 ]);
  }

  getFullData2() {
   this.designationAPI = this._http.get('http://154.0.172.85:5000/designation', { headers: this.getHeader });
   this.siteAPI = this._http.get('http://154.0.172.85:5000/site', { headers: this.getHeader });

   return forkJoin([
    this.designationAPI,
    this.siteAPI
]);
  }
  // POST API

  loginService(user: User) {
    return this._http.post<any>(this.loginURL, user, { headers: this.postHeader });
  }
}
