import { Component, OnInit } from '@angular/core';
import { DataService } from 'src/app/Server/data.service';
import { HttpHeaders } from '@angular/common/http';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  public users: object = [];
  public titles: object = [];
  public designations: object = [];
  public sites: object = [];

  setHeader = new HttpHeaders({
    'Content-Type': 'application/x-www-urlencoded;charset=utf-8;',
});


  constructor(private _dataService: DataService) { }

  ngOnInit() {
  this._dataService.getUsers()
    .subscribe(data => this.users =  data );
 }

  datatest() {
    console.log(this.users);
    console.log(this.titles);
    console.log( this.designations);
    console.log(this.sites);
  }

}
