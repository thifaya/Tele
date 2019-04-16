import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';



@Component({
  selector: 'app-invoice-forecast',
  templateUrl: './invoice-forecast.component.html',
  styleUrls: ['./invoice-forecast.component.css']
})
export class InvoiceForecastComponent implements OnInit {

  test: boolean;
  currentDate: Date = new Date;

  month;
  household;

  index;
  monthName;

  constructor(private router: Router) { }

  ngOnInit() {
    this.test = false;
    if (localStorage.getItem('userData') === null) {
     // this.router.navigate(['/']);
    }
  }

  viewReport() {
    this.test = true;

    this.month = document.querySelector('#ddlMonth');
    this.household = document.querySelector('#txtWaterAllocation');

    this.index = this.month.value;
    this.monthName = this.month[this.index].label;

    console.log('Finance Report Retrieved');
  }

}
