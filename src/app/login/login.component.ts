import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.css']
})
export class LoginComponent implements OnInit {

  constructor() { }
  invalid = false;
  username: any;
  password: any;

  setTest() {
    if ( this.username === 'Admin' && this.password === 'admin') {
    this.invalid = false;
    } else {
    this.invalid = true;
    }
  }

  ngOnInit() {
  }

}
