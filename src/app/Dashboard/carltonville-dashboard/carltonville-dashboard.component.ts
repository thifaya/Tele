import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);

@Component({
  selector: 'app-carltonville-dashboard',
  templateUrl: './carltonville-dashboard.component.html',
  styleUrls: ['./carltonville-dashboard.component.css']
})
export class CarltonvilleDashboardComponent implements OnInit {

  alarmPath: any = '../assets/ImageView/alarmLED.PNG';
  rapidPath: any = '../assets/ImageView/rapid.PNG';
  activeCount = 0;
  currentDate: Date = new Date();
  Highcharts = Highcharts;
  point;

  constructor(private router: Router) { }

  /*
  chartOptions = {
    chart: {
      type: 'gauge',
      plotBackgroundColor: null,
      plotBackgroundImage: null,
      plotBorderWidth: 0,
      plotShadow: false
  },

  title: {
      text: 'Speedometer'
  },

  pane: {
      startAngle: -150,
      endAngle: 150,
      background: [{
          backgroundColor: {
              linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
              stops: [
                  [0, '#FFF'],
                  [1, '#333']
              ]
          },
          borderWidth: 0,
          outerRadius: '109%'
      }, {
          backgroundColor: {
              linearGradient: { x1: 0, y1: 0, x2: 0, y2: 1 },
              stops: [
                  [0, '#333'],
                  [1, '#FFF']
              ]
          },
          borderWidth: 1,
          outerRadius: '107%'
      }, {
          // default background
      }, {
          backgroundColor: '#DDD',
          borderWidth: 0,
          outerRadius: '105%',
          innerRadius: '103%'
      }]
  },

  // the value axis
  yAxis: {
      min: 0,
      max: 200,

      minorTickInterval: 'auto',
      minorTickWidth: 1,
      minorTickLength: 10,
      minorTickPosition: 'inside',
      minorTickColor: '#666',

      tickPixelInterval: 30,
      tickWidth: 2,
      tickPosition: 'inside',
      tickLength: 10,
      tickColor: '#666',
      labels: {
          step: 2,
          rotation: 'auto'
      },
      title: {
          text: 'km/h'
      },
      plotBands: [{
          from: 0,
          to: 120,
          color: '#55BF3B' // green
      }, {
          from: 120,
          to: 160,
          color: '#DDDF0D' // yellow
      }, {
          from: 160,
          to: 200,
          color: '#DF5353' // red
      }]
  },

  series: [{
      name: 'Speed',
      data: [80],
      tooltip: {
          valueSuffix: ' km/h'
      }
  }]

};
*/

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
