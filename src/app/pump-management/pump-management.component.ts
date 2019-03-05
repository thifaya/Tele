import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-pump-management',
  templateUrl: './pump-management.component.html',
  styleUrls: ['./pump-management.component.css']
})
export class PumpManagementComponent implements OnInit {

  constructor() { }

  pumpPath = '../assets/ImageView/waterTower.PNG';
  ngOnInit() {
  }

}
