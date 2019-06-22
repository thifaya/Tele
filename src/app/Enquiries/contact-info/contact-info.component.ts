import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'app-contact-info',
  templateUrl: './contact-info.component.html',
  styleUrls: ['./contact-info.component.css']
})
export class ContactInfoComponent implements OnInit {

  constructor(private router: Router) { }

  ngOnInit() {
    if (sessionStorage.getItem('UserId') === null) {
     // window.alert('Must Login First');
     // this.router.navigate(['/']);
      }

    if (localStorage.getItem('UserId') === null) {
      this.router.navigate(['/']);
    }
  }

}
