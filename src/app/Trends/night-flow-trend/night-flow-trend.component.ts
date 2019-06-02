import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { CookieService } from 'ngx-cookie-service';
import * as  moment from 'moment';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);




@Component({
  selector: 'app-night-flow-trend',
  templateUrl: './night-flow-trend.component.html',
  styleUrls: ['./night-flow-trend.component.css']
})
export class NightFlowTrendComponent implements OnInit {

  currentDate: Date = new Date;
  w = 280; h = 280

  Highcharts = Highcharts;
  chartOptions3; chartOptions4; chart

  constructor(private router: Router, private cookie: CookieService) { }

  ngOnInit() {
   
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
     }
  
  }

  SetData() {
    this.cookie.set('username', 'Tebogo');
    this.cookie.set('password', 'password');
    sessionStorage.setItem('username', 'faya');
  }

    
  viewReport() {

    this.chartOptions3 = {
      chart: {
        type: 'column',
        width: this.w,
        height: this.h
      },
      title: {
        text: 'Intel 1 Flow Rate' //'Daily Level Trend For  ' + this.siteName + ' Dated ' + moment(date).format('LL')
      },
      plotOptions: {
        series: {
          point: {}
        },
        line: {
          marker: {
            enabled: false
          }
        }
      },
      yAxis: {
        title: {
          text: 'Level'
        }
      },
      xAxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
       //  [ ' 00:00:01', '01:00:00', '02:00:00', '03:00:00', '04:00:00', '05:00:00', '06:00:00', '07:00:00', '08:00:01', '09:00:00', '10: 00: 00', '11: 00: 00', '12: 00: 00', '13: 00: 00', '14: 00: 00', ' 15: 00: 00', '16: 00: 00', '17: 00: 00', ' 18: 00: 00', ' 19: 00: 00', '20: 00: 00', '21: 00: 00', '22: 00: 00', '23: 00: 00']
      },
      tooltip: {
        //  valueSuffix: ' °C'
        
  crosshairs: true,
  shared: true,
  headerFormat: '<b>{series.name}</b>: {point.x}<br />',
  pointFormat: '<b>Level:<b> {point.y}'
      },
      responsive: {
        rules: [{
          condition: {
            maxWidth: 500
          },
          chartOptions: {
            legend: {
              //
            }
          }
        }]
      },
      
      credits: {
        enabled: false
      },
      series: [
        {
          name: 'Time',
          data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
          enablePolling: true 
        }]
    };
  
    this.chartOptions4 = {
      chart: {
        type: 'line',
        width: this.w,
        height: this.h
      },
      title: {
        text: 'Intel 2 Flow Rate' //'Daily Level Trend For  ' + this.siteName + ' Dated ' + moment(date).format('LL')
      },
      plotOptions: {
        series: {
          point: {}
        },
        line: {
          marker: {
            enabled: false
          }
        }
      },
      yAxis: {
        title: {
          text: 'Level'
        }
      },
      xAxis: {
        categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
       //  [ ' 00:00:01', '01:00:00', '02:00:00', '03:00:00', '04:00:00', '05:00:00', '06:00:00', '07:00:00', '08:00:01', '09:00:00', '10: 00: 00', '11: 00: 00', '12: 00: 00', '13: 00: 00', '14: 00: 00', ' 15: 00: 00', '16: 00: 00', '17: 00: 00', ' 18: 00: 00', ' 19: 00: 00', '20: 00: 00', '21: 00: 00', '22: 00: 00', '23: 00: 00']
      },
      tooltip: {
        //  valueSuffix: ' °C'
        
  crosshairs: true,
  shared: true,
  headerFormat: '<b>{series.name}</b>: {point.x}<br />',
  pointFormat: '<b>Level:<b> {point.y}'
      },
      responsive: {
        rules: [{
          condition: {
            maxWidth: 500
          },
          chartOptions: {
            legend: {
              //
            }
          }
        }]
      },
      
      credits: {
        enabled: false
      },
      series: [
        {
          name: 'Time',
          data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
          enablePolling: true 
        }]
    };    
  }

}
