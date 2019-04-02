import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-zonal-variance',
  templateUrl: './zonal-variance.component.html',
  styleUrls: ['./zonal-variance.component.css']
})
export class ZonalVarianceComponent implements OnInit {


  msg: string;
  constructor(private router: Router) { }

  function(month, year) {
    if (month === '7' && year === '4') {
      this.msg = 'No Data Found';
    } else {
      this.msg = ' ';
    }
  }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
