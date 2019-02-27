import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

// import {RouterModule, Routes} from '@angular/router';
import { ChartModule } from 'angular2-highcharts';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatCardModule } from '@angular/material';
import { MatToolbarModule } from '@angular/material/toolbar';
// import { MatRippleModule } from '@angular/material';


import { AppRoutingModule, routingComponents } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './login/login.component';
import { ComparisonMonthToMonthComponent } from './Comparison/comparison-month-to-month/comparison-month-to-month.component';
import { ComparisonYearToYearComponent } from './Comparison/comparison-year-to-year/comparison-year-to-year.component';
import { CarltonvilleDashboardComponent } from './Dashboard/carltonville-dashboard/carltonville-dashboard.component';
import { FochvilleDashboardComponent } from './Dashboard/fochville-dashboard/fochville-dashboard.component';
import { InvoiceForecastComponent } from './Finances/invoice-forecast/invoice-forecast.component';
import { ContactInfoComponent } from './Enquiries/contact-info/contact-info.component';
import { UserManualComponent } from './Enquiries/user-manual/user-manual.component';

declare var require: any;

@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    ComparisonMonthToMonthComponent,
    ComparisonYearToYearComponent,
    routingComponents,
    CarltonvilleDashboardComponent,
    FochvilleDashboardComponent,
    InvoiceForecastComponent,
    ContactInfoComponent,
    UserManualComponent

  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    BrowserAnimationsModule,
    MatCardModule,
    MatToolbarModule
  //  ChartModule.forRoot(require('highcharts')),
    // MdToolbarModule
  ],
  exports: [
    MatToolbarModule,
    MatCardModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule {

}
platformBrowserDynamic().bootstrapModule(AppModule);




