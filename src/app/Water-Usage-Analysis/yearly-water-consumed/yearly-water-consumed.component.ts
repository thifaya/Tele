import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Chart } from 'angular-highcharts';
import { DataService } from 'src/app/Service/data.service';
import * as  moment from 'moment';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);


@Component({
  selector: 'app-yearly-water-consumed',
  templateUrl: './yearly-water-consumed.component.html',
  styleUrls: ['./yearly-water-consumed.component.css']
})
export class YearlyWaterConsumedComponent implements OnInit {

  currentDate: Date = new Date();
  Highcharts = Highcharts;
  chartOptions

  results; i: number;
  plotData = []

  visible: boolean = false;
  notFound: boolean = false;

  constructor(private router: Router, private _service: DataService) { }


  ngOnInit() {


    if (localStorage.getItem('UserId') === null) {
      //  this.router.navigate(['/']);
    }


    if (sessionStorage.getItem('UserId') === null) {
      //  this.router.navigate(['/']);
    }

    this._service.getYearlyConsumed()
      .subscribe(res => {
        if (res.length >= 1) {

          this.notFound = false;
          this.results = res;
          this.plotData = [];

          for (this.i = 0; this.i < this.results.length; this.i++) {

            this.plotData.push({ 'name': this.results[this.i].MyYear, 'data': [this.results[this.i].Water_Received] })

          }

          this.chartOptions = {

            chart: {
              type: 'column'
            },
            title: {
              text: 'Yearly Water Consumed Per Reservoir as at: ' + moment(this.currentDate).format('LL')
            },
            xAxis: {
              type: 'category'
            },
            yAxis: {
              title: {
                skew3d: true,
                text: 'Total Water Consumed (KL)<br><br>'
              }

            },
            plotOptions: {
              series: {
                cursor: 'pointer',
                dataLabels: {
                  enabled: true,
                  format: '{point.y:.2f} '
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
              pointFormat: 'Total Water Consumed: <b>{point.y:.2f} KL</b> <br/>'
            },

            series: this.plotData
          };

          this.visible = true;
          console.log(res)
          console.log('DATA FOUND')

        } else {
          this.visible = false;
          this.notFound = true;
          console.log('DATA NOT FOUND')
        }
      },
        err => console.log(err))

  }

}

/*
    chart = new Chart({
        chart: {
            type: 'column',
            options3d: {
                enabled: true,
                alpha: 10,
                beta: 25,
                depth: 70
            }
        },
        title: {
            text: '3D chart with null values'
        },
        subtitle: {
            text: 'Notice the difference between a 0 value and a null point'
        },
        plotOptions: {
            column: {
                depth: 25
            }
        },
        xAxis: {
            labels: {
                skew3d: true,
                style: {
                    fontSize: '16px'
                }
            }
        },
        yAxis: {
            title: {
                text: null
            }
        },
        series: [{
            name: 'Sales',
            data: [2, 3, null, 4, 0, 5, 1, 4, 6, 3]
        }]
    });



      legend: {
        enabled: true,
        align: 'right',
        x: -30,
        verticalAlign: 'top',
        y: 25,
        floating: true,
        backgroundColor: 'white',
        borderColor: '#CCC',
        borderWidth: 1,
        shadow: false
      },
    */
