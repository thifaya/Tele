import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Service/data.service';
import { HttpHeaders, HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import * as mssql from 'mssql';
import { empty } from 'rxjs';
import { random } from '@amcharts/amcharts4/.internal/core/utils/String';



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

  checkBoxCreate
  checkBoxReport
  checkBoxDetails
  checkBoxPumps


  userId
  ID
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
  emptyField = false
  emptyUpdate = false
  userActive = {}
  siteString: string
  userJSON = {}
  saveButton; edit = false

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

    this.name = document.querySelector('#txtName');
    this.surname = document.querySelector('#txtSurname');
    this.email = document.querySelector('#txtEmail');
    this.username = document.querySelector('#txtUsername');
    this.password = document.querySelector('#txtPassword');
    this.accessLevel = document.querySelector('#ddlAccessLevel');
    this.Title = document.querySelector('#ddlTitle');
    this.Site = document.querySelector('#ddlMunicipalSite');
    this.Design = document.querySelector('#ddlDesignation');

    this.checkBoxCreate = document.querySelector('#chkboxCreateupdateUser');
    this.checkBoxReport = document.querySelector('#chkboxViewFinanceReport');
    this.checkBoxDetails = document.querySelector('#chkboxAmendFinanceDetails');
    this.checkBoxPumps = document.querySelector('#chkboxStartStopPumps');
    

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

   if (localStorage.getItem('UserId') === null) {
    this.router.navigate(['/']);
   }

    
    if (sessionStorage.getItem('UserId') === null) {
      // this.router.navigate(['/']);
    }
  }
  
  
  //////////////////////////////////////////////////


  //  Edit button click Event
  editClick(index ,USERID ,NAME, SURNAME, PASSWORD, EMAIL, USERNAME, ACCESSLEVEL, DESIGNATION, SITE, TITLE) {
    this.selectedRow = index;
    console.log(this.selectedRow);
    console.log('Name: ' + NAME);
    console.log('Email: ' + EMAIL);
    this.ID = USERID
    
/**
 *     this.name = document.querySelector('#txtName');
    this.surname = document.querySelector('#txtSurname');
    this.email = document.querySelector('#txtEmail');
    this.username = document.querySelector('#txtUsername');
    this.password = document.querySelector('#txtPassword');
    this.accessLevel = document.querySelector('#ddlAccessLevel');
    this.Title = document.querySelector('#ddlTitle');
    this.Site = document.querySelector('#ddlMunicipalSite');
    this.Design = document.querySelector('#ddlDesignation')
 */
;

    
    this.saveButton = document.querySelector('#btnSave');
    this.edit = true

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

if(!ACTIVE) {
  this.userActive = {"activate": ACTIVE}
  
  this._dataService.ActivateUser(ID)
  .subscribe(res => { 
    window.location.reload()
    console.log(this.userActive);
    console.log(res);

  }, 
  err => console.log(err))
}


}


