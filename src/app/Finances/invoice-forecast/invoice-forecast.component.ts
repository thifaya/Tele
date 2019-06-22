import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Service/data.service';
import * as mssql from 'mssql';



@Component({
  selector: 'app-invoice-forecast',
  templateUrl: './invoice-forecast.component.html',
  styleUrls: ['./invoice-forecast.component.css']
})
export class InvoiceForecastComponent implements OnInit {

  visible: boolean;
  notFound: boolean
  currentDate: Date = new Date;
  i: number


  costPrice;
  sellPrice;
  loss;

  payment; revenue;
  allocatedFBW; availableWater
  availableCost; revenueMargin
  usage; con; rec;

  month; FBWperHouse; index: string
  numOfHouseholds; year; monthName

  results
  jsonDATA = {};
  resREC; resCON;
  ReceivedTotal: number = 0; ConsumedTotal: number = 0

  provinceDropdown; municipalityDropdown;
  districtDropdown; siteDropdown

  constructor(private router: Router, private _service: DataService) { }

  ngOnInit() {
    this.visible = false;
    this.notFound = false;


    this.districtDropdown = document.querySelector('#ddldistrict')
    this.provinceDropdown = document.querySelector('#ddlprovince')
    this.municipalityDropdown = document.querySelector('#ddlmunicipality')
    this.siteDropdown = document.querySelector('#ddlSite')    

    this.districtDropdown.disabled = true
    this.municipalityDropdown.disabled = true
    this.siteDropdown.disabled = true


    if (localStorage.getItem('UserId') === null) {
      this.router.navigate(['/']);
     }
  

    if (sessionStorage.getItem('UserId') === null) {
      // this.router.navigate(['/']);
    }
  }

  viewReport() {
    
    this.month = document.querySelector('#ddlMonth');
    this.numOfHouseholds = document.querySelector('#txtHousehold');
    this.year = document.querySelector('#ddlYear');
    this.FBWperHouse = document.querySelector('#txtWaterAllocation');

    this.index = this.month.value
    const monthArray = this.index.split('~',2)
    const month = monthArray[0];
    this.monthName = monthArray[1]

    const numberOfHouses = this.numOfHouseholds.value
    const Year = this.year.value
    const FBWperHouse = this.FBWperHouse.value

    if (monthArray[0] == "" || this.numOfHouseholds.value == "" || this.year.value == "" || FBWperHouse == "" || this.siteDropdown.value == "" ) {
      console.log('NULL VALUES')
      this.visible = false;
      this.notFound = true;
    } else {
      this.notFound = false;
      this.jsonDATA = { "month": month, "year": Year }
      this._service.getAggregateConsumed(this.jsonDATA)
        .subscribe(consumed => {
          this.notFound = false;

          if (consumed.length > 0) {
            this.ConsumedTotal = 0;
            this.resCON = consumed

            for (this.i = 0; this.i < consumed.length; this.i++) {
              this.ConsumedTotal += this.resCON[this.i].Analog1
            }


            this._service.getAggregateReceived(this.jsonDATA)
              .subscribe(received => {
                this.notFound = false;

                if (received.length > 0) {
                  this.ReceivedTotal = 0;
                  this.visible = true;
                  this.resREC = received;

                  for (this.i = 0; this.i < received.length; this.i++) {
                    this.ReceivedTotal += this.resREC[this.i].Analog1
                  }


                  console.log(this.resCON)
                  console.log(this.resREC)

                  this._service.getFinanceRevunue()
                    .subscribe(res => {
                      if (res.length > 0) {

                        this.notFound = false;

                        this.results = res

                        // calculations AllowableLossPercentage CostPrice MaximumFreeBasicWater  SellingPrice
                        this.costPrice = this.results[0].CostPrice
                        this.sellPrice = this.results[0].SellingPrice
                        this.loss = this.results[0].AllowableLossPercentage

                        // REVENUE
                        this.revenue = ((this.ConsumedTotal - (FBWperHouse * numberOfHouses)) - (this.loss * (this.ConsumedTotal - ( FBWperHouse * numberOfHouses )))) * this.sellPrice

                        // PAYMENT
                        this.payment = this.ReceivedTotal * this.costPrice

                        // ALLOCATED FREE BASIC WATER
                        this.allocatedFBW = numberOfHouses * FBWperHouse * this.sellPrice

                        // AVAILABLE WATER
                        this.availableWater = this.ReceivedTotal - this.ConsumedTotal

                        // COST OF AVAILABLE WATER
                        this.availableCost = (this.ReceivedTotal - this.ConsumedTotal) * this.costPrice

                        // REVENUE MARGIN BEFORE LOSS AND FBW ALLOCATION
                        this.revenueMargin = (this.ReceivedTotal - this.ConsumedTotal) * this.sellPrice

                        // USAGE INDICATOR
                        this.usage = (this.ConsumedTotal / this.ReceivedTotal) * 100
                       // this.usage = (this.ReceivedTotal / this.ConsumedTotal) * 100


                        console.log(res)
                        
                        console.log('DATA FOUND');
                        this.visible = true;
                      } else {
                        console.log('DATA NOT FOUND');

                        this.visible = false;
                        this.notFound = true;
                      }
                    })

                } else {
                  console.log('DATA NOT FOUND');

                  this.visible = false;
                  this.notFound = true;

                }

              })
          } else {
            console.log('DATA NOT FOUND');

            this.visible = false;
            this.notFound = true;

          }

        })
        

      /*
        if () {
          
        } else {
          
        }*/


      //for (this.i = 0; this.i < res.length; this.i++) {
      //this.sum += this.results[this.i].Analog1
      //}
      

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
