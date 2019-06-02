import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { User } from './user';
import { Years, IDesignation, ITitle, ISite, AccessLevel } from './dropDownList';
import { HeartBeat, Alarm } from './dataTable';
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
  private userURL = 'http://154.0.172.85:5000/alarm';
  private loginURL = 'http://154.0.172.85:5000/login';

  postHeader: HttpHeaders = new HttpHeaders({
    'Content-Type': 'application/json',
    'responseType': 'json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
    'Access-Control-Allow-Headers': 'X-Requested-With, content-type, Authorization'
  });

  getHeader: HttpHeaders = new HttpHeaders({
    'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;',
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


  // DROP DOWN LIST API
  getTitle() {
    return this._http.get<ITitle[]>('http://154.0.172.85:5000/title', { headers: this.getHeader });
  }

  getUsers(): Observable<User[]> {
    return this._http.get<User[]>('http://154.0.172.85:5000/users', { headers: this.getHeader });
  }

  getAllSite() {
    return this._http.get<User[]>('http://154.0.172.85:5000/allsites', { headers: this.getHeader });
  }

  getDesignation() {
    return this._http.get<IDesignation>('http://154.0.172.85:5000/designation', { headers: this.getHeader });
  }

  getSite() {
    return this._http.get<ISite>('http://154.0.172.85:5000/site', { headers: this.getHeader });
  }

  getAccessLevel() {
    return this._http.get<AccessLevel>('http://154.0.172.85:5000/accessLevel', { headers: this.getHeader });
  }
  
  getYears() {
    return this._http.get<Years>('http://154.0.172.85:5000/year', { headers: this.getHeader });
  }
    //TABLE API

  getAlarms(data) {
    return this._http.post<any>('http://154.0.172.85:5000/alarms', data, { headers: this.postHeader });
  }
 /*////////////////////////////////////////////////////////////////////////////////////////////////////////////
  getFinanceRevunue(data) {
    return this._http.post<any>('http://154.0.172.85:5000/finance', data, { headers: this.postHeader });
  }*/
  getFinanceRevunue() {
    return this._http.get<any>('http://154.0.172.85:5000/finance', { headers: this.postHeader });
  }
 ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  getVolumeReceived(data) {
    return this._http.post<any>('http://154.0.172.85:5000/volumetrendreceived', data, { headers: this.postHeader });
  }

  getVolumeConsumed(data) {
    return this._http.post<any>('http://154.0.172.85:5000/volumetrendconsumed', data, { headers: this.postHeader });
  }

  getAggregateReceived(data) {
    return this._http.post<any>('http://154.0.172.85:5000/aggregatereceived', data, { headers: this.postHeader });
  }

  getAggregateConsumed(data) {
    return this._http.post<any>('http://154.0.172.85:5000/aggregateconsumed', data, { headers: this.postHeader });
  }

  getFochvilleFlowRate(data) {
    return this._http.post<any>('http://154.0.172.85:5000/fochvilleflowrate', data, { headers: this.postHeader });
  }

  getCarltonvilleFlowRate(data) {
    return this._http.post<any>('http://154.0.172.85:5000/carltonvilleflowrate', data, { headers: this.postHeader });
  }

  getMonthlyTrend(data) {
    return this._http.post<any>('http://154.0.172.85:5000/monthlytrend', data, { headers: this.postHeader });
  }

  compareYearToYear(data) {
    return this._http.post<any>('http://154.0.172.85:5000/compareyeartoyear', data, { headers: this.postHeader });
  }

  compareMonthToMonth(data) {
    return this._http.post<any>('http://154.0.172.85:5000/comparemonthtomonth', data, { headers: this.postHeader });
  }
  
  getHeartbeat() {
    return this._http.get<HeartBeat>('http://154.0.172.85:5000/heartbeat', { headers: this.getHeader });
  }
  ////////////////// CHART API///////////////////////////////////

  getLevelTrends(data) {
    return this._http.post('http://154.0.172.85:5000/leveltrends', data, { headers: this.postHeader });
   }
    
  getMultiYearReceived() {
    return this._http.get<any>('http://154.0.172.85:5000/multiyeartrendreceived', { headers: this.getHeader });
  }
   
  getYearlyReceived() {
    return this._http.get<any>('http://154.0.172.85:5000/yearlywaterreceived', { headers: this.getHeader });
  }
  
  getYearlyConsumed() {
    return this._http.get<any>('http://154.0.172.85:5000/yearlywaterconsumed', { headers: this.getHeader });
  }
 
  getMultiYearConsumed() {
    return this._http.get<any>('http://154.0.172.85:5000/multiyeartrendconsumed', { headers: this.getHeader });
  }
//////////////////// PUT API ///////////////////////// 

ActivatteUser(id, data) {
  return this._http.put<void>('http://154.0.172.85:5000/activate/:'+id, data, { headers: this.postHeader });
}

DeactivateUser(data): Observable<void> {
  return this._http.put<void>('http://154.0.172.85:5000/deactivate', data, { headers: this.postHeader });
}

testIt(id, data): Observable<void> {
  return this._http.put<void>('http://154.0.172.85:5000/activateuser/'+id, data, { headers: this.postHeader });
}


  //////////////////// POST API /////////////////////////   

  loginService(user: User) {
    return this._http.post<any>(this.loginURL, user, { headers: this.postHeader });
  }
  updateUser(id, user) {
    return this._http.put('http://154.0.172.85:5000/users/'+id, user, { headers: this.postHeader })
  }
}
