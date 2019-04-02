import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';



@Component({
  selector: 'app-invoice-forecast',
  templateUrl: './invoice-forecast.component.html',
  styleUrls: ['./invoice-forecast.component.css']
})
export class InvoiceForecastComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
