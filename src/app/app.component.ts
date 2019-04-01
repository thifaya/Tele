import { Component, OnInit, OnDestroy,  } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from '../app/Server/data.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {

  myname;

  name: string;

  constructor(private router: Router, private _service: DataService) {
   this.getUserData();
   this._service.currentData.subscribe(data => this.name = data);
   this._service.dataChanged(this.name);
  }

  getUserData() {
    if (localStorage.getItem('Name') != null) {
     JSON.parse(localStorage.getItem('userData'));
     this.myname = JSON.parse(localStorage.getItem('Name'));
    } else {
      return null;
    }
  }

  logOut() {
    if (window.confirm('Are You sure you want to logout?')) {
    this.router.navigate(['/']);
    localStorage.clear();
    }
  }

  // tslint:disable-next-line:use-life-cycle-interface
  ngOnInit() {
    console.log(name);
  }
  // tslint:disable-next-line:use-life-cycle-interface
  ngOnDestroy() {
    localStorage.clear();
  }

}
