import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MultiYearConsumedTrendsComponent } from './multi-year-consumed-trends.component';

describe('MultiYearConsumedTrendsComponent', () => {
  let component: MultiYearConsumedTrendsComponent;
  let fixture: ComponentFixture<MultiYearConsumedTrendsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MultiYearConsumedTrendsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MultiYearConsumedTrendsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
