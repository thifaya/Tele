import { Component, OnInit, Output, EventEmitter } from '@angular/core';
import { DataService } from '../Server/data.service';
import { Router } from '@angular/router';
import { HttpClient } from '@angular/common/http';
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
  myData;
  name: string;
  @Output() public setName = new EventEmitter<string>();

  constructor(private _http: HttpClient, private _auth: DataService, private router: Router) { }


  ngOnInit() {
  }

  loginUser(event) {

    this.invalid = false;
    event.preventDefault();
    const target = event.target;
    const username = target.querySelector('#txtUsername').value;
    const password = target.querySelector('#txtPassword').value;

    this.loginUserData = { 'username': username, 'password': password };

   this._auth.login(this.loginUserData)
    .subscribe(
      res => {
        if (res.length === 1) {
          this.invalid = false;
          console.log(res);
          console.log(res.length);
          console.log(res[0].UserId );
          this.name = res[0].Name;
          this.setName.emit(res[0].Name);
          this.router.navigate(['/leveltrends']);
        } else {
          this.invalid = true;
        }

      },
      err => console.log(err));
  }


  login(event) {
    event.preventDefault();
    const target = event.target;
    const username = target.querySelector('#txtUsername').value;
    const password = target.querySelector('#txtPassword').value;
    console.log(username);
    console.log(password);


    /*  this._auth.login(username, password).subscribe(data => {
        if (username === data.username && password === data.password) {
          this.router.navigate(['leveltrends']);
          this.invalid = false;
        } else {
          this.invalid = true;
        }
      }); */
  }
/*
  loginUser(event) {
    event.preventDefault();
    const target = event.target;
    const username = target.querySelector('#txtUsername').value;
    const password = target.querySelector('#txtPassword').value;

    this.loginUserData = { 'username': username, 'password': password };

    this._auth.loginUser(this.loginUserData)
      .subscribe(
        res => console.log(res),
        err => console.log(err)
      );
  }

     this._auth.loginUser(this.loginUserData)
        .subscribe(
          res => console.log(res),
          err => console.log(err)
        );


        this._auth.loginUser(this.myData)
      .subscribe(
        res => {
          if (res.status === 200 && res.result === true) {
          // k
          console.log(res);
          this.router.navigate(['leveltrends']);
        }},
        err => {
          this.invalid = true,
          console.log(err);
        }

      );

    loginuser(username, password) {
      this._auth.loginUser(username, password)
        .subscribe( data => {
          this.router.navigate(['/leveltrends']);
        },
          (err: HttpErrorResponse) => {
            this.invalid = true;
          }
        );

        console.log(this.loginData);
    }
  */

}
