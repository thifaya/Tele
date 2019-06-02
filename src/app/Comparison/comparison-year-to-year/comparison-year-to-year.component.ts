import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Server/data.service';
import { Router } from '@angular/router';
import { isNullOrUndefined } from 'util';
import { isDefined } from '@angular/compiler/src/util';

@Component({
  selector: 'app-comparison-year-to-year',
  templateUrl: './comparison-year-to-year.component.html',
  styleUrls: ['./comparison-year-to-year.component.css']
})
export class ComparisonYearToYearComponent implements OnInit {

  currentDate: Date = new Date;
  valid: boolean;
  notFound: boolean;
  R_defined: boolean; C_defined: boolean

  month;
  year1;
  year2;


  jsonData;
  results
  consumes;
  receives

  con: number; rec: number;
  conVar; recVar;
  conSum; recSum;
  util; i: number

  // {"year1": 2013, "year2": 2013}
  constructor(private router: Router, private _service: DataService) { }

  ngOnInit() {
    this.valid = false;
    this.notFound = false;

    if (sessionStorage.getItem('userData') === null) {
     // window.alert('Must Login First');
      //  this.router.navigate(['/']);
    }

  
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
     }
  
  }

  viewReport() {
    this.R_defined = false
    this.C_defined = false
    this.year1 = document.querySelector('#ddlYear1');
    this.year2 = document.querySelector('#ddlYear2');

    const Year1 = this.year1.value;
    const Year2 = this.year2.value;

    this.jsonData = { "year1": Year1, 'year2': Year2 }

    if (Year1 == "" || Year1 == "") {
      console.log('NULL VALUES')
      this.valid = false;
      this.notFound = true;
    } else {
      this._service.compareYearToYear(this.jsonData)
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
            }

            for (this.i = 0; this.i < this.receives.length; this.i++) {
              this.rec += this.receives[this.i].Received_Water
            }


            if(isNaN(this.rec) || isNullOrUndefined(this.rec) ) {
              this.recSum = 0.00;
              this.R_defined = false
            } else {
              this.recSum = this.rec.toFixed(2)
              this.R_defined = true
            }
             
            if( isNaN(this.con) || isNullOrUndefined(this.con)) {
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

            this.valid = true;

            console.log(res)
            console.log('DATA FOUND')
          } else {
            this.valid = false;
            console.log('DATA NOT FOUND')
            this.notFound = true;
          }
        },
          err => console.log(err))

    }
    
  }

}
// { "year1": 2013, 'year2': 2013 }