import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-volume-trends-received',
  templateUrl: './volume-trends-received.component.html',
  styleUrls: ['./volume-trends-received.component.css']
})
export class VolumeTrendsReceivedComponent implements OnInit {

  constructor(private router: Router) { }

  invalid: boolean;
  index;
  site;
  siteNane;

  date;
  dateSelect;

  ngOnInit() {
    this.invalid = false;

    if (sessionStorage.getItem('userData') === null) {
      window.alert('Must Login First');
    //  this.router.navigate(['/']);
      }

    if (localStorage.getItem('userData') === null) {
    //  this.router.navigate(['/']);
    }
  }

  viewReport() {
    this.invalid = true;
    this.site = document.querySelector('#ddlSite');
    this.date = document.querySelector('#dpDate');

    this.index = this.site.value;
    this.siteNane = this.site[++this.index].label;
    this.dateSelect = this.date.value;

    console.log('Daily Received Volume Report Retrieved');

  }

}
