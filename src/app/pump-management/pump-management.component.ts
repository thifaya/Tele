import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';



@Component({
  selector: 'app-pump-management',
  templateUrl: './pump-management.component.html',
  styleUrls: ['./pump-management.component.css']
})
export class PumpManagementComponent implements OnInit {

  constructor(private router: Router) { }

  pumpPath = '../assets/ImageView/waterTower.PNG';
  ngOnInit() {
    if (localStorage.getItem('UserId') === null) {
  this.router.navigate(['/']);
}
  }

}
