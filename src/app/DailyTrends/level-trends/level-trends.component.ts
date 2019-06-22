import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Service/data.service';
import * as  moment from 'moment';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
import swal from 'sweetalert';



highcharts3D(Highcharts);

@Component({
  selector: 'app-level-trends',
  templateUrl: './level-trends.component.html',
  styleUrls: ['./level-trends.component.css']
})
export class LevelTrendsComponent implements OnInit {

  site; SITES
  dateValue;
  visible: boolean;
  notFound: boolean;
  siteName;
  index: string;
  dataArray;
  results;
  resArray = [];
  time = [];
  level = [];
  w = 250; h = 250
  empty = false;

  Highcharts = Highcharts;

  chartOptions;

  provinceDropdown; municipalityDropdown;
  districtDropdown; siteDropdown

  i: number;
  // {"date": "2013/09/22", "siteId": 22}
  constructor(private router: Router, private _service: DataService) {
    this._service.getAllSite()
      .subscribe(res => {
        this.SITES = res;
      },
        err => console.log(err))
  }

  formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
  selectedDay: string;


  viewReport() {
    //  swal("Hello world!");

    this.site = document.querySelector('#ddlSite');
    this.dateValue = document.querySelector('#dpDate');

    const date = this.dateValue.value;
    this.index = this.site.value;

    const siteArray = this.index.split('~', 2)

    const siteId = siteArray[0];
    this.siteName = siteArray[1]


    if (this.index == "" || date == "") {
      console.log('NULL VALUES')
      this.empty = true;
      this.visible = false;
      this.notFound = false;
    } else {
      this.notFound = false;
      this.empty = false;
      this.visible = false;

      this.dataArray = { "date": date, "siteId": parseInt(siteId) }

      this._service.getLevelTrends(this.dataArray)
        .subscribe(res => {
          this.results = res;

          if (this.results.length > 0) {
            this.notFound = false;
            this.empty = false;

            this.level = [];
            this.time = [];

            for (this.i = 0; this.i < this.results.length; this.i++) {
              this.level.push([this.results[this.i].Level])
              this.time.push(this.results[this.i].Time)

            }
            //////////// CHART////////////
            this.chartOptions = {
              chart: {
                type: 'line'
              },
              title: {
                text: 'Daily Level Trend For  ' + this.siteName + ' Dated ' + moment(date).format('LL')
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
                categories: this.time
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
                  data: this.level,
                  enablePolling: true
                }]
            };
            /////////////////////////////

            this.visible = true;
            console.log(this.results.length)
            console.log('DATA FOUND')
          } else {
            this.visible = false;
            this.notFound = true;
            this.empty = false;
            console.log('DATA NOT FOUND')
          }
        },
          err => {
            console.log(err);
            this.visible = false
            this.empty = false
            this.notFound = false
          })

    }

  }


  ngOnInit() {
    this.visible = false;
    this.notFound = false;

    if (sessionStorage.getItem('UserId') === null) {
      //window.alert('Must Login First');
      //  this.router.navigate(['/']);
    }

    if (localStorage.getItem('UserId') === null) {
      this.router.navigate(['/']);
    }

    this.districtDropdown = document.querySelector('#ddldistrict')
    this.provinceDropdown = document.querySelector('#ddlprovince')
    this.municipalityDropdown = document.querySelector('#ddlmunicipality')
    this.site = document.querySelector('#ddlSite')

    this.districtDropdown.disabled = true
    this.municipalityDropdown.disabled = true
    this.site.disabled = true

  }



  dropDownEnabled() {


    if (this.provinceDropdown.value == '') {

      this.districtDropdown.value = ''
      this.site.value = ''
      this.municipalityDropdown.value = ''

      this.districtDropdown.disabled = true
      this.site.disabled = true
      this.municipalityDropdown.disabled = true


    } else {
      this.districtDropdown.disabled = false
    }


    console.log('Selected= ' + !this.districtDropdown.disabled)
  }

  districtEnable() {

    if (this.districtDropdown.value == '') {

      this.site.value = ''
      this.municipalityDropdown.value = ''

      this.site.disabled = true
      this.municipalityDropdown.disabled = true

    } else {
      this.municipalityDropdown.disabled = false
    }
  }

  localEnable() {

    if (this.municipalityDropdown.value == '') {

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

  notEmpty() {

    if (this.empty) {
      this.empty = false;
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
