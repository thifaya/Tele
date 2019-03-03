import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ZonalWaterDistributionComponent } from './zonal-water-distribution.component';

describe('ZonalWaterDistributionComponent', () => {
  let component: ZonalWaterDistributionComponent;
  let fixture: ComponentFixture<ZonalWaterDistributionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ZonalWaterDistributionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ZonalWaterDistributionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
