import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Chart } from 'angular-highcharts';
import { DataService } from 'src/app/Server/data.service';
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
  chartOptions

  results; i: number;
  plotData = []


  visible: boolean = false;
  notFound: boolean = false;

  constructor(private router: Router, private _service: DataService) { }


  ngOnInit() {

    this._service.getYearlyReceived()
      .subscribe(res => {
      },
        err => console.log(err))

    this._service.getYearlyReceived()
      .subscribe(res => {
        if (res.length > 0) {

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
                  format: '{point.y:.2f}'
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
              pointFormat: 'Total Water Received: <b>{point.y:.2f} KL</b> <br/>'
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

   
        if (localStorage.getItem('userData') === null) {
          this.router.navigate(['/']);
         }
      

    if (sessionStorage.getItem('userData') === null) {
      //  this.router.navigate(['/']);
    }
  }

}
