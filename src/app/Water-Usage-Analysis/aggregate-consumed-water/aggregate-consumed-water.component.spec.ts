import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AggregateConsumedWaterComponent } from './aggregate-consumed-water.component';

describe('AggregateConsumedWaterComponent', () => {
  let component: AggregateConsumedWaterComponent;
  let fixture: ComponentFixture<AggregateConsumedWaterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AggregateConsumedWaterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AggregateConsumedWaterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
