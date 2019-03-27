import { Component, OnInit } from '@angular/core';
import { Chart } from 'angular-highcharts';
import { post } from 'selenium-webdriver/http';
import { string } from '@amcharts/amcharts4/core';

@Component({
  selector: 'app-level-trends',
  templateUrl: './level-trends.component.html',
  styleUrls: ['./level-trends.component.css']
})
export class LevelTrendsComponent implements OnInit {

 public date = '';

  chart = new Chart({
    chart: {
      type: 'line'
    },
    title: {
      text: 'Daily Level Trend For  ' + this.date
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
        text: 'Level'
      }
    },
    responsive: {
      rules: [{
        condition: {
          maxWidth: 500
        },
        chartOptions: {
          legend: {
            layout: 'vertical',
            align: 'right',
            verticalAlign: 'middle'
          }
        }
      }]
    },
    xAxis: {
      categories: ['00:00', '04:00', '08:00', '12:00', '17:00', '21:00']
    },
    credits: {
      enabled: false
    },
    series: [
      {
        name: 'Time',
        data: [1, 2, 3, 2, 4, 2]
      }
    ]
  });

  constructor() { }

  formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
  format = this.formats[0];
  selectedDay: string;


  post(site: string) {
    return 'Daily Level Trend For  ' + site;
  }

  selectChangeHandler (event: any) {
    this.selectedDay = event.target.value;
  }


  ngOnInit() {
  }

}
