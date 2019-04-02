import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-volume-trends-consumed',
  templateUrl: './volume-trends-consumed.component.html',
  styleUrls: ['./volume-trends-consumed.component.css']
})
export class VolumeTrendsConsumedComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
