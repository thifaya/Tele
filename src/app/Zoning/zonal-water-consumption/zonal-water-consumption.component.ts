import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-zonal-water-consumption',
  templateUrl: './zonal-water-consumption.component.html',
  styleUrls: ['./zonal-water-consumption.component.css']
})
export class ZonalWaterConsumptionComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {
  
    if (localStorage.getItem('UserId') === null) {
      this.router.navigate(['/']);
     }
  
  }

}
