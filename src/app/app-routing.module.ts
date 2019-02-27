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
  }
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
  ComparisonMonthToMonthComponent
  ];
