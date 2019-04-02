import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-zonal-water-distribution',
  templateUrl: './zonal-water-distribution.component.html',
  styleUrls: ['./zonal-water-distribution.component.css']
})
export class ZonalWaterDistributionComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
