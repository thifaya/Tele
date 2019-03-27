import { Component, OnInit } from '@angular/core';
import { Chart } from 'angular-highcharts';

@Component({
  selector: 'app-multi-year-received-trends',
  templateUrl: './multi-year-received-trends.component.html',
  styleUrls: ['./multi-year-received-trends.component.css']
})
export class MultiYearReceivedTrendsComponent implements OnInit {

  chart = new Chart({
    chart: {
      type: 'column',
      options3d: {
          enabled: true,
          alpha: 10,
          beta: 25,
          depth: 70
      }
  },
  plotOptions: {
    column: {
        depth: 25
    }
},
  title: {
      text: 'Highcharts Cylinder Chart'
  },
  series: [{
    name: 'water',
    data: [2, 3, null, 4, 0, 5, 1, 4, 6, 3]
    // showInLegend: false
  }]
  });


  constructor() { }

  currentDate: Date = new Date();
  ngOnInit() {
  }

}
