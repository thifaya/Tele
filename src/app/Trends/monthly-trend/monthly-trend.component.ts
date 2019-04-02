import { Component, OnInit } from '@angular/core';
import { Chart } from 'angular-highcharts';
import { Router } from '@angular/router';


@Component({
  selector: 'app-monthly-trend',
  templateUrl: './monthly-trend.component.html',
  styleUrls: ['./monthly-trend.component.css']
})
export class MonthlyTrendComponent implements OnInit {

  chart = new Chart({
    chart: {
      type: 'area'
    },
    title: {
      text: 'Monthly Water Level',
    },
     xAxis: {
      categories: [
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday',
        'Sunday'
    ],
    plotBands: [{ // visualize the weekend
      color: 'rgba(68, 170, 213, .2)'
  }]
    },
    yAxis: {
      title: {
          text: 'Level'
      }
  },
  plotOptions: {
    area: {
        fillOpacity: 0.5,
        marker: {
          enabled: false
      }
    },
},
        credits: {
      enabled: false
    },
    series: [
      {
        name: 'Date',
        data: [1, 2, 3, 2, 4, 2, 3]
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
