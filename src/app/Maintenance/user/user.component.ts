import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Server/data.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { delay, take, concatMap, map } from 'rxjs/operators';
import * as mssql from 'mssql';





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
  public accessLevels: Object = [];

  name: any;
  surname: any;
  email: any;
  username: any;
  password: any;

  selectedRow: Number;

  getHeader = new HttpHeaders({
    'Content-Type': 'application/x-www-urlencoded;charset=utf-8;',
    'responseType': 'json',
    'Access-Control-Allow-Origin': '*',
    'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, PATCH, OPTIONS',
    'Access-Control-Allow-Headers': 'X-Requested-With, content-type, Authorization'
  });
  // msSQL


  constructor(private _dataService: DataService, private _http: HttpClient, private router: Router) {
  }

  ngOnInit() {
    this.DropDownValue();
   // this.DropDownValue2();
    if (localStorage.getItem('userData') === null) {
      // this.router.navigate(['/']);
    }
  }

  user() {
    this._dataService.getUsers()
      .subscribe(res => this.users = res);
  }

  DropDownValue() {
    this._dataService.getUsers()
      .subscribe(_user => {
        this.users = _user;
        this._dataService.getTitle()
          .subscribe(_title => {
            this.titles = _title;
            this._dataService.getDesignation()
              .subscribe(_designation => {
                this.designations = _designation;
                this._dataService.getSite()
                  .subscribe(_site => {
                    this.sites = _site;
                    this._dataService.getAccessLevel()
                      .subscribe(_access => {
                        this.accessLevels = _access;
                      });
                  });
              });
          });
      });
  }
  DropDownValue2() {
    this._http.get('http://154.0.172.85:5000/users', { headers: this.getHeader }).subscribe(user => {
      this.users = user;
      this._http.get('http://154.0.172.85:5000/title', { headers: this.getHeader }).subscribe(title => {
        this.titles = title;
        this._http.get('http://154.0.172.85:5000/designation', { headers: this.getHeader }).subscribe(designation => {
          this.designations = designation;
          this._http.get('http://154.0.172.85:5000/site', { headers: this.getHeader }).subscribe(site => {
            this.sites = site;
          });
        });
      });
    });
  }
  //////////////////////////////////////////////////

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
