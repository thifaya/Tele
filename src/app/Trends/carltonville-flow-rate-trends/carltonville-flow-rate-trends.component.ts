import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Server/data.service';
import * as  moment from 'moment';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';

highcharts3D(Highcharts);




@Component({
  selector: 'app-carltonville-flow-rate-trends',
  templateUrl: './carltonville-flow-rate-trends.component.html',
  styleUrls: ['./carltonville-flow-rate-trends.component.css']
})
export class CarltonvilleFlowRateTrendsComponent implements OnInit {

  khutsongNorth;
  khutsongSouthIn; khutsongSouthOut
  blybankIn; blybankOut
  carltonvilleIn; carltonvilleOut
  welverdiendIn; welverdiendOut
  

  khutsongNorthChart1; khutsongNorthChart2;
  blybankChart1; blybankChart2; 
  khutsongSouthChart1; khutsongSouthChart2; 
  carltonvilleChart1; carltonvilleChart2; 
  welverdiendChart1; welverdiendChart2; 

  khutsongNorthAnalog3 = []; khutsongNorthAnalog4 = []; khutsongNorthTime = [];
  blybankInFlow = []; blybankOutFlow = []; blybankTimeIn = []; blybankTimeOut = []
  khutsongSouthInFlow = []; khutsongSouthOutFlow = []; khutsongSouthTimeIn = []; khutsongSouthTimeOut = []
  carltonvilleInFlow = []; carltonvilleOutFlow = []; carltonvilleTimeIn = []; carltonvilleTimeOut = []
  welverdiendInFlow = []; welverdiendOutFlow = []; welverdiendTimeIn = []; welverdiendTimeOut = []

  visible: boolean;
  notFound: boolean;
  dateSelected;
  jsonDATA = {};
  results = [];
  w = 250; h = 250

  Highcharts = Highcharts;
  chartOptions4; chart
  i: number; defined: boolean
  Analog3 = []; Analog4 = []; time = [];


  constructor(private router: Router, private _service: DataService) { }

  currentDate: Date = new Date();

  ngOnInit() {
    this.visible = false;
    this.notFound = false;
  
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
     }
  

