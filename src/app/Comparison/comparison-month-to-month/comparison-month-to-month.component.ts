import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Service/data.service';
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
  years;

  i: number;

  /**
   *   ConInd: number
    RecInd: number
    Conindex
    Recindex
    con: number; rec: number;
    conVar; recVar;
    conSum; recSum;
    util;
    consumes; receives;
   */
  Year1_ConInd: number; Year2_ConInd: number
  Year1_RecInd: number; Year2_RecInd: number
  Year1_Conindex; Year2_Conindex
  Year1_Recindex; Year2_Recindex
  Year1_con; Year2_con
  Year1_rec; Year2_rec

  Year1_conSum; Year2_conSum
  Year1_recSum; Year2_recSum
  Year1_util; Year2_util
  Year1_consumes; Year2_consumes
  Year1_receives; Year2_receives


  conVar; recVar;

  jsonData;
  results;

  provinceDropdown; municipalityDropdown;
  districtDropdown; siteDropdown

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


    this.month = document.querySelector('#ddlMonth');
    this.Site = document.querySelector('#ddlSite');
    this.year1 = document.querySelector('#ddlYear1');
    this.year2 = document.querySelector('#ddlYear2');


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
    this.siteDropdown = document.querySelector('#ddlSite')

    this.districtDropdown.disabled = true
    this.municipalityDropdown.disabled = true
    this.siteDropdown.disabled = true

  }

  viewReport() {



    
    this.jsonData = { 'month': this.month.value, "year1": this.year1.value, 'year2': this.year2.value }

    if (this.Site.value == "" || this.month.value == "" || this.year1.value == "" || this.year2.value == "") {
      console.log('NULL VALUES')
      this.valid = false;
      this.notFound = true;
    } else {
      this.results = []
      this._dataService.YEAR1monthtomonth({ 'month': this.month.value, "year1": this.year1.value })
        .subscribe(y1 => {
          this.results = y1;
          if (this.results.length >= 1) {
            console.log(y1)
            this.notFound = false;

            this.Year1_rec = 0;
            this.Year1_con = 0;
            this.Year1_ConInd = 0;
            this.Year1_RecInd = 0;

            this.Year1_consumes = y1[1];
            this.Year1_receives = y1[0]

            if (this.Site.value == 'ALL') {

              for (this.i = 0; this.i < this.Year1_consumes.length; this.i++) {
                this.Year1_con += this.Year1_consumes[this.i].Consumed_Water

              }


              for (this.i = 0; this.i < this.Year1_receives.length; this.i++) {
                this.Year1_rec += this.Year1_receives[this.i].Received_Water

              }

              if (isNaN(this.Year1_rec) || isNullOrUndefined(this.Year1_rec)) {
                this.Year1_recSum = 0.00;
                this.R_defined = false
              } else {
                this.Year1_recSum = this.Year1_rec
                this.R_defined = true
              }

              if (isNaN(this.Year1_con) || isNullOrUndefined(this.Year1_con)) {
                this.Year1_conSum = 0.00;
                this.C_defined = false
              } else {
                this.Year1_conSum = this.Year1_con
                this.C_defined = true
              }


              if (this.R_defined && this.C_defined) {
                if (this.Year1_conSum == 0 || this.Year1_recSum == 0) {
                  this.Year1_util = 0

                } else {
                  this.Year1_util = ((this.Year1_con / this.Year1_rec) * 100).toFixed(2)

                }

              } else {
                this.Year1_util = 0
                //this.Year1_recVar = 0;
                //this.Year1_conVar = 0;
              }

            } else {

              this.results = []
              for (this.Year1_ConInd = 0; this.Year1_ConInd < this.Year1_consumes.length; this.Year1_ConInd++) {


                if (this.Site.value == this.Year1_consumes[this.Year1_ConInd].Name) {
                  this.Year1_Conindex = this.Year1_ConInd
                  break;
                  //this.Year1_con = { 'name': this.Year1_consumes[this.i].Name, 'consumed': this.Year1_consumes[this.i].Consumed_Water}
                  //this.Year1_con = this.Year1_consumes[this.i].Consumed_Water;
                }
              }




              for (this.Year1_RecInd = 0; this.Year1_RecInd < this.Year1_receives.length; this.Year1_RecInd++) {


                if (this.Site.value == this.Year1_receives[this.Year1_RecInd].Name) {
                  this.Year1_Recindex = this.Year1_RecInd
                  break;
                  // this.Year1_rec = { 'name': this.Year1_receives[this.i].Name, 'received':  this.Year1_receives[this.i].Received_Water}
                  // this.Year1_rec = this.Year1_receives[this.i].Received_Water;
                }
              }
              console.log(this.Year1_consumes[this.Year1_Conindex].Consumed_Water)
              console.log(this.Year1_Recindex)
              console.log(this.Year1_receives[this.Year1_Recindex])
              console.log(this.Year1_consumes[this.Year1_Conindex].Consumed_Water)


              this.Year1_conSum = this.Year1_consumes[this.Year1_Conindex].Consumed_Water
              this.Year1_recSum = this.Year1_receives[this.Year1_Recindex].Received_Water

              if (this.Year1_conSum == 0 || this.Year1_recSum == 0) {
                this.Year1_util = 0
                //this.Year1_conVar = 0;
              } else {
                this.Year1_util = ((this.Year1_conSum / this.Year1_recSum) * 100).toFixed(2)
                //this.Year1_recVar
                //this.Year1_conVar
              }



              //console.log(this.index)

            }

            this._dataService.YEAR2monthtomonth({ 'month': this.month.value, 'year2': this.year2.value })
              .subscribe(y2 => {
                this.results = y2;
                if (this.results.length >= 1) {
                  console.log(y2)

                  this.notFound = false;

                  this.Year2_rec = 0;
                  this.Year2_con = 0;
                  this.Year2_ConInd = 0;
                  this.Year2_RecInd = 0

                  this.Year2_consumes = y2[1];
                  this.Year2_receives = y2[0]

                  if (this.Site.value == 'ALL') {

                    for (this.i = 0; this.i < this.Year2_consumes.length; this.i++) {
                      this.Year2_con += this.Year2_consumes[this.i].Consumed_Water

                    }


                    for (this.i = 0; this.i < this.Year2_receives.length; this.i++) {
                      this.Year2_rec += this.Year2_receives[this.i].Received_Water

                    }

                    if (isNaN(this.Year2_rec) || isNullOrUndefined(this.Year2_rec)) {
                      this.Year2_recSum = 0.00;
                      this.R_defined = false
                    } else {
                      this.Year2_recSum = this.Year2_rec.toFixed(2)
                      this.R_defined = true
                    }

                    if (isNaN(this.Year2_con) || isNullOrUndefined(this.Year2_con)) {
                      this.Year2_conSum = 0.00;
                      this.C_defined = false
                    } else {
                      this.Year2_conSum = this.Year2_con.toFixed(2)
                      this.C_defined = true
                    }


                    if (this.R_defined && this.C_defined) {
                      if (this.Year2_conSum == 0 || this.Year2_recSum == 0) {
                        this.Year2_util = 0
                        this.recVar = 0
                        this.conVar = 0
                        // this.conVar = (this.Year2_conSum - this.year1.Year2_conSum) / this.Year2_conSum
  
                      } else {
                        this.Year2_util = ((this.Year2_con / this.Year2_rec) * 100).toFixed(2)
                        this.recVar = ((this.Year2_recSum - this.Year1_recSum) / this.Year1_recSum) * 100
                        this.conVar = ((this.Year2_conSum - this.Year1_conSum) / this.Year1_conSum) * 100

                        if (this.recVar == 0) {
                          this.recVar = 0;
                        }

                        if (this.conVar == 0) {
                          this.conVar = 0;
                        }

                      }

                    } else {
                      this.Year2_util = 0
                      this.recVar = 0
                      this.conVar = 0
                    }

                    console.log('recVar' + this.recVar)
                    console.log('conVar' + this.conVar)

                  } else {


                    for (this.Year2_ConInd = 0; this.Year2_ConInd < this.Year2_consumes.length; this.Year2_ConInd++) {


                      if (this.Site.value == this.Year2_consumes[this.Year2_ConInd].Name) {
                        this.Year2_Conindex = this.Year2_ConInd
                        break;
                        //this.Year2_con = { 'name': this.Year2_consumes[this.i].Name, 'consumed': this.Year2_consumes[this.i].Consumed_Water}
                        //this.Year2_con = this.Year2_consumes[this.i].Consumed_Water;
                      }
                    }




                    for (this.Year2_RecInd = 0; this.Year2_RecInd < this.Year2_receives.length; this.Year2_RecInd++) {
                      //   this.Year2_rec += this.Year2_receives[this.Year2_RecInd].Received_Water

                      if (this.Site.value == this.Year2_receives[this.Year2_RecInd].Name) {
                        this.Year2_Recindex = this.Year2_RecInd
                        break;
                        // this.Year2_rec = { 'name': this.Year2_receives[this.i].Name, 'received':  this.Year2_receives[this.i].Received_Water}
                        // this.Year2_rec = this.Year2_receives[this.i].Received_Water;
                      }
                    }




                    if(!isNullOrUndefined(this.Year2_consumes[this.Year2_Conindex])) {
                      this.Year2_conSum = this.Year2_consumes[this.Year2_Conindex].Consumed_Water
                    } else {
                      this.Year2_conSum = 0
                    }

                    if(!isNullOrUndefined(this.Year2_receives[this.Year2_Recindex])) {
                      this.Year2_recSum = this.Year2_receives[this.Year2_Recindex].Received_Water
                    } else {
                      this.Year2_recSum = 0
                    }

                    if (this.Year2_conSum == 0 || this.Year2_recSum == 0) {
                      this.Year2_util = 0
                      this.recVar = 0
                      this.conVar = 0
                    } else {
                      this.Year2_util = ((this.Year2_conSum / this.Year2_recSum) * 100).toFixed(2)

                      this.recVar = ((this.Year2_recSum - this.Year1_recSum) / this.Year1_recSum) * 100
                      this.conVar = ((this.Year2_conSum - this.Year1_conSum) / this.Year1_conSum) * 100

                      if (this.recVar == 0) {
                        this.recVar = 0;
                      }

                      if (this.conVar == 0) {
                        this.conVar = 0;
                      }
                    }



                    //console.log(this.index)

                  }


                  this.valid = true;
                  console.log('DATA FOUND')
                } else {
                  this.valid = false;
                  console.log('DATA NOT FOUND')
                  this.notFound = true;
                }
              },
                err => console.log('error: ' + err))


            this.valid = true;
            console.log('DATA FOUND')
          } else {
            this.valid = false;
            console.log('DATA NOT FOUND')
            this.notFound = true;
          }
        },
          err => console.log('error: ' + err))
    }

  }



  dropDownEnabled() {


    if (this.provinceDropdown.value == '') {

      this.districtDropdown.value = ''
      this.siteDropdown.value = ''
      this.municipalityDropdown.value = ''

      this.districtDropdown.disabled = true
      this.siteDropdown.disabled = true
      this.municipalityDropdown.disabled = true


    } else {
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
        console.log('siteDropdown null')
      } else {
        console.log('get value')
      }
    } else {
      this.siteDropdown.disabled = false
    }
  }

}
