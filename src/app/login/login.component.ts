import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { DataService } from '../Server/data.service';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
import { FormsModule, NgForm } from '@angular/forms';
import { HttpResponse, HttpErrorResponse } from '@angular/common/http';


@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  loginUserData;
  invalid = false;
  userData;

  // variable to store User's Details
  UserId: number;
  TitleId: number;
  Name: string;
  Surname: string;
  Username: string;
  Password: string;
  ModifiedDate: Date;
  ModifiedUserId: number;
  IsActive: boolean;
  Email: string;
  DesignationID: number;
  MunicipalSiteID: number;
  UserAccessLevelId: number;
  Create_Update_User: boolean;
  Start_Stop_Pump: boolean;
  View_Financial_Report: boolean;
  Amend_Financial_Details: boolean;

  @Output() NameEvent: EventEmitter<string> = new EventEmitter();

  constructor(private cookie: CookieService, private _auth: DataService, private router: Router) {
  }


  ngOnInit() {
  }

  loginUser(event) {

    this.invalid = false;
    event.preventDefault();
    const target = event.target;
    const username = target.querySelector('#txtUsername').value;
    const password = target.querySelector('#txtPassword').value;

    this.loginUserData = { 'username': username, 'password': password };

   this._auth.loginService(this.loginUserData)
    .subscribe(
      res => {
        if (res.length === 1) {
          this.invalid = false;
          console.log(res);
          console.log(res.length);

          this.userData = res[0];
          localStorage.setItem('userData', JSON.stringify(this.userData));

          this.Name    = this.userData.Name;
          localStorage.setItem('Name', JSON.stringify(this.userData.Name));
          sessionStorage.setItem('Name', JSON.stringify(this.userData.Name));

          this.Surname = this.userData.Surname;
          localStorage.setItem('Surname', JSON.stringify(this.userData.Surname));

          this.Username = this.userData.UserName;
          localStorage.setItem('Username', JSON.stringify(this.userData.Username));
          sessionStorage.setItem('Username', JSON.stringify(this.userData.Username));

          this.Password = this.userData.Password;
          localStorage.setItem('Password', JSON.stringify(this.userData.Password));

          this.UserId = this.userData.UserId;
          localStorage.setItem('UserId', JSON.stringify(this.userData.UserId));

          this.Email = this.userData.Email;
          localStorage.setItem('Email', JSON.stringify(this.userData.Email));

          this.ModifiedDate = this.userData.ModifiedDate;
          localStorage.setItem('ModifiedDate', JSON.stringify(this.userData.ModifiedDate));

          this.TitleId = this.userData.TitleId;
          localStorage.setItem('TitleId', JSON.stringify(this.userData.TitleId));

          this.DesignationID = this.userData.DesignationID;
          localStorage.setItem('DesignationID', JSON.stringify(this.userData.DesignationID));

          this.MunicipalSiteID = this.userData.MunicipalSiteID;
          localStorage.setItem('MunicipalSiteID', JSON.stringify(this.userData.MunicipalSiteID));

          this.UserAccessLevelId = this.userData.UserAccessLevelId;
          localStorage.setItem('UserAccessLevelId', JSON.stringify(this.userData.UserAccessLevelId));

          this._auth.dataChanged(this.Name);

          this.NameEvent.emit(this.Name);

          console.log(this.Name);

          this.router.navigate(['/leveltrends']);
        } else {
          this.invalid = true;
          console.log(res);
        }

      },
      err => {
        window.alert(err.name + ':  ' + err.statusText);
        console.log(err);
      });
  }

  // Remember me checkBox
  rememberMe(event) {
    this.invalid = false;
    event.preventDefault();
    const target = event.target;
    const username = target.querySelector('#txtUsername').value;
    const password = target.querySelector('#txtPassword').value;
    const check = target.querySelector('#chckboxRemember').checked;
    if (check) {
      this.cookie.set('username', username);
      this.cookie.set('password', password);
      console.log('Checkbox is ' + check);
    } else {
      console.log('Checkbox is ' + check);
    }

  }

}
