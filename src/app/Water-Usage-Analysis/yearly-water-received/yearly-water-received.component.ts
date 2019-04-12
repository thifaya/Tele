import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import * as  moment from 'moment';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);


@Component({
  selector: 'app-yearly-water-received',
  templateUrl: './yearly-water-received.component.html',
  styleUrls: ['./yearly-water-received.component.css']
})
export class YearlyWaterReceivedComponent implements OnInit {

  currentDate: Date = new Date();
  Highcharts = Highcharts;

 constructor(private router: Router) { }


  chartOptions = {
    chart: {
      type: 'column',
      options3d: {
          enabled: true,
          alpha: 15,
          beta: 5,
          depth: 45,
          frame: {
            bottom: {
              size: 1,
              color: 'lightgrey' // rgba(0, 0, 0, 0.02)
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
      text: 'Yearly Water Received Per Reservoir as at ' + moment(this.currentDate).format('LL')
    },
    xAxis: {
      type: 'category',
      title: {
        skew3d: true
      }
    },
    yAxis: {
      title: {
        skew3d: true,
        text: 'Total Water Received (KL)<br><br>'
      }

    },
    plotOptions: {
      series: {
        cursor: 'pointer',
        dataLabels: {
          enabled: true,
          format: '{point.y:.1f}%'
        }
      },
      column: {
        colorByPoint: true
      }
    },
    credits: {
        enabled: false
    },
    tooltip: {
      headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
      pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
    },

    series: [
     {
        name: 'Site',
        data: [
          {
            name: 'Fochville',
            y: 62.74,
            drilldown: 'Fochville'
          },
          {
            name: 'Carltonville',
            y: 10.57,
            drilldown: 'Carltonville'
          },
          {
            name: 'Blydeville',
            y: 7.23,
            drilldown: 'Blydeville'
          },
          {
            name: 'North',
            y: 5.58,
            drilldown: 'North'
          },
          {
            name: 'South',
            y: 4.02,
            drilldown: 'South'
          },
          {
            name: 'Wedela Small',
            y: 1.92,
            drilldown: 'Wedela Small'
          },
          {
            name: 'Other',
            y: 7.62,
            drilldown: null
          }
        ]
      }
    ]
  };

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
    //  this.router.navigate(['/']);
    }
  }

}
