import { Component, OnInit } from '@angular/core';
import { Chart } from 'angular-highcharts';
import { Router } from '@angular/router';


@Component({
    selector: 'app-aggregate-consumed-water',
    templateUrl: './aggregate-consumed-water.component.html',
    styleUrls: ['./aggregate-consumed-water.component.css']
})
export class AggregateConsumedWaterComponent implements OnInit {

    chart = new Chart({
        chart: {
            type: 'pie',
            options3d: {
                enabled: true,
                alpha: 50,
                beta: 0
            }
            /*options3d: {
                enabled: true,
                alpha: 40,
                beta: 0,
                depth: 100
            }*/
        },


        title: {
            text: 'Water Recceived per day of the week'
        },
        tooltip: {
            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                depth: 35,
                dataLabels: {
                    enabled: true,
                    format: '{point.name}'
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

    constructor(private router: Router) { }

    ngOnInit() {
        if (localStorage.getItem('userData') === null) {
            this.router.navigate(['/']);
        }
    }

}
