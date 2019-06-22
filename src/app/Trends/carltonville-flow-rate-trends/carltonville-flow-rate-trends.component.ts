import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Service/data.service';
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

  khutsongNorth; fochville
  khutsongSouthIn; khutsongSouthOut
  blybankIn; blybankOut
  carltonvilleIn; carltonvilleOut
  welverdiendIn; welverdiendOut

  fochvilleChart1; fochvilleChart2; fochvilleChart3;
  khutsongNorthChart1; khutsongNorthChart2;
  blybankChart1; blybankChart2;
  khutsongSouthChart1; khutsongSouthChart2;
  carltonvilleChart1; carltonvilleChart2;
  welverdiendChart1; welverdiendChart2;

  fochvilleAnalog3 = []; fochvilleAnalog4 = []; fochvilleTime = []
  khutsongNorthAnalog3 = []; khutsongNorthAnalog4 = []; khutsongNorthTime = [];
  blybankInFlow = []; blybankOutFlow = []; blybankTimeIn = []; blybankTimeOut = []
  khutsongSouthInFlow = []; khutsongSouthOutFlow = []; khutsongSouthTimeIn = []; khutsongSouthTimeOut = []
  carltonvilleInFlow = []; carltonvilleOutFlow = []; carltonvilleTimeIn = []; carltonvilleTimeOut = []
  welverdiendInFlow = []; welverdiendOutFlow = []; welverdiendTimeIn = []; welverdiendTimeOut = []


  chartOptionsX; chartOptionsY
  inlet = []; outlet = []; time = []; time2 = []

  visible: boolean;

  many = false
  one = false
  notFound = false;

  dateSelected;
  jsonDATA = {};
  results;
  w = 250; h = 250

  Highcharts = Highcharts;
  chart
  i: number; defined: boolean
  provinceSelected = false
  districtSelected = false
  municipalitySelected = false
  province; municipality;
  district; site
  siteName

  constructor(private router: Router, private _service: DataService) {

  }

  currentDate: Date = new Date();

  ngOnInit() {
    this.visible = false;
    this.notFound = false;

    if (localStorage.getItem('UserId') === null) {
      this.router.navigate(['/']);
    }


    if (sessionStorage.getItem('UserId') === null) {
      // window.alert('Must Login');
      //  this.router.navigate(['/']);
    }

    this.district = document.querySelector('#ddldistrict')
    this.province = document.querySelector('#ddlprovince')
    this.municipality = document.querySelector('#ddlmunicipality')
    this.site = document.querySelector('#ddlSite')
    this.dateSelected = document.querySelector('#dpDate')

    this.district.disabled = true
    this.municipality.disabled = true
    this.site.disabled = true
  }

  viewReport() {

    const cin = this.site.value.split('~', 3)

    /**
     * 
     * 
     * 
     * 
     */

    const siteArray = this.site.value.split('~', 3)

    if (this.dateSelected.value == "" || this.site.value == "") {
      console.log('NULL VALUES')
      this.many = false
      this.one = false
      this.visible = false;
      this.notFound = true;
    } else {
      this.notFound = false;

      if (this.site.value == 'All') {
        this.one = false
        this.notFound = false

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
            text: 'Inlet Flow Rate',
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
            categories:    [ ' 00:00:01', '01:00:00', '02:00:00', '03:00:00', '04:00:00', '05:00:00', '06:00:00', '07:00:00', '08:00:01', '09:00:00', '10: 00: 00', '11: 00: 00', '12: 00: 00', '13: 00: 00', '14: 00: 00', ' 15: 00: 00', '16: 00: 00', '17: 00: 00', ' 18: 00: 00', ' 19: 00: 00', '20: 00: 00', '21: 00: 00', '22: 00: 00', '23: 00: 00']
          
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
              data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
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
            text: 'Outlet Flow Rate',
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
            categories:   [ ' 00:00:01', '01:00:00', '02:00:00', '03:00:00', '04:00:00', '05:00:00', '06:00:00', '07:00:00', '08:00:01', '09:00:00', '10: 00: 00', '11: 00: 00', '12: 00: 00', '13: 00: 00', '14: 00: 00', ' 15: 00: 00', '16: 00: 00', '17: 00: 00', ' 18: 00: 00', ' 19: 00: 00', '20: 00: 00', '21: 00: 00', '22: 00: 00', '23: 00: 00']
          
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
              data: [7.0, 6.9, 9.5, 14.5, 18.4, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6],
              enablePolling: true
            }]
        };

 
        this.many = true


      } else {
        this.many = false;
        this.notFound = false;

        if (siteArray[0] == 'id') {
          console.log('get data by site id from sql')

          this._service.flowratetrendID({ 'date': this.dateSelected.value, 'siteId': siteArray[1] })
            .subscribe(res => {
              this.results = res;

              if (this.results.length > 0) {

                this.notFound = false;

                this.inlet = []
                this.outlet = []
                this.time = []


                if (siteArray[1] == 18 || siteArray[1] == 21) {

                  for (this.i = 0; this.i < this.results.length; this.i++) {

                    this.inlet.push(parseFloat(this.results[this.i].Analog3))
                    this.outlet.push(parseFloat(this.results[this.i].Analog4))
                    this.time.push(this.results[this.i].Time)


                  }

                } else {

                  for (this.i = 0; this.i < this.results.length; this.i++) {

                    this.inlet.push(parseFloat(this.results[this.i].Analog2))
                    this.outlet.push(parseFloat(this.results[this.i].Analog3))
                    this.time.push(this.results[this.i].Time)


                  }

                }

                this.siteName = siteArray[2]
                // X -> INLET      
                // Y -> OUTLET


                this.chartOptionsX = {
                  chart: {
                    type: 'line',
                    width: this.w,
                    height: this.h,
                    renderTo: 'myChart',
                    borderColor: '#2b2a2a',
                    borderWidth: 1
                  },
                  title: {
                    text: 'Inlet Flow Rate',
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
                    categories: this.time
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
                      data: this.inlet,
                      enablePolling: true
                    }]
                };

                this.chartOptionsY = {
                  chart: {
                    type: 'line',
                    width: this.w,
                    height: this.h,
                    renderTo: 'myChart',
                    borderColor: '#2b2a2a',
                    borderWidth: 1
                  },
                  title: {
                    text: 'Outlet Flow Rate',
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
                    categories: this.time
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
                      data: this.outlet,
                      enablePolling: true
                    }]
                };


              } else {
                this.notFound = true
              }

            },
              err => console.log(err))

        } else {
          console.log('get data by name from sp')

          this._service.flowratetrendSP({ 'date': this.dateSelected.value, 'inlet': siteArray[2] + '.Inlet.FlowRate', 'outlet': siteArray[2] + '.Outlet.FlowRate' })
            .subscribe(res => {
              this.results = res;

              if (this.results.length > 0) {

                this.notFound = false;

                this.inlet = []
                this.outlet = []
                this.time = []

                for (this.i = 0; this.i < this.results[0].length; this.i++) {

                  this.inlet.push(parseFloat(this.results[0][this.i].InFlow))
                  this.time.push(this.results[0][this.i].myTime)

                }


                for (this.i = 0; this.i < this.results[1].length; this.i++) {

                  this.outlet.push(parseFloat(this.results[1][this.i].OutFlow))
                  this.time2.push(this.results[1][this.i].myTime)
                }


                this.siteName = siteArray[2]

                // X -> INLET     time 
                // Y -> OUTLET    time2

                // INLET
                this.chartOptionsX = {
                  chart: {
                    type: 'line',
                    width: this.w,
                    height: this.h,
                    renderTo: 'myChart',
                    borderColor: '#2b2a2a',
                    borderWidth: 1
                  },
                  title: {
                    text: 'Inlet Flow Rate',
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
                    categories: this.time
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
                      data: this.inlet,
                      enablePolling: true
                    }]
                };

                // OUTLET
                this.chartOptionsY = {
                  chart: {
                    type: 'line',
                    width: this.w,
                    height: this.h,
                    renderTo: 'myChart',
                    borderColor: '#2b2a2a',
                    borderWidth: 1
                  },
                  title: {
                    text: 'Outlet Flow Rate',
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
                    categories: this.time2
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
                      data: this.outlet,
                      enablePolling: true
                    }]
                };



              } else {
                this.notFound = true
              }

            },
              err => console.log(err))

        }

        this.one = true

      }


    }



  }

  dropDownEnabled() {


    if (this.province.value == '') {

      this.district.value = ''
      this.site.value = ''
      this.municipality.value = ''

      this.district.disabled = true
      this.site.disabled = true
      this.municipality.disabled = true


    } else {
      this.district.disabled = false
    }


    console.log('Selected= ' + !this.district.disabled)
  }

  districtEnable() {

    if (this.district.value == '') {

      this.site.value = ''
      this.municipality.value = ''

      this.site.disabled = true
      this.municipality.disabled = true

    } else {
      this.municipality.disabled = false
    }
  }

  localEnable() {

    if (this.municipality.value == '') {

      this.site.value = ''

      this.site.disabled = true

      if (this.site.value == '') {
        console.log('site null')
      } else {
        console.log('get value')
      }
    } else {
      this.site.disabled = false
    }
  }

}
