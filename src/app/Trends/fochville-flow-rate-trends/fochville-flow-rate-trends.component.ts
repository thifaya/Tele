import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Server/data.service';
import * as  moment from 'moment';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
import { balancePreviousStylesIntoKeyframes } from '@angular/animations/browser/src/util';



@Component({
  selector: 'app-fochville-flow-rate-trends',
  templateUrl: './fochville-flow-rate-trends.component.html',
  styleUrls: ['./fochville-flow-rate-trends.component.css']
})
export class FochvilleFlowRateTrendsComponent implements OnInit {

  currentDate: Date = new Date;

  fochvilleChart1; fochvilleChart2; fochvilleChart3;
  wedelaBigChart1; wedelaBigChart2;
  wedelaSmallChart1; wedelaSmallChart2;

  fochvilleAnalog3 = []; fochvilleAnalog4 = []; fochvilleTime = []
  wedelaBigAnalog2 = []; wedelaBigAnalog3 = []; wedelaBigTime = []
  wedelaSmallAnalog2 = []; wedelaSmallAnalog3 = []; wedelaSmallTime = []

  fochville;
  wedelaBig;
  wedelaSmall;


  Highcharts = Highcharts;

  notFound: boolean;
  visible: boolean;
  defined: boolean;
  i: number; it: number; it2: number
  wf = 288; w = 250; h = 250

  dateSelected;
  jsonDATA;
  results;

  constructor(private router: Router, private _service: DataService) { }

  ngOnInit() {

    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
     }
  

