import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-carltonville-dashboard',
  templateUrl: './carltonville-dashboard.component.html',
  styleUrls: ['./carltonville-dashboard.component.css']
})
export class CarltonvilleDashboardComponent implements OnInit {

  constructor() { }
  alarmPath: any = '../assets/ImageView/alarmLED.PNG';
  rapidPath: any = '../assets/ImageView/rapid.PNG';
  activeCount = 0;
  currentDate: Date = new Date();

  ngOnInit() {
  }

}
