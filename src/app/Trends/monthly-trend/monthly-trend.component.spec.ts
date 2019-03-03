import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MonthlyTrendComponent } from './monthly-trend.component';

describe('MonthlyTrendComponent', () => {
  let component: MonthlyTrendComponent;
  let fixture: ComponentFixture<MonthlyTrendComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MonthlyTrendComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MonthlyTrendComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
