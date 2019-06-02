import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Server/data.service';



@Component({
  selector: 'app-heartbeat',
  templateUrl: './heartbeat.component.html',
  styleUrls: ['./heartbeat.component.css']
})
export class HeartbeatComponent implements OnInit {

  results;
  Status; status_value;
  row; i: number
  heartbeats = {};
  

  constructor(private router: Router, private _dataService: DataService) { }
  heartbeatPath: any = '../assets/ImageView/heartbeat.PNG';
  legendPath: any;
  ngOnInit() {
    this.legendPath = '../assets/ImageView/false.PNG'
    this._dataService.getHeartbeat()
      .subscribe(res => {
        this.results = res

        if ( this.results.length > 0 ) {
          // finishing heart beat table

        } else {

        }
      },
        err => console.log(err))

    if (localStorage.getItem('userData') === null) {
      //  this.router.navigate(['/']);
    }
    if (sessionStorage.getItem('userData') === null) {
      //  this.router.navigate(['/']);
    }

  }

  show() {
    console.log('on SHOW');
  }

  test(index, status) {
    this.row = index;
    if (status == true){
      this.legendPath = '../assets/ImageView/true.PNG'
    } else {
      this.legendPath = '../assets/ImageView/false.PNG'
    }
  }


}
