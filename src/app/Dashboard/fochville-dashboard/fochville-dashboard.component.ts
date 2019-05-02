import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
// import { constants } from 'os';
import { chart } from 'chart.js';

@Component({
  selector: 'app-fochville-dashboard',
  templateUrl: './fochville-dashboard.component.html',
  styleUrls: ['./fochville-dashboard.component.css']
})
export class FochvilleDashboardComponent implements OnInit {

  constructor(private router: Router) { }

  alarmPath: any = '../assets/ImageView/alarm.PNG';
  rapidPath: any = '../assets/ImageView/rapid.PNG';
  activeCount = 0;
  currentDate: Date = new Date();


  ngOnInit() {
    if (sessionStorage.getItem('userData') === null) {
      window.alert('Must Login First');
    //  this.router.navigate(['/']);
      }

    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}






