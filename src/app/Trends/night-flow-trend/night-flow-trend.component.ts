import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-night-flow-trend',
  templateUrl: './night-flow-trend.component.html',
  styleUrls: ['./night-flow-trend.component.css']
})
export class NightFlowTrendComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
