import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Chart } from 'angular-highcharts';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);


@Component({
    selector: 'app-aggregate-consumed-water',
    templateUrl: './aggregate-consumed-water.component.html',
    styleUrls: ['./aggregate-consumed-water.component.css']
})
export class AggregateConsumedWaterComponent implements OnInit {

    test: boolean;
    currentDate: Date = new Date;
    chart;

    Highcharts = Highcharts;
    chartOptions;

    constructor(private router: Router) { }

    ngOnInit() {
        this.test = false;
        if (localStorage.getItem('userData') === null) {
            //    this.router.navigate(['/']);
        }
    }

    viewReport() {
        this.test = true;

        this.chartOptions = {
            chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 65,
                    beta: 0
                }
            },

            title: {
                text: 'Water Consumed Per SITE'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            credits: {
                enabled: false
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    depth: 35,
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: 'grey'
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Weeek Days',
                data: [
                    ['Monday', 30.0],
                    ['Tuesday', 10.0],
                    ['Wednesday', 26.8],
                    {
                        name: 'Thursday',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['Friday', 8.5],
                    ['Saturday', 6.2],
                    ['Sunday', 5.7]
                ]
            }]
        };

        console.log('Report for Aggregate Water Consumed Retrieved');
    }

}

/* chart
        this.chart = new Chart({
            chart: {
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 45,
                    beta: 0
                }
            },

            title: {
                text: 'Water Consumed Per SITE'
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            credits: {
                enabled: false
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    depth: 35,
                    dataLabels: {
                        enabled: true,
                        format: '<b>{point.name}</b>: {point.percentage:.1f} %',
                        style: {
                            color: 'black'
                        }
                    }
                }
            },
            series: [{
                type: 'pie',
                name: 'Weeek Days',
                data: [
                    ['Monday', 30.0],
                    ['Tuesday', 10.0],
                    ['Wednesday', 26.8],
                    {
                        name: 'Thursday',
                        y: 12.8,
                        sliced: true,
                        selected: true
                    },
                    ['Friday', 8.5],
                    ['Saturday', 6.2],
                    ['Sunday', 5.7]
                ]
            }]
        });
*/

