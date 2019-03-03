import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MultiYearReceivedTrendsComponent } from './multi-year-received-trends.component';

describe('MultiYearReceivedTrendsComponent', () => {
  let component: MultiYearReceivedTrendsComponent;
  let fixture: ComponentFixture<MultiYearReceivedTrendsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MultiYearReceivedTrendsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MultiYearReceivedTrendsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
