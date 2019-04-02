import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-carltonville-dashboard',
  templateUrl: './carltonville-dashboard.component.html',
  styleUrls: ['./carltonville-dashboard.component.css']
})
export class CarltonvilleDashboardComponent implements OnInit {

  constructor(private router: Router) { }

  alarmPath: any = '../assets/ImageView/alarmLED.PNG';
  rapidPath: any = '../assets/ImageView/rapid.PNG';
  activeCount = 0;
  currentDate: Date = new Date();

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
