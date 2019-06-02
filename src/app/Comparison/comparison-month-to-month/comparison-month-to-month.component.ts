import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Server/data.service';
import { Router } from '@angular/router';
import { getType } from '@amcharts/amcharts4/.internal/core/utils/Type';
import { delay } from 'rxjs/operators';
import { isNullOrUndefined } from 'util';
// import { any } from '@amcharts/amcharts4/.internal/core/utils/Array';
// import { string } from '@amcharts/amcharts4/core';

@Component({
  selector: 'app-comparison-month-to-month',
  templateUrl: './comparison-month-to-month.component.html',
  styleUrls: ['./comparison-month-to-month.component.css']
})
export class ComparisonMonthToMonthComponent implements OnInit {

  currentDate: Date = new Date;
  valid: boolean;
  notFound: boolean;
  R_defined: boolean; C_defined: boolean

  month;
  Site
  year1;
  year2;

  i: number;
  years;
  con: number; rec: number;
  conVar; recVar;
  conSum; recSum;
  util;

  jsonData;
  results;
  consumes; receives;

  // {"month": 5, "year1": 2013, "year2": 2013}
  constructor(private _dataService: DataService, private router: Router) { }

  ngOnInit() {
    this.valid = false;
    this.notFound = false;

    this._dataService.getYears()
      .subscribe(res => {
        this.years = res
      },
        err => console.log(err.message))


    if (sessionStorage.getItem('userData') === null) {
      //window.alert('Must Login First');
      //  this.router.navigate(['/']);
    }

    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
     }
  
  }

  viewReport() {

    this.month = document.querySelector('#ddlMonth');
    this.Site = document.querySelector('#ddlSite');
    this.year1 = document.querySelector('#ddlYear1');
    this.year2 = document.querySelector('#ddlYear2');

    const site = this.Site.value
    const monthVal = this.month.value;
    const year1Val = this.year1.value;
    const year2Val = this.year2.value;

    // this.jsonData = {'month': monthVal, 'year1': year1Val, 'year2': year2Val}
    this.jsonData = { 'month': monthVal, "year1": year1Val, 'year2': year2Val }

    if (monthVal == "" || year1Val == "" || year2Val == "") {
      console.log('NULL VALUES')
      this.valid = false;
      this.notFound = true;
    } else {
      this._dataService.compareMonthToMonth(this.jsonData)
        .subscribe(res => {
          if (res.length >= 1) {

            this.notFound = false;
            this.results = res;

            this.rec = 0;
            this.con = 0;
            this.recVar = 0;
            this.conVar = 0;

            this.consumes = res[0];
            this.receives = res[1]

            for (this.i = 0; this.i < this.consumes.length; this.i++) {
              this.con += this.consumes[this.i].Consumed_Water

              if (site == this.consumes[this.i].Name) {
                //this.con = { 'name': this.consumes[this.i].Name, 'consumed': this.consumes[this.i].Consumed_Water}
                //this.con = this.consumes[this.i].Consumed_Water;
              }
            }


            for (this.i = 0; this.i < this.receives.length; this.i++) {
              this.rec += this.receives[this.i].Received_Water

              if (site == this.receives[this.i].Name) {
                // this.rec = { 'name': this.receives[this.i].Name, 'received':  this.receives[this.i].Received_Water}
                // this.rec = this.receives[this.i].Received_Water;
              }
            }

            if (isNaN(this.rec) || isNullOrUndefined(this.rec)) {
              this.recSum = 0.00;
              this.R_defined = false
            } else {
              this.recSum = this.rec.toFixed(2)
              this.R_defined = true
            }

            if (isNaN(this.con) || isNullOrUndefined(this.con)) {
              this.conSum = 0.00;
              this.C_defined = false
            } else {
              this.conSum = this.con.toFixed(2)
              this.C_defined = true
            }


            if (this.R_defined && this.C_defined) {
              if (this.conSum == 0 || this.recSum == 0) {
                this.util = 0
                //this.recVar = 0;
                //this.conVar = 0;
              } else {
                this.util = ((this.con / this.rec)*100).toFixed(2)
                //this.recVar
                //this.conVar
              }

            } else {
              this.util = 0
              //this.recVar = 0;
              //this.conVar = 0;
            }
            console.log(res)

            this.valid = true;
            console.log('DATA FOUND')
          } else {
            this.valid = false;
            console.log('DATA NOT FOUND')
            delay(1000)
            this.notFound = true;
          }
        },
          err => console.log('error: ' + err))
    }

  }

}
