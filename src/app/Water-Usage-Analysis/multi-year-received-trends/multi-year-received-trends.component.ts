import { Component, OnInit } from '@angular/core';
import { Chart } from 'angular-highcharts';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Server/data.service';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
import { array } from '@amcharts/amcharts4/core';
highcharts3D(Highcharts);


@Component({
  selector: 'app-multi-year-received-trends',
  templateUrl: './multi-year-received-trends.component.html',
  styleUrls: ['./multi-year-received-trends.component.css']
})
export class MultiYearReceivedTrendsComponent implements OnInit {

  currentDate: Date = new Date();
  Highcharts = Highcharts;
  chartOptions

  results; i: number;
  plotData = []

  visible: boolean = false;
  notFound: boolean = false;

  constructor(private router: Router, private _service: DataService) {
  }



  ngOnInit() {


    this._service.getMultiYearReceived()
      .subscribe(res => {
        if (res.length >= 1) {
          this.notFound = false;


          
          this.results = res;
          this.plotData = [];

          for (this.i = 0; this.i < this.results.length; this.i++) {
            
            this.plotData.push( { 'name': this.results[this.i].MyYear, 'data': [this.results[this.i].Water_Received] } )

          }

          this.chartOptions = {
            chart: {
              type: 'column'
            },

            title: {
              text: 'Multi Year Water Received Trends Analysis'
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
                text: '<b>Received Water (ML)</b>',
                skew3d: true
              }
            },
            credits: {
              enabled: false
            },
            tooltip: {
              headerFormat: '<span style="color:{series.color}">\u25CF</span> <b>Year:</b> {series.name}   <br>',
              pointFormat: '<b>Water Received:</b> {point.y} ML',
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
      //  this.router.navigate(['/']);
    }

    if (sessionStorage.getItem('userData') === null) {
      //  this.router.navigate(['/']);
    }
  }


}

/*

    chart = new Chart({
      chart: {
        type: 'column',
        margin: 75,
       
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
            size: 3,
            color: 'grey' // rgba(0, 0, 0, 0.06)
          }
        }
      }

      },
      subtitle: {
         text: 'Source: WorldClimate.com'
      },
      xAxis: {
        categories: ['Received Water', 'consumed'],
        crosshair: true,
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
             text: 'Number of fruits',
             skew3d: true
         }
     },
      credits: {
        enabled: false
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
              verticalAlign: 'top',
              //
              x: -150,
              y: 100,
              floating: true,
              borderWidth: 1,
              backgroundColor: 'blue',
            }
          }
        }]
      },
      tooltip : {
         headerFormat: '<span style = "font-size:10px">{point.key}</span><table>',
         pointFormat: '<tr><td style = "color:{series.color};padding:0">{series.name}: </td>' +
            '<td style = "padding:0"><b>{point.y:.1f} mm</b></td></tr>', footerFormat: '</table>', shared: true, useHTML: true
      },
      plotOptions: {
        column: {
          depth: 40,
          colorByPoint: true,
          pointPadding: 0.2,
          borderWidth: 0.4
        }
      },
      title: {
        text: 'Multi Year Water Received Trends Analysis'
      },
      series: [
      {
        name: '2015',
        data: [5],
        stack: 'female'
      },
      {
        name: '2016',
        data: [3],
        stack: 'female'
        // showInLegend: false
      },
      {
        name: '2017',
        data: [7],
        stack: 'female'
        // showInLegend: false
      },
      {
        name: '2018',
        data: [4],
        stack: 'female'
        // showInLegend: false
      },
      {
        name: '2019',
        data: [null],
        stack: 'female'
        // showInLegend: false
      }
    ]
    });

    chart = new Chart({
        chart: {
    type: 'column',
    options3d: {
        enabled: false,
        alpha: 15,
        beta: 15,
    }
  },
  title: {
    text: 'Browser market shares. January, 2018'
  },
  xAxis: {
    type: 'category'
  },
  yAxis: {
    title: {
      text: 'Total percent market share'
    }
  },
  legend: {
    enabled: true,
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

  tooltip: {
    headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
    pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
  },

  series:
   type: 'column',
    [
   {
      name: 'Browsers',
      data: [
        {
          name: 'Chrome',
          y: 62.74,
          drilldown: 'Chrome'
        },
        {
          name: 'Firefox',
          y: 10.57,
          drilldown: 'Firefox'
        },
        {
          name: 'Internet Explorer',
          y: 7.23,
          drilldown: 'Internet Explorer'
        },
        {
          name: 'Safari',
          y: 5.58,
          drilldown: 'Safari'
        },
        {
          name: 'Edge',
          y: 4.02,
          drilldown: 'Edge'
        },
        {
          name: 'Opera',
          y: 1.92,
          drilldown: 'Opera'
        },
        {
          name: 'Other',
          y: 7.62,
          drilldown: null
        }
      ]
    }
  ],
  drilldown: {
    series: [
      {
        name: 'Chrome',
        id: 'Chrome',
        data: [
          [
            'v65.0',
            0.1
          ],
          [
            'v64.0',
            1.3
          ],
          [
            'v63.0',
            53.02
          ],
          [
            'v62.0',
            1.4
          ],
          [
            'v61.0',
            0.88
          ],
          [
            'v60.0',
            0.56
          ],
          [
            'v59.0',
            0.45
          ],
          [
            'v58.0',
            0.49
          ],
          [
            'v57.0',
            0.32
          ],
          [
            'v56.0',
            0.29
          ],
          [
            'v55.0',
            0.79
          ],
          [
            'v54.0',
            0.18
          ],
          [
            'v51.0',
            0.13
          ],
          [
            'v49.0',
            2.16
          ],
          [
            'v48.0',
            0.13
          ],
          [
            'v47.0',
            0.11
          ],
          [
            'v43.0',
            0.17
          ],
          [
            'v29.0',
            0.26
          ]
        ]
      },
      {
        name: 'Firefox',
        id: 'Firefox',
        data: [
          [
            'v58.0',
            1.02
          ],
          [
            'v57.0',
            7.36
          ],
          [
            'v56.0',
            0.35
          ],
          [
            'v55.0',
            0.11
          ],
          [
            'v54.0',
            0.1
          ],
          [
            'v52.0',
            0.95
          ],
          [
            'v51.0',
            0.15
          ],
          [
            'v50.0',
            0.1
          ],
          [
            'v48.0',
            0.31
          ],
          [
            'v47.0',
            0.12
          ]
        ]
      },
      {
        name: 'Internet Explorer',
        id: 'Internet Explorer',
        data: [
          [
            'v11.0',
            6.2
          ],
          [
            'v10.0',
            0.29
          ],
          [
            'v9.0',
            0.27
          ],
          [
            'v8.0',
            0.47
          ]
        ]
      },
      {
        name: 'Safari',
        id: 'Safari',
        data: [
          [
            'v11.0',
            3.39
          ],
          [
            'v10.1',
            0.96
          ],
          [
            'v10.0',
            0.36
          ],
          [
            'v9.1',
            0.54
          ],
          [
            'v9.0',
            0.13
          ],
          [
            'v5.1',
            0.2
          ]
        ]
      },
      {
        name: 'Edge',
        id: 'Edge',
        data: [
          [
            'v16',
            2.6
          ],
          [
            'v15',
            0.92
          ],
          [
            'v14',
            0.4
          ],
          [
            'v13',
            0.1
          ]
        ]
      },
      {
        name: 'Opera',
        id: 'Opera',
        data: [
          [
            'v50.0',
            0.96
          ],
          [
            'v49.0',
            0.82
          ],
          [
            'v12.1',
            0.14
          ]
        ]
      }
    ]
  }
});

*/
