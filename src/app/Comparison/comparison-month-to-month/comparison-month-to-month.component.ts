import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Server/data.service';
import { Router } from '@angular/router';
// import { any } from '@amcharts/amcharts4/.internal/core/utils/Array';
// import { string } from '@amcharts/amcharts4/core';

@Component({
  selector: 'app-comparison-month-to-month',
  templateUrl: './comparison-month-to-month.component.html',
  styleUrls: ['./comparison-month-to-month.component.css']
})
export class ComparisonMonthToMonthComponent implements OnInit {

  currentDate: Date = new Date;
  invalid: boolean;

  month;
  year1;
  year2;

  y1;
  y2;

  year1Index;
  year2Index;

  constructor(private _dateService: DataService, private router: Router) { }

  ngOnInit() {
    this.invalid = false;

    if (sessionStorage.getItem('userData') === null) {
      window.alert('Must Login First');
    //  this.router.navigate(['/']);
      }

    if (localStorage.getItem('userData') === null) {
     // this.router.navigate(['/']);
    }
  }

  viewReport() {
    this.invalid = true;
    this.month = document.querySelector('#ddlMonth');
    this.y1 = document.querySelector('#ddlYear1');
    this.y2 = document.querySelector('#ddlYear2');

    this.year1Index = this.y1.value;
    this.year2Index = this.y2.value;

    this.year1 = this.y1[++this.year1Index].label;
    this.year2 = this.y2[++this.year2Index].label;

    console.log('month to month comparison Report Received');
  }
}
