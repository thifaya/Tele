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
    if (sessionStorage.getItem('userData') === null) {
      window.alert('Must Login First');
      this.router.navigate(['/']);
      }

    if (localStorage.getItem('userData') === null) {
    //  this.router.navigate(['/']);
    }
  }

}
