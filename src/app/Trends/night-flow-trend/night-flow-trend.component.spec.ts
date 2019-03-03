import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { NightFlowTrendComponent } from './night-flow-trend.component';

describe('NightFlowTrendComponent', () => {
  let component: NightFlowTrendComponent;
  let fixture: ComponentFixture<NightFlowTrendComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ NightFlowTrendComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(NightFlowTrendComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
