import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);


@Component({
  selector: 'app-monthly-trend',
  templateUrl: './monthly-trend.component.html',
  styleUrls: ['./monthly-trend.component.css']
})
export class MonthlyTrendComponent implements OnInit {

  site;
  month;
  trend;

  siteName;
  monthName;
  trendName;

  chart;
  currentDate: Date = new Date;
  invalid: boolean;

  siteIndex;
  monthIndex;
  trendIndex;

  chartOptions;
  Highcharts = Highcharts;


  constructor(private router: Router) { }




  ngOnInit() {
    this.invalid = false;
    if (localStorage.getItem('userData') === null) {
     // this.router.navigate(['/']);
    }
  }

  viewReport() {
    this.invalid = true;

    this.site = document.querySelector('#ddlSite');
    this.month = document.querySelector('#ddlMonth');
    this.trend = document.querySelector('#ddlTrends');

    this.siteIndex = this.site.value;
    this.monthIndex = this.month.value;
    this.trendIndex = this.trend.value;

    this.siteName = this.site[++this.siteIndex].label;
    this.monthName = this.month[++this.monthIndex].label;
    this.trendName = this.trend[++this.trendIndex].label;

    this.chartOptions = {
      chart: {
         type: 'area'
      },
      title: {
         text: 'Monthly ' + this.trendName + ' For: ' + this.siteName + ' (' + this.monthName + ')'
      },
      legend : {
         layout: 'vertical',
         align: 'left',
         verticalAlign: 'top',
         x: -150,
         y: 100,
         floating: true,
         borderWidth: 1,
         backgroundColor: '#FFFFFF'
      },
      xAxis: {
       title: {
         text: '<b>Date</b>'
       },
        categories: [
          'Monday',
          'Tuesday',
          'Wednesday',
          'Thursday',
          'Friday',
          'Saturday',
          'Sunday'
        ],
        plotBands: [{ // visualize the weekend
          color: 'rgba(68, 170, 213, .2)',
        }]
      },
      yAxis : {
        title: {
          text: '<b>Water Level</b>'
        },
         labels: {
            formatter: function () {
               return this.value;
            }
         },
         min: 0
      },
      tooltip : {
         formatter: function () {
            return '<b>' + this.series.name + '</b><br/>' +
               this.x + ': ' + this.y;
         }
      },
      plotOptions : {
         area: {
            fillOpacity: 0.5,
            marker: {
              enabled: false
            }
         }
      },
      credits: {
         enabled: false
      },
      series: [
        {
          name: 'Date',
          data: [0, 2, 3, 2, 4, 2, 3]
        }
      ]
   };

    console.log('Monthly Trend Report Retrieved');
    /*  */

  }
}

/* chart

    this.chart = new Chart({
      chart: {
        type: 'spline'
      },
      title: {
        text: 'Monthly ' + this.trendName + ' For: ' + this.siteName + ' (' + this.monthName + ')'
      },
      //
      subtitle: {
        style: {
          position: 'absolute',
          right: '0px',
          bottom: '10px'
        }
      },
      xAxis: {
        categories: [
          'Monday',
          'Tuesday',
          'Wednesday',
          'Thursday',
          'Friday',
          'Saturday',
          'Sunday'
        ],
        plotBands: [{ // visualize the weekend
          color: 'rgba(68, 170, 213, .2)',
        }]
      },
      responsive: {
        rules: [{
          condition: {
            maxWidth: 500
          },
          chartOptions: {
            legend: {
              layout: 'vertical',
              align: 'left',
              verticalAlign: 'top',
              //
              x: -150,
              y: 100,
              floating: true,
              borderWidth: 1,
              backgroundColor: '#FFFFFF'
            }
          }
        }]
      },
     yAxis: {
        title: {
          text: '<b>Water Level</b>'
        },
        labels: {
           formatter: function () {
              return this.value;
           }
        },
        min: 0
      },
      tooltip : {
        formatter: function () {
           return '<b>' + this.series.name + '</b><br/>' +
              this.x + ': ' + this.y;
        }
     },
     plotOptions: {
       area: {
         fillOpacity: 0.5,
         marker: {
           enabled: false
         }
       },
     },
     credits: {
       enabled: false
     },
     series: [
       {
         type: 'spline',
         name: 'Date',
         data: [0, 2, 3, 2, 4, 2, 3]
       }
     ]
   });

*/