    if (sessionStorage.getItem('userData') === null) {
      //window.alert('Must Login First');
      //  this.router.navigate(['/']);
    }
  }


  viewReport() {

    this.dateSelected = document.querySelector('#dpDate')
    const date = this.dateSelected.value;

    if (date == "") {
      console.log('NULL VALUES')
      this.visible = false;
      this.notFound = true;
    } else {
      this.notFound = false;
      this.jsonDATA = { 'date': date }

      this._service.getFochvilleFlowRate(this.jsonDATA)
        .subscribe(res => {
          console.log(res)
          this.results = res;

          for (this.it = 0; this.it < res.length; this.it++) {
            if (this.results[this.it].length > 0) {
              this.defined = true;
              break;
            } else {
              this.defined = false
            }
          }

          if (this.defined) {
            this.results = res;
            this.notFound = false;

            this.fochvilleAnalog3 = [];
            this.fochvilleAnalog4 = [];
            this.fochvilleTime = []
            this.fochville = this.results[0];
            for (this.i = 0; this.i < this.fochville.length; this.i++) {
              
              this.fochvilleAnalog3.push(parseFloat(this.fochville[this.i].Analog3))
              this.fochvilleAnalog4.push(parseFloat(this.fochville[this.i].Analog4))
              this.fochvilleTime.push(this.fochville[this.i].Time)
                                  
            }

            
            this.wedelaBigAnalog2 = [];
            this.wedelaBigAnalog3 = [];
            this.wedelaBigTime = []
            this.wedelaBig = this.results[1];
            for (this.i = 0; this.i < this.wedelaBig.length; this.i++) {
              
              this.wedelaBigAnalog2.push(parseFloat(this.wedelaBig[this.i].Analog2))
              this.wedelaBigAnalog3.push(parseFloat(this.wedelaBig[this.i].Analog3))
              this.wedelaBigTime.push(this.wedelaBig[this.i].Time)
                                  
            }
            
            this.wedelaSmallAnalog2 = [];
            this.wedelaSmallAnalog3 = [];
            this.wedelaSmallTime = []
            this.wedelaSmall = this.results[2];
            for (this.i = 0; this.i < this.wedelaSmall.length; this.i++) {
              
              this.wedelaSmallAnalog2.push(parseFloat(this.wedelaSmall[this.i].Analog2))
              this.wedelaSmallAnalog3.push(parseFloat(this.wedelaSmall[this.i].Analog3))
              this.wedelaSmallTime.push(this.wedelaSmall[this.i].Time)
                                  
            }
            

            console.log('DATA FOUND')

            // WEDELA SMALL RESEVOIR
            this.wedelaSmallChart1 = {
              chart: {
                type: 'line',
                width: this.w,
                height: this.h,
                renderTo: 'myChart',
                borderColor: '#2b2a2a',
                borderWidth: 1
              },
              title: {
                text: 'Inlet Flow Rate' ,
                style: {
                  fontSize: 10
                }
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
                  text: 'KL / Hr'
                }
              },
              xAxis: {
                categories: this.wedelaSmallTime
               },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>Time</b>: {point.x}<br />',
                pointFormat: '<b>Flow Rate:<b> {point.y}'
              },
              responsive: {
                rules: [{
                  condition: {
                    maxWidth: 500
                  }
                }]
              },

              credits: {
                enabled: false
              },
              series: [
                {
                  name: 'Time',
                  data: this.wedelaSmallAnalog2,
                  enablePolling: true
                }]
            }

            this.wedelaSmallChart2 = {
              chart: {
                type: 'line',
                width: this.w,
                height: this.h,
                renderTo: 'myChart',
                borderColor: '#2b2a2a',
                borderWidth: 1
              },
              title: {
                text: 'Outlet Flow Rate' ,
                style: {
                  fontSize: 10
                }
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
                  text: 'KL / Hr'
                }
              },
              xAxis: {
                categories: this.wedelaSmallTime
               },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>Time</b>: {point.x}<br />',
                pointFormat: '<b>Flow Rate:<b> {point.y}'
              },
              responsive: {
                rules: [{
                  condition: {
                    maxWidth: 500
                  }
                }]
              },

              credits: {
                enabled: false
              },
              series: [
                {
                  name: 'Time',
                  data: this.wedelaSmallAnalog3,
                  enablePolling: true
                }]
            }

            // WEDELA BIG RESEVOIR
            this.wedelaBigChart1 = {
              chart: {
                type: 'line',
                width: this.w,
                height: this.h,
                renderTo: 'myChart',
                borderColor: '#2b2a2a',
                borderWidth: 1
              },
              title: {
                text: 'Inlet Flow Rate' ,
                style: {
                  fontSize: 10
                }
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
                  text: 'KL / Hr'
                }
              },
              xAxis: {
                categories: this.wedelaBigTime
               },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>Time</b>: {point.x}<br />',
                pointFormat: '<b>Flow Rate:<b> {point.y}'
              },
              responsive: {
                rules: [{
                  condition: {
                    maxWidth: 500
                  }
                }]
              },

              credits: {
                enabled: false
              },
              series: [
                {
                  name: 'Time',
                  data: this.wedelaBigAnalog2,
                  enablePolling: true
                }]
            };
            
            this.wedelaBigChart2 = {
              chart: {
                type: 'line',
                width: this.w,
                height: this.h,
                renderTo: 'myChart',
                borderColor: '#2b2a2a',
                borderWidth: 1
              },
              title: {
                text: 'Outlet Flow Rate' ,
                style: {
                  fontSize: 10
                }
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
                  text: 'KL / Hr'
                }
              },
              xAxis: {
                categories: this.wedelaBigTime
               },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>Time</b>: {point.x}<br />',
                pointFormat: '<b>Flow Rate:<b> {point.y}'
              },
              responsive: {
                rules: [{
                  condition: {
                    maxWidth: 500
                  }
                }]
              },

              credits: {
                enabled: false
              },
              series: [
                {
                  name: 'Time',
                  data: this.wedelaBigAnalog3,
                  enablePolling: true
                }]
            };

            // FOCHVILLE RESEVOIR
            this.fochvilleChart1 = {
              chart: {
                type: 'line',
                width: this.wf,
                height: this.h,
                renderTo: 'myChart',
                borderColor: '#2b2a2a',
                borderWidth: 1
              },
              title: {
                text: 'Inlet1 Flow Rate' ,
                style: {
                  fontSize: 10
                }
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
                  text: 'KL / Hr'
                }
              },
              xAxis: {
                categories: this.fochvilleTime
               },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>Time</b>: {point.x}<br />',
                pointFormat: '<b>Flow Rate:<b> {point.y}'
              },
              responsive: {
                rules: [{
                  condition: {
                    maxWidth: 500
                  }
                }]
              },

              credits: {
                enabled: false
              },
              series: [
                {
                  name: 'Time',
                  data: this.fochvilleAnalog3,
                  enablePolling: true
                }]
            };

            this.fochvilleChart2 = {
              chart: {
                type: 'line',
                width: this.wf,
                height: this.h,
                renderTo: 'myChart',
                borderColor: '#2b2a2a',
                borderWidth: 1
              },
              title: {
                text: 'Inlet2 Flow Rate',
                style: {
                  fontSize: 10
                } 
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
                  text: 'KL / Hr'
                }
              },
              xAxis: {
                categories: this.fochvilleTime
               },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>Time</b>: {point.x}<br />',
                pointFormat: '<b>Flow Rate:<b> {point.y}'
              },
              responsive: {
                rules: [{
                  condition: {
                    maxWidth: 500
                  }
                }]
              },

              credits: {
                enabled: false
              },
              series: [
                {
                  name: 'Time',
                  data: this.fochvilleAnalog4,
                  enablePolling: true
                }]
            };
            
            this.fochvilleChart3 = {
              chart: {
                type: 'spline',
                width: this.wf,
                height: this.h,
                renderTo: 'myChart',
                borderColor: '#2b2a2a',
                borderWidth: 1
              },
              title: {
                text: 'Inlet3 Flow Rate Inlet2' ,
                style: {
                  fontSize: 10
                }
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
                  text: 'KL / Hr'
                }
              },
              xAxis: {
                categories: this.fochvilleTime
               },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>Time</b>: {point.x}<br />',
                pointFormat: '<b>Flow Rate:<b> {point.y}'
              },
              responsive: {
                rules: [{
                  condition: {
                    maxWidth: 500
                  }
                }]
              },

              credits: {
                enabled: false
              },
              series: [
                {
                  name: 'Time',
                  data: this.fochvilleAnalog4,
                  enablePolling: true
                }]
            };

            this.visible = true;
          } else {
            console.log('DATA NOT FOUND')
            this.visible = false;
            this.notFound = true;
          }
        },
          err => console.log(err))
    }



  }



}


/*


*/