import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Service/data.service';

@Component({
  selector: 'app-alarm-statistics',
  templateUrl: './alarm-statistics.component.html',
  styleUrls: ['./alarm-statistics.component.css']
})
export class AlarmStatisticsComponent implements OnInit {

  years

  constructor(private router: Router, private _dataService: DataService) { }

  ngOnInit() { 

    this._dataService.getYears()
        .subscribe(res => {
            this.years = res
        },
        err => console.log(err.message))

        
    if (sessionStorage.getItem('UserId') === null) {
      window.alert('Must Login First');
      this.router.navigate(['/']);
      }

    if (localStorage.getItem('UserId') === null) {
     this.router.navigate(['/']);
    }
  }

}
