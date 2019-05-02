import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';



@Component({
  selector: 'app-carltonville-flow-rate-trends',
  templateUrl: './carltonville-flow-rate-trends.component.html',
  styleUrls: ['./carltonville-flow-rate-trends.component.css']
})
export class CarltonvilleFlowRateTrendsComponent implements OnInit {

  invalid: boolean;

  constructor(private router: Router) { }

  currentDate: Date = new Date();

  ngOnInit() {
    this.invalid = false;
    if (localStorage.getItem('userData') === null) {
      // this.router.navigate(['/']);
    }
  }

}
