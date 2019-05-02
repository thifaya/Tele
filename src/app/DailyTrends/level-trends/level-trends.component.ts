import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import * as  moment from 'moment';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);

@Component({
  selector: 'app-level-trends',
  templateUrl: './level-trends.component.html',
  styleUrls: ['./level-trends.component.css']
})
export class LevelTrendsComponent implements OnInit {

  public date;
  site;
  dateValue;
  invalid: boolean;
  siteName;
  index;

  Highcharts = Highcharts;
  chartOptions;

  constructor(private router: Router) { }

  formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
  format = this.formats[0];
  selectedDay: string;


  post() {
    this.invalid = true;

    this.site = document.querySelector('#ddlSite');
    this.date = document.querySelector('#dpDate');

    this.index = this.site.value;
    this.dateValue = this.date.value;

    this.siteName = this.site[++this.index].label;

    this.chartOptions = {
      chart: {
         type: 'spline'
      },
      title: {
        text: 'Daily Level Trend For  ' + this.siteName + ' Dated ' + moment(this.dateValue).format('LL')
      },
      plotOptions: {
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
        categories: ['00:00', '04:00', '08:00', '12:00', '17:00', '21:00']
      },
      tooltip: {
       //  valueSuffix: ' °C'
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
        data: [1, 2, 3, 2, 4, 2]
      }]
   };

    console.log('Level Trend Report retrieved');
/**/
  }


  ngOnInit() {
    this.invalid = false;

    if (sessionStorage.getItem('userData') === null) {
      window.alert('Must Login First');
    //  this.router.navigate(['/']);
      }

    if (localStorage.getItem('userData') === null) {
    //  this.router.navigate(['/']);
    }
  }

}


/*
    this.chart = new Chart({
      chart: {
        type: 'line'
      },
      title: {
        text: 'Daily Level Trend For  ' + this.siteName + ' Dated ' + moment(this.date.value).format('LL')
      },
      plotOptions: {
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
      responsive: {
        rules: [{
          condition: {
            maxWidth: 500
          },
          chartOptions: {
            legend: {
              layout: 'vertical',
              align: 'right',
              verticalAlign: 'middle'
            }
          }
        }]
      },
      xAxis: {
        categories: ['00:00', '04:00', '08:00', '12:00', '17:00', '21:00']
      },
      credits: {
        enabled: false
      },
      series: [
        {
          name: 'Time',
          data: [1, 2, 3, 2, 4, 2]
        }
      ]
    });
*/
