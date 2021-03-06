import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Service/data.service';
import * as  moment from 'moment';

@Component({
  selector: 'app-alarms',
  templateUrl: './alarms.component.html',
  styleUrls: ['./alarms.component.css']
})
export class AlarmsComponent implements OnInit {

  alarms; myJSON = []
  alarmType = []
  index: string;
  visible: boolean;
  notFound: boolean;
  date; i: number
  site; SITES
  jsonDATA = {};

  provinceDropdown; municipalityDropdown;
  districtDropdown; siteDropdown
  // 
  constructor(private router: Router, private _dataservice: DataService) { 
    this._dataservice.getAllSite()
      .subscribe(res => {
        this.SITES = res;
      },
      err => console.log(err))
   }

  ngOnInit() {
    this.visible = false;
    this.notFound = false;
    if (sessionStorage.getItem('UserId') === null) {
      // window.alert('Must Login First');
      //  this.router.navigate(['/']);
    }


    if (localStorage.getItem('UserId') === null) {
      this.router.navigate(['/']);
     }

     this.districtDropdown = document.querySelector('#ddldistrict')
     this.provinceDropdown = document.querySelector('#ddlprovince')
     this.municipalityDropdown = document.querySelector('#ddlmunicipality')
     this.date = document.querySelector('#dpDate');
     this.site = document.querySelector('#ddlSite');
 
     this.districtDropdown.disabled = true
     this.municipalityDropdown.disabled = true
     this.site.disabled = true
  
  }

  ViewReport() {


    this.index = this.site.value;
    const date = this.date.value;

    const siteArray = this.index.split('~', 2)

    const siteId = siteArray[0];
    const siteName = siteArray[1];

    this.jsonDATA = { "date": date, "siteId": parseInt(siteId) }
    console.log(this.jsonDATA)

    if (date == "" || this.index == "") {
      console.log('NULL VALUES')
      this.visible = false;
      this.notFound = true;
    } else {
      this.notFound = false;

      this._dataservice.getAlarms(this.jsonDATA)
        .subscribe(res => {
          if(res.length >= 1) {
            this.notFound = false;
            this.alarms = res;
            this.myJSON = []
            
            for(this.i = 0; this.i < res.length; this.i++) {

              if(this.alarms[this.i].Analog1 < 30) {
                this.alarmType[this.i] = "Below Reserve"
                
               this.myJSON.push({'site': this.alarms[this.i].Name, 'value': this.alarms[this.i].Analog1, 'type': this.alarmType[this.i], 'date': this.alarms[this.i].Date, 'time': this.alarms[this.i].Time} )
              } else {
                this.alarmType[this.i] = "Reservoir Overflow"
                
               this.myJSON.push({'site': this.alarms[this.i].Name, 'value': this.alarms[this.i].Analog1, 'type': this.alarmType[this.i], 'date': this.alarms[this.i].Date, 'time': this.alarms[this.i].Time} )
              }


            }

            console.log(this.myJSON)
            console.log('DATA FOUND')
            this.visible = true;
          } else {
            this.visible = false;
            this.notFound = true;
            console.log('DATA NOT FOUND')
          }
        },
          err => console.log(err))


    }
    
  }


  dropDownEnabled() {


    if (this.provinceDropdown.value == '') {

      this.districtDropdown.value = ''
      this.site.value = ''
      this.municipalityDropdown.value = ''

      this.districtDropdown.disabled = true
      this.site.disabled = true
      this.municipalityDropdown.disabled = true


    } else{
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
      }   else {
        console.log('get value')
      }
    } else {
      this.site.disabled = false 
    }
  }

}
//{"date": "2013/09/20", "siteId": 21}  moment(this.date.value).format('YYYY/MM/DD')