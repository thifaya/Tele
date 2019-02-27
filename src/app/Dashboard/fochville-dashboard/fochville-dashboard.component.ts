import { Component, OnInit } from '@angular/core';
import { DateTimeFormats } from 'highcharts';
// import { constants } from 'os';
// import { chart.js } from 'chart.js';

@Component({
  selector: 'app-fochville-dashboard',
  templateUrl: './fochville-dashboard.component.html',
  styleUrls: ['./fochville-dashboard.component.css']
})
export class FochvilleDashboardComponent implements OnInit {

  constructor() {
    this.options = {
      title: { text: 'Angular 2 high charts example with selection event ' },
      chart: { zoomtype: 'gauge' },
      series: [{ data: [20.7, 88.8, 222.4, 154.2, 50, 17, 120], }]
    };
  }
  options: Object;
  chart = {
    type: 'guage'
  };

  pane = {
    startAngle: -150,
    endAngle: 150
  };

  alarmPath: any = '../assets/ImageView/alarm.PNG';
  rapidPath: any = '../assets/ImageView/rapid.PNG';
  activeCount = 0;
  currentDate: Date = new Date();


 ngOnInit() {
  }

}






