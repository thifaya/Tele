import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import {RouterModule, Routes} from '@angular/router';
import { ChartModule } from 'angular2-highcharts';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';


import { AppRoutingModule, routingComponents } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { ComparisonMonthToMonthComponent } from './Comparison/comparison-month-to-month/comparison-month-to-month.component';
import { ComparisonYearToYearComponent } from './Comparison/comparison-year-to-year/comparison-year-to-year.component';
import { CarltonvilleDashboardComponent } from './Dashboard/carltonville-dashboard/carltonville-dashboard.component';
import { FochvilleDashboardComponent } from './Dashboard/fochville-dashboard/fochville-dashboard.component';

declare var require: any;

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    ComparisonMonthToMonthComponent,
    ComparisonYearToYearComponent,
    routingComponents,
    CarltonvilleDashboardComponent,
    FochvilleDashboardComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
  //  ChartModule.forRoot(require('highcharts')),
    // MdToolbarModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {

}
platformBrowserDynamic().bootstrapModule(AppModule);