DeActivate(index, ID, ACTIVE){
  //{"activate": false, "userId": 2}  user.UserId   user.IsActive
  this.selectedRow = index;
  this.userActive = {"activate": ACTIVE}
  
if(ACTIVE) {
  this._dataService.DeactivateUser(ID)
  .subscribe(res => {
    window.location.reload()
    console.log(this.userActive);
    console.log(res);
    
  }, 
  err => console.log(err))
}
  
  }


  updateUser() {   
    
    if(this.Title.value == '' || this.name.value == '' || this.surname.value == '' || this.email.value == '' || this.Design.value == '' || this.username.value == '' || this.password.value == '' || this.Site.value == '' || this.accessLevel.value == '') {
      this.emptyField = true;
      console.log('Empty Field!')
    } else {
      this.emptyField = false
      this.siteString = this.Site.value;
      const siteArray = this.siteString.split('~', 2)
      

      if (localStorage.getItem('UserId') != null) {
        JSON.parse(localStorage.getItem('UserId'));
        this.userId = JSON.parse(localStorage.getItem('UserId'));
       } else {
        this.userId = null
       }

      this.userJSON  = {//'UserId': number  //  SQL generated
        'TitleId':  this.Title.value,
        'Name': this.name.value,
        'Surname':  this.surname.value,
        'UserName':  this.username.value,
        'Password':  this.password.value,
        //'ModifiedDate':  new Date,
        'ModifiedUserId':  this.userId,
        'Email':  this.email.value,
        'DesignationID':  this.Design.value,
        'MunicipalSiteID':  siteArray[0],
        'UserAccessLevelId':  this.accessLevel.value,
        'Create_Update_User': this.checkBoxCreate.checked,
        'Start_Stop_Pump': this.checkBoxPumps.checked,
        'View_Financial_Report': this.checkBoxReport.checked,
        'Amend_Financial_Details': this.checkBoxDetails.checked
      } 
      
      console.log(this.userJSON)


      this._dataService.updateUser(this.ID, this.userJSON)
        .subscribe(res => {
          console.log('User Saved')
          console.log(res)
          window.location.reload();
        })
    } 

  }

  enableAdd() {
    this.edit = false
  }
  

  createUser() { 
    
    if(this.Title.value == '' || this.name.value == '' || this.surname.value == '' || this.email.value == '' || this.Design.value == '' || this.username.value == '' || this.password.value == '' || this.Site.value == '' || this.accessLevel.value == '') {
      this.emptyField = true;
      console.log('Empty Field!')
    } else {
      this.emptyField = false
      
      this.siteString = this.Site.value;
      const siteCreateArray = this.siteString.split('~', 2)
 
      console.log('User Saved')

      if (localStorage.getItem('UserId') != null) {
        JSON.parse(localStorage.getItem('UserId'));
        this.userId = JSON.parse(localStorage.getItem('UserId'));
       } else {
        this.userId = null
       }

       this.siteString = this.Site.value;
       const siteArray = this.siteString.split('~', 2)
  
       console.log('User Saved')
 
       if (localStorage.getItem('UserId') != null) {
         JSON.parse(localStorage.getItem('UserId'));
         this.userId = JSON.parse(localStorage.getItem('UserId'));
        } else {
         this.userId = null
        }
 
       this.userJSON  = {
 
         //'UserId': number  //  SQL generated
         'TitleId':  this.Title.value,
         'Name': this.name.value,
         'Surname':  this.surname.value,
         'UserName':  this.username.value,
         'Password':  this.password.value,
         'ModifiedDate':  new Date,
         'ModifiedUserId':  this.userId,
         'IsActive':  true,  
         'Email':  this.email.value,
         'DesignationID':  this.Design.value,
         'MunicipalSiteID':  siteArray[0],
         'UserAccessLevelId':  this.accessLevel.value,
         'Create_Update_User': this.checkBoxCreate.checked,
         'Start_Stop_Pump': this.checkBoxPumps.checked,
         'View_Financial_Report': this.checkBoxReport.checked,
         'Amend_Financial_Details': this.checkBoxDetails.checked
   
       } 
       
       console.log(this.userJSON) 
      
      console.log(this.userJSON)
 
    } 
    
  }

  testEvent() { 
    ///////////////////////////////////////////
    console.log('Titles: ' + this.titles);
    console.log('Designation: ' + this.designations);
    console.log('Site' + this.sites);
  }

/**
 *     
 *  UserId: number;
 * IsActive: boolean;
 * MunicipalSiteID: number;
 * 
    TitleId: number;
    Name: string;
    Surname: string;
    UserName: string;
    Password: string;
    ModifiedDate: Date;
    ModifiedUserId: number;
    
    Email: string;
    DesignationID: number;
    
    UserAccessLevelId: number;
    Create_Update_User: boolean;
    Start_Stop_Pump: boolean;
    View_Financial_Report: boolean;
    Amend_Financial_Details: boolean;
 */


}
