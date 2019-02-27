import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ComparisonYearToYearComponent } from './comparison-year-to-year.component';

describe('ComparisonYearToYearComponent', () => {
  let component: ComparisonYearToYearComponent;
  let fixture: ComponentFixture<ComparisonYearToYearComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ComparisonYearToYearComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ComparisonYearToYearComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
