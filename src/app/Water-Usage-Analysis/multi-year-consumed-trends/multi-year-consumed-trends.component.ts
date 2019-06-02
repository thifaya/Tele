import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Server/data.service';
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

  visible: boolean = false;
  notFound: boolean = false;

  results; i: number;
  waterConsumed = []; siteName = []
  chartOptions; plotData =[]
  test = [{ 'name': 'blybank', 'data': [5] }, { 'name': 'fochville', 'data': [13] }, { 'name': 'calrtonville', 'data': [21] }, { 'name': 'South', 'data': [8] }]


  constructor(private router: Router, private _service: DataService) {
    this.visible = false;
    this.notFound = false;
  }


  
  ngOnInit() {

    this._service.getMultiYearConsumed()
      .subscribe(res => {
        if (res.length >= 1) {
          
          this.notFound = false;
          this.results = res;
          this.plotData = [];

          for (this.i = 0; this.i < this.results.length; this.i++) {
            
            this.plotData.push( { 'name': this.results[this.i].MyYear, 'data': [this.results[this.i].Water_Consumed] } )

          }

          this.chartOptions = {
            chart: {
              type: 'column'
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
              headerFormat: '<b>Site:</b> {series.name} <span style="color:{series.color}">\u25CF</span>  <br>',
              pointFormat: '<b>Water Consumed:</b> {point.y} ML',
            },
            plotOptions: {
              column: {
                depth: 40
              },
              series: {
                borderWidth: 1,
                dataLabels: {
                  enabled: true,
                  format: '{point.y:.1f} ML'
                }
              }
            },

            series: this.plotData
          };


          this.visible = true;
          console.log('DATA FOUND')

        } else {
          this.visible = false;
          this.notFound = true;
          console.log('DATA NOT FOUND')
        }
      },
        err => console.log(err))
        

    if (localStorage.getItem('userData') === null) {
        this.router.navigate(['/']);
    }

    if (sessionStorage.getItem('userData') === null) {
      //  this.router.navigate(['/']);
    }
  }


}
/*

  chartOptions = {
    chart: {
      type: 'column'
    },

    title: {
      text: 'Multi Year Water Consumed Trends Analysis'
    },

    xAxis: {
      categories: ['<b>Site</b>'],
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
      headerFormat: '<b>Site:</b> {series.name} <span style="color:{series.color}">\u25CF</span>  <br>',
      pointFormat: '<b>Water Consumed:</b> {point.y}ML',
    },
    plotOptions: {
      column: {
        depth: 40
      },
      series: {
        borderWidth: 0,
        dataLabels: {
            enabled: true,
            format: '{point.y:.1f}ML'
        }
    }
    },

    series: [{
      name: 'South.Outlet.Volume',
      data: [5]
    }, {
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    },{
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    }, {
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    },{
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    },{
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    },{
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    },{
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    },{
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    },{
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    },{
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    },{
      name: 'Carltonville.Outlet.Volume',
      data: [3]
    }, {
      name: 'Blybank.Outlet.Volume',
      data: [2]
    }, {
      name: 'North.Outlet.Volume',
      data: [16]
    }]
  };


,
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

*/