import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';


@Component({
  selector: 'app-yearly-water-received',
  templateUrl: './yearly-water-received.component.html',
  styleUrls: ['./yearly-water-received.component.css']
})
export class YearlyWaterReceivedComponent implements OnInit {

  constructor(private router: Router) { }

  currentDate: Date = new Date();
  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
