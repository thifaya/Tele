import { Component, OnInit } from '@angular/core';
import { Chart } from 'angular-highcharts';
import { Router } from '@angular/router';
//////////////////////////
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);


@Component({
    selector: 'app-aggregate-received-water',
    templateUrl: './aggregate-received-water.component.html',
    styleUrls: ['./aggregate-received-water.component.css']
})
export class AggregateReceivedWaterComponent implements OnInit {

    invalid: boolean;
    currentDate: Date = new Date;
    Highcharts = Highcharts;
    chartOptions;
    chart;

    constructor(private router: Router) { }

    ngOnInit() {
        this.invalid = false;
        if (localStorage.getItem('userData') === null) {
            //   this.router.navigate(['/']);
        }
    }

    viewReport() {
        this.invalid = true;

        this.chartOptions = {
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie',
                options3d: {
                    enabled: true,
                    alpha: 65,
                    beta: 0,
                }
            },
            title: {
                text: 'Water Recceived per SITE'
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
                        enabled: true, // '<b>{point.name}</b>: {point.percentage:.1f} %'
                        format: '<b>{point.percentage:.1f} % </b>',
                        style: {
                            color: 'grey'
                        }
                    },
                    showInLegend: true,
                }
            },
            series: [{
                type: 'pie',
                name: 'Weeek Days',
                data: [
                    ['Monday', 10.0],
                    ['Tuesday', 26.8],
                    ['Wednesday', 30.0],
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

        console.log('Report for Aggregate Water Received Retrieved');
    }

}