    if (sessionStorage.getItem('userData') === null) {
      // window.alert('Must Login');
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
      this.jsonDATA = { "date": date }

      this._service.getCarltonvilleFlowRate(this.jsonDATA)
        .subscribe(res => {
          this.results = res;
          this.notFound = false;

         for(this.i=0; this.i < res.length; this.i++) {
           if(this.results[this.i].length > 0) {
              this.defined = true;
              break;
           } else {
             this.defined = false
           }
         }

          if (this.defined) {     
            
            console.log('DATA FOUND')
            console.log(this.results)

            
            this.khutsongNorthAnalog3 = [];
            this.khutsongNorthAnalog4 = [];
            this.khutsongNorthTime = []
            this.khutsongNorth = this.results[0];
            for (this.i = 0; this.i < this.khutsongNorth.length; this.i++) {
              
              this.khutsongNorthAnalog3.push(parseFloat(this.khutsongNorth[this.i].Analog3))
              this.khutsongNorthAnalog4.push(parseFloat(this.khutsongNorth[this.i].Analog4))
              this.khutsongNorthTime.push(this.khutsongNorth[this.i].Time)
                                  
            }

            this.blybankInFlow = [];
            this.blybankTimeIn = []
            this.blybankIn = this.results[7];
            for (this.i = 0; this.i < this.blybankIn.length; this.i++) {
              
              this.blybankInFlow.push(this.blybankIn[this.i].InFlow)
              this.blybankTimeIn.push( moment.utc(this.blybankIn[this.i].myTime).format('HH:mm:ss') );
                                  
            }
            this.blybankOutFlow = [];
            this.blybankTimeOut = []
            this.blybankOut = this.results[8];
            for (this.i = 0; this.i < this.blybankOut.length; this.i++) {
              
              this.blybankOutFlow.push(this.blybankOut[this.i].OutFlow)
              this.blybankTimeOut.push(  moment.utc(this.blybankOut[this.i].myTime).format('HH:mm:ss') );
              
            }

            //
            this.carltonvilleInFlow = [];
            this.carltonvilleTimeIn = []
            this.carltonvilleIn = this.results[5];
            for (this.i = 0; this.i < this.carltonvilleIn.length; this.i++) {
              
              this.carltonvilleInFlow.push(this.carltonvilleIn[this.i].InFlow)
              this.carltonvilleTimeIn.push( moment.utc(this.carltonvilleIn[this.i].myTime).format('HH:mm:ss') );
                                  
            }
            this.carltonvilleOutFlow = [];
            this.carltonvilleTimeOut = []
            this.carltonvilleOut = this.results[3];
            for (this.i = 0; this.i < this.carltonvilleOut.length; this.i++) {
              
              this.carltonvilleOutFlow.push(this.carltonvilleOut[this.i].OutFlow)
              this.carltonvilleTimeOut.push(  moment.utc(this.carltonvilleOut[this.i].myTime).format('HH:mm:ss') );
              
            }

            ///////////////////////////////////////////////////////////////////////////////////////////
            this.khutsongSouthInFlow = [];
            this.khutsongSouthTimeIn = []
            this.khutsongSouthIn = this.results[2];
            for (this.i = 0; this.i < this.khutsongSouthIn.length; this.i++) {
              
              this.khutsongSouthInFlow.push(this.khutsongSouthIn[this.i].InFlow)
              this.khutsongSouthTimeIn.push( moment.utc(this.khutsongSouthIn[this.i].myTime).format('HH:mm:ss') );
          
            }
            this.khutsongSouthOutFlow = [];
            this.khutsongSouthTimeOut = []
            this.khutsongSouthOut = this.results[3];
            for (this.i = 0; this.i < this.khutsongSouthOut.length; this.i++) {
              
              this.khutsongSouthOutFlow.push(this.khutsongSouthOut[this.i].OutFlow)
              this.khutsongSouthTimeOut.push(  moment.utc(this.khutsongSouthOut[this.i].myTime).format('HH:mm:ss') );
              
            }



            console.log(this.blybankInFlow)
            console.log(this.blybankTimeIn)
            console.log(this.blybankOutFlow)
            console.log(this.blybankTimeOut)

            //  BLYBANK
            this.blybankChart1 = {
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
                categories: this.blybankTimeIn
              },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>Time</b>: {point.x}<br />',
                pointFormat: '<b>Inlet Flow Rate:<b> {point.y}'
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
                  data: this.blybankInFlow,
                  enablePolling: true
                }]
            };
            
            this.blybankChart2 = {
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
                categories: this.blybankTimeOut
              },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>Time</b>: {point.x}<br />',
                pointFormat: '<b>Outlet Flow Rate:<b> {point.y}'
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
                  data: this.blybankOutFlow,
                  enablePolling: true
                }]
            };

            //  KHUTSONG NORTH
            this.khutsongNorthChart1 = {
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
                categories: this.khutsongNorthTime
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
                  data: this.khutsongNorthAnalog3,
                  enablePolling: true
                }]
            };
            
            this.khutsongNorthChart2 = {
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
                categories: this.khutsongNorthTime
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
                  data: this.khutsongNorthAnalog4,
                  enablePolling: true
                }]
            };
            
            
           /* 

            this.chartOptions = {
              chart: {
                type: 'column',
                width: this.w,
                height: this.h
              },
              title: {
                text: 'Intel 1 Flow Rate' //'Daily Level Trend For  ' + this.siteName + ' Dated ' + moment(date).format('LL')
              },
              plotOptions: {
                series: {
                  point: {}
                },
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
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
                //  [ ' 00:00:01', '01:00:00', '02:00:00', '03:00:00', '04:00:00', '05:00:00', '06:00:00', '07:00:00', '08:00:01', '09:00:00', '10: 00: 00', '11: 00: 00', '12: 00: 00', '13: 00: 00', '14: 00: 00', ' 15: 00: 00', '16: 00: 00', '17: 00: 00', ' 18: 00: 00', ' 19: 00: 00', '20: 00: 00', '21: 00: 00', '22: 00: 00', '23: 00: 00']
              },
              tooltip: {
                //  valueSuffix: ' °C'

                crosshairs: true,
                shared: true,
                headerFormat: '<b>{series.name}</b>: {point.x}<br />',
                pointFormat: '<b>Level:<b> {point.y}'
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
                  data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
                  enablePolling: true
                }]
            };

            /*
            this.chartOptions4 = {
              chart: {
                type: 'line',
                width: this.w,
                height: this.h
              },
              title: {
                text: 'Intel 2 Flow Rate' //'Daily Level Trend For  ' + this.siteName + ' Dated ' + moment(date).format('LL')
              },
              plotOptions: {
                series: {
                  point: {}
                },
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
                categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
               //  [ ' 00:00:01', '01:00:00', '02:00:00', '03:00:00', '04:00:00', '05:00:00', '06:00:00', '07:00:00', '08:00:01', '09:00:00', '10: 00: 00', '11: 00: 00', '12: 00: 00', '13: 00: 00', '14: 00: 00', ' 15: 00: 00', '16: 00: 00', '17: 00: 00', ' 18: 00: 00', ' 19: 00: 00', '20: 00: 00', '21: 00: 00', '22: 00: 00', '23: 00: 00']
              },
              tooltip: {
                //  valueSuffix: ' °C'
                
          crosshairs: true,
          shared: true,
          headerFormat: '<b>{series.name}</b>: {point.x}<br />',
          pointFormat: '<b>Level:<b> {point.y}'
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
                  data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
                  enablePolling: true 
                }]
            }; */
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
