import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AggregateReceivedWaterComponent } from './aggregate-received-water.component';

describe('AggregateReceivedWaterComponent', () => {
  let component: AggregateReceivedWaterComponent;
  let fixture: ComponentFixture<AggregateReceivedWaterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AggregateReceivedWaterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AggregateReceivedWaterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
