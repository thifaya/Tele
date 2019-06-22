import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { DataService } from '../Service/data.service';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
import { CookieService } from 'ngx-cookie-service';
import { FormsModule, NgForm } from '@angular/forms';
import { HttpResponse, HttpErrorResponse } from '@angular/common/http';
import swal from 'sweetalert';


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
  IsActive: boolean;
 /*
  ModifiedDate: Date;
  ModifiedUserId: number;
  Email: string;
  DesignationID: number;
  MunicipalSiteID: number;
  UserAccessLevelId: number;
  Create_Update_User: boolean;
  Start_Stop_Pump: boolean;
  View_Financial_Report: boolean;
  Amend_Financial_Details: boolean;
*/
  @Output() NameEvent: EventEmitter<string> = new EventEmitter();

  constructor(private cookie: CookieService, private _auth: DataService, private router: Router) {
  }


  ngOnInit() {
  }

  loginUser(event) {

    //swal('Login Button')

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
          this.userData = res[0];
          
          this.invalid = false;
          console.log(this.userData.IsActive);



          if( this.userData.IsActive ) {
            
          this.Name    = this.userData.Name;
          localStorage.setItem('Name', JSON.stringify(this.userData.Name));
          sessionStorage.setItem('Name', JSON.stringify(this.userData.Name));

          this.Surname = this.userData.Surname;
          localStorage.setItem('Surname', JSON.stringify(this.userData.Surname));
          sessionStorage.setItem('Surname', JSON.stringify(this.userData.Surname));

          this.Username = this.userData.UserName;
          localStorage.setItem('Username', JSON.stringify(this.userData.UserName));
          sessionStorage.setItem('Username', JSON.stringify(this.userData.UserName));

          this.Password = this.userData.Password;

          this.UserId = this.userData.UserId;
          localStorage.setItem('UserId', JSON.stringify(this.userData.UserId));
          sessionStorage.setItem('UserId', JSON.stringify(this.userData.UserId));
        

          this._auth.dataChanged(this.Name);

          this.NameEvent.emit(this.Name);

          console.log(this.Name);

          this.router.navigate(['/leveltrends']);

          } else {
           // window.alert('User has been deactivated')
            swal('User has been deactivated')
            console.log('User Has Been Deactivated')
          }
          
        } else {
          this.invalid = true;
          console.log(res);
        }

      },
      err => {
        //window.alert('Server Error');
        swal('Server Error')
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
