import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-multi-year-received-trends',
  templateUrl: './multi-year-received-trends.component.html',
  styleUrls: ['./multi-year-received-trends.component.css']
})
export class MultiYearReceivedTrendsComponent implements OnInit {

  constructor() { }

  currentDate: Date = new Date();
  ngOnInit() {
  }

}
