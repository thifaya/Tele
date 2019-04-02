import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-volume-trends-received',
  templateUrl: './volume-trends-received.component.html',
  styleUrls: ['./volume-trends-received.component.css']
})
export class VolumeTrendsReceivedComponent implements OnInit {

  constructor(private router: Router) { }

  test = false;

  ngOnInit() {
    if (localStorage.getItem('userData') === null) {
      this.router.navigate(['/']);
    }
  }

}
