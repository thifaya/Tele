import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Server/data.service';
import * as  moment from 'moment';


@Component({
  selector: 'app-volume-trends-consumed',
  templateUrl: './volume-trends-consumed.component.html',
  styleUrls: ['./volume-trends-consumed.component.css']
})
export class VolumeTrendsConsumedComponent implements OnInit {

  site; SITES
  siteNane;
  results;
  dateSelect;
  dataArray;
  index;
  notFound: boolean;
  valid: boolean;
  siteName
  sum;
  i: number; 

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

    if (sessionStorage.getItem('userData') === null) {
      window.alert('Must Login First');
      //  this.router.navigate(['/']);
    }

 
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
     }
  
  }

  viewReport() {

    this.site = document.querySelector('#ddlSite');
    this.dateSelect = document.querySelector('#dpDate');

  
    const date = this.dateSelect.value;
    this.index = this.site.value;

    const siteArray = this.index.split('~', 2)

    const siteId = siteArray[0];
    this.siteName = siteArray[1]

    if (siteId == "" || date == "") {
      console.log('NULL Value')
      this.valid = false;
      this.notFound = true;
    } else {
      this.dataArray = { "date": date, "siteId": parseInt(siteId) }
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
  }

