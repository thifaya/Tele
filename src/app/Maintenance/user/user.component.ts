import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Server/data.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { delay, take, concatMap, map } from 'rxjs/operators';





@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  public users: object = [];
  public titles: object = [];
  public designations: object = [];
  public sites: object = [];

  name: any;
  surname: any;
  email: any;
  username: any;
  password: any;

  selectedRow: Number;

  setHeader = new HttpHeaders({
    'Content-Type': 'application/x-www-urlencoded;charset=utf-8;',
  });


  constructor(private _dataService: DataService, private _http: HttpClient, private router: Router) {
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
        });
        */


  }

  ngOnInit() {
    this.user();
    this.titleService();
    this.designService();
    this.siteService();

   // this.DropDownValue();
   if (localStorage.getItem('userData') === null) {
     this.router.navigate(['/']);
   }
  }

  user() {
    this._dataService.getUsers()
      .subscribe(res => this.users = res);
  }

  DropDownValue() {
    this._dataService.getDropDownValue()
      .subscribe(res => {
        this.titles = res[0];
        this.designations = res[1];
        this.sites = res[2];
      },
      err => console.log(err));
  }

  /////////////////////////
  titleService() {
    this._dataService.getTitle()
      .subscribe(res => this.titles = res);
  }

  siteService() {
    this._dataService.getSite()
      .subscribe(data => this.sites = data)
      .unsubscribe();
  }

  designService() {
    this._dataService.getDesignation()
      .subscribe(data => this.designations = data);
  }
  ///////////////////////////

      //  Edit button click Event
  editClick(index, NAME, SURNAME, PASSWORD, EMAIL, USERNAME) {
    this.selectedRow = index;
    console.log(this.selectedRow);
    console.log('Name: ' + NAME);
    console.log('Email: ' + EMAIL);

    console.log('Titles: ' + this.titles);
    console.log('Designation: ' + this.designations);
    console.log('Site' + this.sites);

    this.name = document.querySelector('#txtName');
    this.surname = document.querySelector('#txtSurname');
    this.email = document.querySelector('#txtEmail');
    this.username = document.querySelector('#txtUsername');
    this.password = document.querySelector('#txtPassword');

    this.name.value = NAME;
    this.surname.value = SURNAME;
    this.email.value = EMAIL;
    this.username.value = USERNAME;
    this.password.value = PASSWORD;

  }

  testEvent() {

    ///////////////////////////////////////////
    console.log('Titles: ' + this.titles);
    console.log('Designation: ' + this.designations);
    console.log('Site' + this.sites);
  }


}
