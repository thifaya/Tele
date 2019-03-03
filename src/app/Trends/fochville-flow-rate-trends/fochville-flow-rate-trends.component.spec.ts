import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FochvilleFlowRateTrendsComponent } from './fochville-flow-rate-trends.component';

describe('FochvilleFlowRateTrendsComponent', () => {
  let component: FochvilleFlowRateTrendsComponent;
  let fixture: ComponentFixture<FochvilleFlowRateTrendsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FochvilleFlowRateTrendsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FochvilleFlowRateTrendsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
