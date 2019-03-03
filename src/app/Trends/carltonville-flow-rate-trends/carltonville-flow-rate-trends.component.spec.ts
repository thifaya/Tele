import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CarltonvilleFlowRateTrendsComponent } from './carltonville-flow-rate-trends.component';

describe('CarltonvilleFlowRateTrendsComponent', () => {
  let component: CarltonvilleFlowRateTrendsComponent;
  let fixture: ComponentFixture<CarltonvilleFlowRateTrendsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CarltonvilleFlowRateTrendsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CarltonvilleFlowRateTrendsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
