import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-comparison-year-to-year',
  templateUrl: './comparison-year-to-year.component.html',
  styleUrls: ['./comparison-year-to-year.component.css']
})
export class ComparisonYearToYearComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
