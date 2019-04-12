import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-comparison-year-to-year',
  templateUrl: './comparison-year-to-year.component.html',
  styleUrls: ['./comparison-year-to-year.component.css']
})
export class ComparisonYearToYearComponent implements OnInit {

  currentDate: Date = new Date;
  test: boolean;

  year1;
  year2;

  y1;
  y2;

  year1Index;
  year2Index;

  constructor(private router: Router) { }

  ngOnInit() {
    this.test = false;
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

  viewReport() {
    this.test = true;

    this.y1 = document.querySelector('#ddlYear1');
    this.y2 = document.querySelector('#ddlYear2');

    this.year1Index = this.y1.value;
    this.year2Index = this.y2.value;

    this.year1 = this.y1[++this.year1Index].label;
    this.year2 = this.y2[++this.year2Index].label;

    console.log('Year to Year comparison Report Received');
  }

}
