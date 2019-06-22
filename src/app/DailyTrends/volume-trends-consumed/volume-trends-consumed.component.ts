import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Service/data.service';
import * as  moment from 'moment';


@Component({
  selector: 'app-volume-trends-consumed',
  templateUrl: './volume-trends-consumed.component.html',
  styleUrls: ['./volume-trends-consumed.component.css']
})
export class VolumeTrendsConsumedComponent implements OnInit {

   SITES
  results;
  dateSelect;
  dataArray;
  index;
  notFound: boolean;
  valid: boolean;
  siteName
  sum;
  i: number; 

  provinceDropdown; municipalityDropdown;
  districtDropdown; siteDropdown

  constructor(private router: Router, private _service: DataService) {
    this._service.getAllSite()
      .subscribe(res => {
        this.SITES = res;
      },
      err => console.log(err))
    }

 

  ngOnInit() {
    this.valid = false;
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
     this.siteDropdown = document.querySelector('#ddlSite')
 
     this.districtDropdown.disabled = true
     this.municipalityDropdown.disabled = true
     this.siteDropdown.disabled = true
  
  }

  viewReport() {
    
    this.dateSelect = document.querySelector('#dpDate');

  
    const date = this.dateSelect.value;
    this.index = this.siteDropdown.value;

    const siteArray = this.index.split('~', 2)

    const siteId = siteArray[0];
    this.siteName = siteArray[1]

    if (siteId == "" || date == "") {
      console.log('NULL Value')
      this.valid = false;
      this.notFound = true;
    } else {
      this.dataArray = { "date": this.dateSelect.value, "siteId": parseInt(siteId) }
      console.log(this.dataArray)

      this._service.getVolumeConsumed(this.dataArray)
        .subscribe(res => {
          if ( res.length >= 1) {
            this.results = res;
            this.sum = 0
            console.log(this.results)
            for(this.i=0; this.i< res.length;this.i++) {
                this.sum +=  this.results[this.i].Volume                          
            }
            this.valid = true;
            this.notFound = false;
            console.log('Data Found')
          } else {
            this.valid = false;
            this.notFound = true;
            console.log('Data Not Found')
          }
        },
          err => console.log(err))

      }
      //{"date": "2013/09/20", "siteId": 21}

    }

    dropDownEnabled() {


      if (this.provinceDropdown.value == '') {
  
        this.districtDropdown.value = ''
        this.siteDropdown.value = ''
        this.municipalityDropdown.value = ''
  
        this.districtDropdown.disabled = true
        this.siteDropdown.disabled = true
        this.municipalityDropdown.disabled = true
  
  
      } else{
         this.districtDropdown.disabled = false
    }
  
  
      console.log('Selected= ' + !this.districtDropdown.disabled)
    }
  
    districtEnable() {
        
      if (this.districtDropdown.value == '') { 
  
        this.siteDropdown.value = ''
        this.municipalityDropdown.value = ''
  
        this.siteDropdown.disabled = true
        this.municipalityDropdown.disabled = true
  
      } else {
        this.municipalityDropdown.disabled = false 
      }
    }
  
    localEnable() {
      
      if (this.municipalityDropdown.value == '') {
  
        this.siteDropdown.value = ''
        
        this.siteDropdown.disabled = true
        
        if (this.siteDropdown.value == '') {
          console.log('site null')
        }   else {
          console.log('get value')
        }
      } else {
        this.siteDropdown.disabled = false 
      }
    }
  }

