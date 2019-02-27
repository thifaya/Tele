import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { InvoiceForecastComponent } from './invoice-forecast.component';

describe('InvoiceForecastComponent', () => {
  let component: InvoiceForecastComponent;
  let fixture: ComponentFixture<InvoiceForecastComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ InvoiceForecastComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(InvoiceForecastComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
