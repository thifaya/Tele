import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ComparisonMonthToMonthComponent } from './comparison-month-to-month.component';

describe('ComparisonMonthToMonthComponent', () => {
  let component: ComparisonMonthToMonthComponent;
  let fixture: ComponentFixture<ComparisonMonthToMonthComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ComparisonMonthToMonthComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ComparisonMonthToMonthComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
