import { Component, OnInit } from '@angular/core';
import * as am4core from '@amcharts/amcharts4/core';
import { Router } from '@angular/router';

import * as am4charts from '@amcharts/amcharts4/charts';
import am4themes_animated from '@amcharts/amcharts4/themes/animated';
import { Chart } from 'angular-highcharts';

am4core.useTheme(am4themes_animated);

@Component({
  selector: 'app-multi-year-consumed-trends',
  templateUrl: './multi-year-consumed-trends.component.html',
  styleUrls: ['./multi-year-consumed-trends.component.css']
})
export class MultiYearConsumedTrendsComponent implements OnInit {


  currentDate: Date = new Date();

  chart = new Chart({
    chart: {
      type: 'line'
    },
    title: {
      text: 'My Linechart',
    },
    plotOptions: {
      line: {
        marker: {
          enabled: false
        }
      }
    },
    yAxis: {
      title: {
        text: 'month value'
      }
    },
    xAxis: {
      categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
    },
    credits: {
      enabled: false
    },
    series: [
      {
        name: 'Months',
        data: [1, 2, 3, 2, 4, 2, 2, 5, 5, 2, 2, 1]
      }
    ]
  });

  constructor(private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
