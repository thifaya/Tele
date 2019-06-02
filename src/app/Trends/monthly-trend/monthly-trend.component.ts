import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Server/data.service';
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

  currentDate: Date = new Date;
  visible: boolean;
  notFound: boolean;

  siteIndex: string;
  monthIndex: string;
  trendIndex: string;

  chartOptions;
  Highcharts = Highcharts;
  results;

  i: number; SITES
  
  chart = [];
  sum
  jsonDATA

  constructor(private router: Router, private _service: DataService) {
    this._service.getAllSite()
      .subscribe(res => {
        this.SITES = res;
      },
      err => console.log(err))
    }




  ngOnInit() {
   
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
     }
  
  }
                  

  viewReport() {

    this.site = document.querySelector('#ddlSite');
    this.month = document.querySelector('#ddlMonth');
    this.trend = document.querySelector('#ddlTrends');

    this.siteIndex = this.site.value;
    const siteArray = this.siteIndex.split('~', 2)
    const siteId = siteArray[0]
    this.siteName = siteArray[1]

    this.monthIndex = this.month.value;
    const monthArray = this.monthIndex.split('~', 2)
    const month = monthArray[0]
    this.monthName = monthArray[1]

    this.trendIndex = this.trend.value;
    const trendArray = this.trendIndex.split('~', 2)
    const trend = trendArray[0]
    this.trendName = trendArray[1]



    if (this.trendIndex == "" || this.monthIndex == "" || this.siteIndex == "") {

      console.log('NULL Value')
      this.visible = false;
      this.notFound = true;
    } else {
      this.notFound = false;
      this.jsonDATA = {"month": month, "siteId": siteId, "trend": trend}
      console.log(this.jsonDATA)
      this._service.getMonthlyTrend(this.jsonDATA)
      .subscribe(res => {

        if(res.length >= 1) {
          console.log('DATA FOUND')
          this.results = res
          this.notFound = false;
          this.visible = true;

          for(this.i = 0; this.i < this.results.length; this.i++){
            this.chart.push('HERE')
          }
          console.log(res)


          
    this.chartOptions = {
      chart: {
        type: 'area'
      },
      title: {
        text: 'Monthly ' + this.trendName + ' For: ' + this.siteName + ' (' + this.monthName + ')'
      },
      legend: {
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
      yAxis: {
        title: {
          text: this.trendName//'<b>Water Level</b>'
        },
        labels: {
          formatter: function () {
            return this.value;
          }
        },
        min: 0
      },
      tooltip: {
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

        } else {
          console.log('DATA NOT FOUND')
          this.visible = false;
          this.notFound = true;

        }
        console.log(res)
      },
        err => console.log(err))
      // 
    }
    /*

    */


  }
}

    // {"month": 6, "siteId": 21, "trend": "WaterLevel"} 


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
