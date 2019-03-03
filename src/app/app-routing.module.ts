import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { FochvilleDashboardComponent } from './Dashboard/fochville-dashboard/fochville-dashboard.component';
import { CarltonvilleDashboardComponent } from './Dashboard/carltonville-dashboard/carltonville-dashboard.component';
import { LoginComponent } from './login/login.component';
import { ComparisonYearToYearComponent } from './Comparison/comparison-year-to-year/comparison-year-to-year.component';
import { ComparisonMonthToMonthComponent } from './Comparison/comparison-month-to-month/comparison-month-to-month.component';
import { InvoiceForecastComponent } from './Finances/invoice-forecast/invoice-forecast.component';
import { ContactInfoComponent } from './Enquiries/contact-info/contact-info.component';
import { UserManualComponent } from './Enquiries/user-manual/user-manual.component';
import { LevelTrendsComponent } from './DailyTrends/level-trends/level-trends.component';
import { VolumeTrendsConsumedComponent } from './DailyTrends/volume-trends-consumed/volume-trends-consumed.component';
import { VolumeTrendsReceivedComponent } from './DailyTrends/volume-trends-received/volume-trends-received.component';
import { MonthlyTrendComponent } from './Trends/monthly-trend/monthly-trend.component';
import { CarltonvilleFlowRateTrendsComponent } from './Trends/carltonville-flow-rate-trends/carltonville-flow-rate-trends.component';
import { FochvilleFlowRateTrendsComponent } from './Trends/fochville-flow-rate-trends/fochville-flow-rate-trends.component';
import { NightFlowTrendComponent } from './Trends/night-flow-trend/night-flow-trend.component';
import { AlarmsComponent } from './Alarms/alarms/alarms.component';
import { AlarmStatisticsComponent } from './Alarms/alarm-statistics/alarm-statistics.component';
import { UserComponent } from './Maintenance/user/user.component';
import { HeartbeatComponent } from './Maintenance/heartbeat/heartbeat.component';
import { ZonalVarianceComponent } from './Zoning/zonal-variance/zonal-variance.component';
import { ZonalWaterConsumptionComponent } from './Zoning/zonal-water-consumption/zonal-water-consumption.component';
import { ZonalWaterDistributionComponent } from './Zoning/zonal-water-distribution/zonal-water-distribution.component';
import { PumpManagementComponent } from './pump-management/pump-management.component';
import { AggregateConsumedWaterComponent } from './Water-Usage-Analysis/aggregate-consumed-water/aggregate-consumed-water.component';
import { AggregateReceivedWaterComponent } from './Water-Usage-Analysis/aggregate-received-water/aggregate-received-water.component';
import { MultiYearConsumedTrendsComponent } from './Water-Usage-Analysis/multi-year-consumed-trends/multi-year-consumed-trends.component';
import { MultiYearReceivedTrendsComponent } from './Water-Usage-Analysis/multi-year-received-trends/multi-year-received-trends.component';
import { YearlyWaterConsumedComponent } from './Water-Usage-Analysis/yearly-water-consumed/yearly-water-consumed.component';
import { YearlyWaterReceivedComponent } from './Water-Usage-Analysis/yearly-water-received/yearly-water-received.component';

// ROUTING...
const routes: Routes = [
  {
    path: 'dashboard',
    component: FochvilleDashboardComponent
  },

  {
    path: '',
    component: LoginComponent
  },

  {
    path: 'carltonville',
    component: CarltonvilleDashboardComponent
  },

  {
  path: 'comparisonyeartoyear',
  component: ComparisonYearToYearComponent
  },

  {
    path: 'comparisonmonthtomonth',
    component: ComparisonMonthToMonthComponent
  },

  {
    path: 'invoiceforecast',
    component: InvoiceForecastComponent
  },

  {
    path: 'contactinfo',
    component: ContactInfoComponent
  },

  {
    path: 'usermanual',
    component: UserManualComponent
  },
/////////
  {
    path: 'leveltrends',
    component: LevelTrendsComponent
  },

  {
    path: 'volumetrendsreceived',
    component: VolumeTrendsReceivedComponent
  },

  {
    path: 'volumetrendsconsumed',
    component: VolumeTrendsConsumedComponent
  },
////////
  {
    path: 'monthlytrends',
    component: MonthlyTrendComponent
  },

  {
    path: 'carltonvilleflowratetrends',
    component: CarltonvilleFlowRateTrendsComponent
  },

  {
    path: 'fochvilleflowratetrends',
    component: FochvilleFlowRateTrendsComponent
  },

  {
    path: 'nightflowtrend',
    component: NightFlowTrendComponent
  },
////////
  {
    path: 'user',
    component: UserComponent
  },

  {
    path: 'heartbeat',
    component: HeartbeatComponent
  },
//////
  {
    path: 'alarms',
    component: AlarmsComponent
  },

  {
    path: 'alarmstatistics',
    component: AlarmStatisticsComponent
  },
///////
  {
    path: 'zonalvariance',
    component: ZonalVarianceComponent
  },

  {
    path: 'zonalwaterdistribution',
    component: ZonalWaterDistributionComponent
  },

  {
    path: 'zonalwaterconsumption',
    component: ZonalWaterConsumptionComponent
  },
////////
  {
    path: 'aggregatereceivedwater',
    component: AggregateReceivedWaterComponent
  },

  {
    path: 'aggregateconsumedwater',
    component: AggregateConsumedWaterComponent
  },

  {
    path: 'multiyearconsumedwater',
    component: MultiYearConsumedTrendsComponent
  },

  {
    path: 'multiyearreceivedwater',
    component:  MultiYearReceivedTrendsComponent
  },

  {
    path: 'yearlywaterreceived',
    component: YearlyWaterReceivedComponent
  },

  {
    path: 'yearlywaterconsumed',
    component: YearlyWaterConsumedComponent
  },

  {
    path: 'pumpmanagement',
    component: PumpManagementComponent
  },

];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
// Exporting components
export const routingComponents = [
  LoginComponent,
  FochvilleDashboardComponent,
  CarltonvilleDashboardComponent,
  ComparisonYearToYearComponent,
  ComparisonMonthToMonthComponent,
  LevelTrendsComponent,
  VolumeTrendsConsumedComponent,
  VolumeTrendsReceivedComponent,
  MonthlyTrendComponent,
  CarltonvilleFlowRateTrendsComponent,
  FochvilleFlowRateTrendsComponent,
  NightFlowTrendComponent,
  AlarmsComponent,
  AlarmStatisticsComponent,
  UserComponent,
  HeartbeatComponent,
  ZonalVarianceComponent,
  ZonalWaterConsumptionComponent,
  ZonalWaterDistributionComponent,
  PumpManagementComponent,
  AggregateConsumedWaterComponent,
  AggregateReceivedWaterComponent,
  MultiYearConsumedTrendsComponent,
  MultiYearReceivedTrendsComponent,
  YearlyWaterConsumedComponent,
  YearlyWaterReceivedComponent
  ];
