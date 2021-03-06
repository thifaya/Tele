import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import { FormsModule } from '@angular/forms';

import { CookieService } from 'ngx-cookie-service';
import { DataService } from './Service/data.service';
import { HttpClientModule } from '@angular/common/http';
import { RouterModule, Routes } from '@angular/router';
import { ChartModule } from 'angular-highcharts';
import { HighchartsChartModule } from 'highcharts-angular';
//import { HighchartsChartComponent } from 'angular-highcharts';
import { platformBrowserDynamic } from '@angular/platform-browser-dynamic';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import {
  MatAutocompleteModule,
  MatBadgeModule,
  MatBottomSheetModule,
  MatButtonModule,
  MatButtonToggleModule,
  MatCardModule,
  MatCheckboxModule,
  MatChipsModule,
  MatDatepickerModule,
  MatDialogModule,
  MatDividerModule,
  MatExpansionModule,
  MatFormFieldModule,
  MatGridListModule,
  MatIconModule,
  MatInputModule,
  MatListModule,
  MatMenuModule,
  MatNativeDateModule,
  MatPaginatorModule,
  MatProgressBarModule,
  MatProgressSpinnerModule,
  MatRadioModule,
  MatRippleModule,
  MatSelectModule,
  MatSidenavModule,
  MatSliderModule,
  MatSlideToggleModule,
  MatSnackBarModule,
  MatSortModule,
  MatStepperModule,
  MatTableModule,
  MatTabsModule,
  MatToolbarModule,
  MatTooltipModule,
  MatTreeModule,
} from '@angular/material';


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
import { NavBarComponent } from './nav-bar/nav-bar.component';
import { MonthlyTrendComponent } from './Trends/monthly-trend/monthly-trend.component';
import { NightFlowTrendComponent } from './Trends/night-flow-trend/night-flow-trend.component';
import { LevelTrendsComponent } from './DailyTrends/level-trends/level-trends.component';
import { VolumeTrendsReceivedComponent } from './DailyTrends/volume-trends-received/volume-trends-received.component';
import { VolumeTrendsConsumedComponent } from './DailyTrends/volume-trends-consumed/volume-trends-consumed.component';
import { AlarmsComponent } from './Alarms/alarms/alarms.component';
import { AlarmStatisticsComponent } from './Alarms/alarm-statistics/alarm-statistics.component';
import { UserComponent } from './Maintenance/user/user.component';
import { ZonalVarianceComponent } from './Zoning/zonal-variance/zonal-variance.component';
import { HeartbeatComponent } from './Maintenance/heartbeat/heartbeat.component';
import { ZonalWaterDistributionComponent } from './Zoning/zonal-water-distribution/zonal-water-distribution.component';
import { ZonalWaterConsumptionComponent } from './Zoning/zonal-water-consumption/zonal-water-consumption.component';
import { AggregateConsumedWaterComponent } from './Water-Usage-Analysis/aggregate-consumed-water/aggregate-consumed-water.component';
import { MultiYearReceivedTrendsComponent } from './Water-Usage-Analysis/multi-year-received-trends/multi-year-received-trends.component';
import { MultiYearConsumedTrendsComponent } from './Water-Usage-Analysis/multi-year-consumed-trends/multi-year-consumed-trends.component';
import { YearlyWaterReceivedComponent } from './Water-Usage-Analysis/yearly-water-received/yearly-water-received.component';
import { YearlyWaterConsumedComponent } from './Water-Usage-Analysis/yearly-water-consumed/yearly-water-consumed.component';
import { CarltonvilleFlowRateTrendsComponent } from './Trends/carltonville-flow-rate-trends/carltonville-flow-rate-trends.component';
import { FochvilleFlowRateTrendsComponent } from './Trends/fochville-flow-rate-trends/fochville-flow-rate-trends.component';
import { PumpManagementComponent } from './pump-management/pump-management.component';
import { PageNotFoundComponent } from './404-Error/page-not-found/page-not-found.component';

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
    UserManualComponent,
    NavBarComponent,
    MonthlyTrendComponent,
    NightFlowTrendComponent,
    LevelTrendsComponent,
    VolumeTrendsReceivedComponent,
    VolumeTrendsConsumedComponent,
    AlarmsComponent,
    AlarmStatisticsComponent,
    UserComponent,
    ZonalVarianceComponent,
    HeartbeatComponent,
    ZonalWaterDistributionComponent,
    ZonalWaterConsumptionComponent,
    AggregateConsumedWaterComponent,
    MultiYearReceivedTrendsComponent,
    MultiYearConsumedTrendsComponent,
    YearlyWaterReceivedComponent,
    YearlyWaterConsumedComponent,
    CarltonvilleFlowRateTrendsComponent,
    FochvilleFlowRateTrendsComponent,
    PumpManagementComponent,
    //HighchartsChartComponent,
    PageNotFoundComponent

  ],
  imports: [
    BrowserModule,
    FormsModule,
    HighchartsChartModule,
    AppRoutingModule,
    HttpClientModule,
    BrowserAnimationsModule,
    ChartModule,
    MatAutocompleteModule,
    MatBadgeModule,
    MatBottomSheetModule,
    MatButtonModule,
    MatButtonToggleModule,
    MatCardModule,
    MatCheckboxModule,
    MatChipsModule,
    MatDatepickerModule,
    MatDialogModule,
    MatDividerModule,
    MatExpansionModule,
    MatFormFieldModule,
    MatGridListModule,
    MatIconModule,
    MatInputModule,
    MatListModule,
    MatMenuModule,
    MatNativeDateModule,
    MatPaginatorModule,
    MatProgressBarModule,
    MatProgressSpinnerModule,
    MatRadioModule,
    MatRippleModule,
    MatSelectModule,
    MatSidenavModule,
    MatSliderModule,
    MatSlideToggleModule,
    MatSnackBarModule,
    MatSortModule,
    MatStepperModule,
    MatTableModule,
    MatTabsModule,
    MatToolbarModule,
    MatTooltipModule,
    MatTreeModule,
    RouterModule
  ],
  exports: [
    MatCardModule,
    MatToolbarModule
  ],
  providers: [DataService, CookieService],
  bootstrap: [AppComponent]
})
export class AppModule {

}
platformBrowserDynamic().bootstrapModule(AppModule);




