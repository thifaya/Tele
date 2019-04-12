import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-volume-trends-consumed',
  templateUrl: './volume-trends-consumed.component.html',
  styleUrls: ['./volume-trends-consumed.component.css']
})
export class VolumeTrendsConsumedComponent implements OnInit {

  constructor(private router: Router) { }

  test: boolean;
  index;
  site;
  siteNane;
  date;
  dateSelect;

  ngOnInit() {
    this.test = false;
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

  viewReport() {
    this.test = true;
    this.site = document.querySelector('#ddlSite');
    this.date = document.querySelector('#dpDate');

    this.index = this.site.value;
    this.siteNane = this.site[++this.index].label;
    this.dateSelect = this.date.value;

     console.log('Daily Consumed Volume Report Retrieved');

  }

}
