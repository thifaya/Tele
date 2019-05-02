import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-fochville-flow-rate-trends',
  templateUrl: './fochville-flow-rate-trends.component.html',
  styleUrls: ['./fochville-flow-rate-trends.component.css']
})
export class FochvilleFlowRateTrendsComponent implements OnInit {

  currentDate: Date = new Date;

  constructor(private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
     // this.router.navigate(['/']);
    }

    if (sessionStorage.getItem('userData') === null) {
      window.alert('Must Login First');
    //  this.router.navigate(['/']);
      }
  }

}
