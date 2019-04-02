import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-alarm-statistics',
  templateUrl: './alarm-statistics.component.html',
  styleUrls: ['./alarm-statistics.component.css']
})
export class AlarmStatisticsComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
