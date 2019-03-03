import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ZonalWaterConsumptionComponent } from './zonal-water-consumption.component';

describe('ZonalWaterConsumptionComponent', () => {
  let component: ZonalWaterConsumptionComponent;
  let fixture: ComponentFixture<ZonalWaterConsumptionComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ZonalWaterConsumptionComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ZonalWaterConsumptionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
