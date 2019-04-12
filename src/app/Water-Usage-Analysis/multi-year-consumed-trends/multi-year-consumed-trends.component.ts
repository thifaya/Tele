import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Chart } from 'angular-highcharts';

import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);


@Component({
  selector: 'app-multi-year-consumed-trends',
  templateUrl: './multi-year-consumed-trends.component.html',
  styleUrls: ['./multi-year-consumed-trends.component.css']
})
export class MultiYearConsumedTrendsComponent implements OnInit {


  currentDate: Date = new Date();
  Highcharts = Highcharts;


  constructor(private router: Router) { }


  chartOptions = {
    chart: {
      type: 'column',
      options3d: {
        enabled: true,
        alpha: 15,
        beta: 15,
        viewDistance: 25,
        depth: 160,
        frame: {
          bottom: {
            size: 1,
            color: 'grey' // rgba(0, 0, 0, 0.02)
          },
          back: {
            size: 1,
            color: 'lightgrey' // rgba(0, 0, 0, 0.04)
          },
          side: {
            size: 1,
            color: 'grey' // rgba(0, 0, 0, 0.06)
          }
        }
      }
    },

    title: {
      text: 'Multi Year Water Consumed Trends Analysis'
    },

    xAxis: {
      categories: ['<b>Year</b>'],
      labels: {
        skew3d: true,
        style: {
          fontSize: '16px'
        }
      }
    },

    yAxis: {
      allowDecimals: false,
      min: 0,
      title: {
        text: '<b>Consumed Water (ML)</b>',
        skew3d: true
      }
    },
    credits: {
      enabled: false
    },
    tooltip: {
      headerFormat: '<b>{point.key}</b><br>',
      pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y}',
    },
    plotOptions: {
      column: {
        depth: 40
      }
    },

    series: [{
      name: '2016',
      data: [5],
      stack: 'male'
    }, {
      name: '2017',
      data: [3],
      stack: 'male'
    }, {
      name: '2018',
      data: [2],
      stack: 'female'
    }, {
      name: '2019',
      data: [0],
      stack: 'female'
    }]
  };

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
    //  this.router.navigate(['/']);
    }
  }

}
