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


  constructor(private _monthServive: DataService, private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }
}
