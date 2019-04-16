import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';


@Component({
  selector: 'app-night-flow-trend',
  templateUrl: './night-flow-trend.component.html',
  styleUrls: ['./night-flow-trend.component.css']
})
export class NightFlowTrendComponent implements OnInit {

  currentDate: Date = new Date;

  constructor(private router: Router, private cookie: CookieService) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
     // this.router.navigate(['/']);
    }
  }

  SetData() {
    this.cookie.set('username', 'Tebogo');
    this.cookie.set('password', 'password');
    sessionStorage.setItem('username', 'faya');
  }

}
