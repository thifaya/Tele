import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Service/data.service';
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

  site;
  year1;
  year2;


  jsonData;
  results/*
  consumes;
  receives

  con: number; rec: number;
  conVar; recVar;
  conSum; recSum;
  util;*/
   i: number

  Year1_ConInd: number; Year2_ConInd: number
  Year1_RecInd: number; Year2_RecInd: number
  Year1_Conindex; Year2_Conindex
  Year1_Recindex; Year2_Recindex
  Year1_con; Year2_con
  Year1_rec; Year2_rec
  conVar; recVar;  
  Year1_conSum; Year2_conSum
  Year1_recSum; Year2_recSum
  Year1_util; Year2_util
  Year1_consumes; Year2_consumes
  Year1_receives; Year2_receives

  provinceDropdown; municipalityDropdown;
  districtDropdown; siteDropdown

  // {"year1": 2013, "year2": 2013}
  constructor(private router: Router, private _service: DataService) { }

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
     
    this.year1 = document.querySelector('#ddlYear1');
    this.year2 = document.querySelector('#ddlYear2');

 
     this.districtDropdown.disabled = true
     this.municipalityDropdown.disabled = true
     this.siteDropdown.disabled = true
  
  }

  viewReport() {
    this.R_defined = false
    this.C_defined = false

   // const Year1 = this.year1.value;
   // const Year2 = this.year2.value;

    this.jsonData = { "year1": this.year1.value, 'year2': this.year2.value }

    if (this.year1.value == "" || this.year2.value == "") {
      console.log('NULL VALUES')
      this.valid = false;
      this.notFound = true;
    } else {
      this._service.YEAR1yeartoyear({"year1": this.year1.value})
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

            if (this.siteDropdown.value == 'ALL') {

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
                
              }

            } else {

              this.results = []
              for (this.Year1_ConInd = 0; this.Year1_ConInd < this.Year1_consumes.length; this.Year1_ConInd++) {
               

                if (this.siteDropdown.value == this.Year1_consumes[this.Year1_ConInd].Name) {
                  this.Year1_Conindex = this.Year1_ConInd
                  break;
                  //this.Year1_con = { 'name': this.Year1_consumes[this.i].Name, 'consumed': this.Year1_consumes[this.i].Consumed_Water}
                  //this.Year1_con = this.Year1_consumes[this.i].Consumed_Water;
                }
              }




              for (this.Year1_RecInd = 0; this.Year1_RecInd < this.Year1_receives.length; this.Year1_RecInd++) {
               

                if (this.siteDropdown.value == this.Year1_receives[this.Year1_RecInd].Name) {
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
                
              } else {
                this.Year1_util = ((this.Year1_conSum / this.Year1_recSum) * 100).toFixed(2)
                
              }


            }

            this._service.YEAR2yeartoyear({ 'year2': this.year2.value })
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

                  if (this.siteDropdown.value == 'ALL') {

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

                      } else {
                        this.Year2_util = ((this.Year2_con / this.Year2_rec) * 100).toFixed(2)
                        this.recVar = ((this.Year2_recSum - this.Year1_recSum) / this.Year1_recSum) * 100
                        this.conVar = ((this.Year2_conSum - this.Year1_conSum) / this.Year1_conSum) * 100

                        if(this.recVar == 0) {
                          this.recVar = 0;
                        }

                        if(this.conVar == 0) {
                          this.conVar = 0;
                        }

                      }

                    } else {
                      this.Year2_util = 0
                      this.recVar = 0
                      this.conVar = 0
                    }

console.log('recVar'+this.recVar)
console.log('conVar'+this.conVar)

                  } else {


                    for (this.Year2_ConInd = 0; this.Year2_ConInd < this.Year2_consumes.length; this.Year2_ConInd++) {


                      if (this.siteDropdown.value == this.Year2_consumes[this.Year2_ConInd].Name) {
                        this.Year2_Conindex = this.Year2_ConInd
                        break;
                        //this.Year2_con = { 'name': this.Year2_consumes[this.i].Name, 'consumed': this.Year2_consumes[this.i].Consumed_Water}
                        //this.Year2_con = this.Year2_consumes[this.i].Consumed_Water;
                      }
                    }




                    for (this.Year2_RecInd = 0; this.Year2_RecInd < this.Year2_receives.length; this.Year2_RecInd++) {
                      //   this.Year2_rec += this.Year2_receives[this.Year2_RecInd].Received_Water

                      if (this.siteDropdown.value == this.Year2_receives[this.Year2_RecInd].Name) {
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
                      //this.Year2_recVar = 0;
                      //this.Year2_conVar = 0;
                    } else {
                      this.Year2_util = ((this.Year2_conSum / this.Year2_recSum) * 100).toFixed(2)
                        
                        this.recVar = ((this.Year2_recSum - this.Year1_recSum) / this.Year1_recSum) * 100
                        this.conVar = ((this.Year2_conSum - this.Year1_conSum) / this.Year1_conSum) * 100

                        if(this.recVar == 0) {
                          this.recVar = 0;
                        }

                        if(this.conVar == 0) {
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
          err => console.log(err))

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
// { "year1": 2013, 'year2': 2013 }