import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Server/data.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
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
  accessLevel: any;
  Title: any;
  Site: any;
  Design: any;
  active: boolean
  row; userActive = {}

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
    

   this._dataService.getUsers()
      .subscribe(_user => {
        this.users = _user;
        this._dataService.getTitle()
          .subscribe(_title => {
            this.titles = _title;
            this._dataService.getDesignation()
              .subscribe(_designation => {
                this.designations = _designation;
                this._dataService.getAllSite()
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

   if (localStorage.getItem('userData') === null) {
    this.router.navigate(['/']);
   }

    
    if (sessionStorage.getItem('userData') === null) {
      // this.router.navigate(['/']);
    }
  }
  
  
  //////////////////////////////////////////////////


  //  Edit button click Event
  editClick(index, NAME, SURNAME, PASSWORD, EMAIL, USERNAME, ACCESSLEVEL, DESIGNATION, SITE, TITLE) {
    this.selectedRow = index;
    console.log(this.selectedRow);
    console.log('Name: ' + NAME);
    console.log('Email: ' + EMAIL);
    

    this.name = document.querySelector('#txtName');
    this.surname = document.querySelector('#txtSurname');
    this.email = document.querySelector('#txtEmail');
    this.username = document.querySelector('#txtUsername');
    this.password = document.querySelector('#txtPassword');
    this.accessLevel = document.querySelector('#ddlAccessLevel');
    this.Title = document.querySelector('#ddlTitle');
    this.Site = document.querySelector('#ddlMunicipalSite');
    this.Design = document.querySelector('#ddlDesignation');

    this.name.value = NAME;
    this.surname.value = SURNAME;
    this.email.value = EMAIL;
    this.username.value = USERNAME;
    this.password.value = PASSWORD;
    this.accessLevel.value = ACCESSLEVEL;
    this.Title.value = TITLE;
    this.Site.value = SITE;
    this.Design.value = DESIGNATION;

//selected="selected"

  }

Activate(index, ID, ACTIVE){
//{"activate": false, "userId": 2}  user.UserId   user.IsActive
this.selectedRow = index;
this.userActive = {"activate": ACTIVE, "userId": ID}

this._dataService.ActivatteUser(ID, ACTIVE)
  .subscribe(res => { 
    console.log(this.userActive);
    console.log(res);
  }, 
  err => console.log(err))

}

DeActivate(index, ID, ACTIVE){
  //{"activate": false, "userId": 2}  user.UserId   user.IsActive
  this.selectedRow = index;
  this.userActive = {"activate": ACTIVE, "userId": ID}
  
  this._dataService.DeactivateUser(this.userActive)
    .subscribe(res => {
      console.log(this.userActive);
      console.log(res);
    })
  
  }


  updateUser() {

    this.name = document.querySelector('#txtName');
    this.surname = document.querySelector('#txtSurname');
    this.email = document.querySelector('#txtEmail');
    this.username = document.querySelector('#txtUsername');
    this.password = document.querySelector('#txtPassword');
    this.accessLevel = document.querySelector('#ddlAccessLevel');
    this.Title = document.querySelector('#ddlTitle');
    this.Site = document.querySelector('#ddlMunicipalSite');
    this.Design = document.querySelector('#ddlDesignation');

  
  }

  testEvent() {

    ///////////////////////////////////////////
    console.log('Titles: ' + this.titles);
    console.log('Designation: ' + this.designations);
    console.log('Site' + this.sites);
  }


}
