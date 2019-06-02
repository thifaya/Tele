import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { Chart } from 'angular-highcharts';
import { DataService } from 'src/app/Server/data.service';
import * as Highcharts from 'highcharts';
import highcharts3D from 'highcharts/highcharts-3d.src';
highcharts3D(Highcharts);


@Component({
    selector: 'app-aggregate-consumed-water',
    templateUrl: './aggregate-consumed-water.component.html',
    styleUrls: ['./aggregate-consumed-water.component.css']
})
export class AggregateConsumedWaterComponent implements OnInit {

    visible: boolean;
    notFound: boolean;
    currentDate: Date = new Date;

    years; // bind to drop down list
    year;
    month;
    site;

    jsonDATA = {};
    index
    results
    chart = []
    i: number;
    sum = 0;


    Highcharts = Highcharts;
    chartOptions;

    constructor(private router: Router, private _service: DataService) { }

    ngOnInit() {
        this.visible = false;
        this._service.getYears()
            .subscribe(res => {
                this.years = res
            },
                err => console.log(err.message))

        if (localStorage.getItem('userData') === null) {
            //    this.router.navigate(['/']);
        }

        if (sessionStorage.getItem('userData') === null) {
            //    this.router.navigate(['/']);
        }
    }


    viewReport() {
        this.site = document.querySelector('#ddlSite');
        this.month = document.querySelector('#ddlMonth');
        this.year = document.querySelector('#ddlYear');

        this.index = this.site.value;
        const month = this.month.value;
        const year = this.year.value;

        const siteArray = this.index.split('~', 2)
        const siteId = siteArray[0]

        if (month == "" || year == "") {
            console.log('NULL VALUES')
            this.visible = false;
            this.notFound = true;
        } else {
            this.notFound = false;
            this.jsonDATA = { "month": month, "year": year }
            console.log(this.jsonDATA)

            this._service.getAggregateConsumed(this.jsonDATA)
                .subscribe(res => {
                    console.log(res)
                    if (res.length >= 1) {

                        this.results = res
                        this.sum = 0;
                        this.chart = [];

                        for (this.i = 0; this.i < res.length; this.i++) {
                            this.sum += this.results[this.i].Analog1
                            this.chart.push([this.results[this.i].Name, this.results[this.i].Analog1])
                        }
                        this.notFound = false;
                        this.visible = true;


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
                                name: 'Percentage of Amount Consumed',
                                data: this.chart,
                                enablePolling: true
                            }]
                        };

                    } else {
                        this.visible = false;
                        this.notFound = true;

                    }
                },
                    err => console.log(err))




        }


    }

}