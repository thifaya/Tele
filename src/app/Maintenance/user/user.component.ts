import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Server/data.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { delay, take } from 'rxjs/operators';
import { concatMap } from 'rxjs/operators';
import { pipe } from '@angular/core/src/render3/pipe';
import { map } from 'rxjs/operators';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  public users: object;
  public titles: object = [];
  public designations: object = [];
  public sites: object = [];

  setHeader = new HttpHeaders({
    'Content-Type': 'application/x-www-urlencoded;charset=utf-8;',
});


  constructor(private _dataService: DataService, private _http: HttpClient) {
    this._dataService.getUsers()
    .subscribe(data => this.users =  data );

   /* this._dataService.getFullData()
      .subscribe(
        data => {
        this.users = data[0],
        this.titles = data[1],
        this.designations = data[2],
        this.sites = data[3];
      },
      this._http.get('http://154.0.172.85:5000/users').subscribe(res => this.users = res);
     this._http.get('http://154.0.172.85:5000/title').subscribe(res => this.titles = res);
     this._http.get('http://154.0.172.85:5000/designation').subscribe(res => this.designations = res);
     this._http.get('http://154.0.172.85:5000/site').subscribe(res => this.sites = res);
       error => {
        window.alert(error.name + ':  ' + error.message);
       });*/
this._dataService.getUsers()
       .subscribe(user => this.users = user);

   }

  ngOnInit() {
   }



  /*

   user() {
    this._dataService.getUsers()
      .subscribe(data => this.users =  data );
   }
 titleService() {
  this._dataService.getTitle()
  .subscribe(data => this.titles = data);
 }

 siteService() {
   this._dataService.getSite()
    .subscribe(data => this.sites = data);
 }

 designService() {
   this._dataService.getDesignation()
    .subscribe(data => this.designations = data);
 }
*/
  datatest() {
    console.log(this.users);
    console.log(this.titles);
    console.log( this.designations);
    console.log(this.sites);
  }

  editClick(event) {
    event.preventDefault();
    const target = event.target;
    target.querySelector('#txtName').value = 'Tebogo';
  }


}
