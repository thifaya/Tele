import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-level-trends',
  templateUrl: './level-trends.component.html',
  styleUrls: ['./level-trends.component.css']
})
export class LevelTrendsComponent implements OnInit {

  constructor() { }

    formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate'];
    format = this.formats[0];

  ngOnInit() {
  }

}
