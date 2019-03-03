import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { YearlyWaterReceivedComponent } from './yearly-water-received.component';

describe('YearlyWaterReceivedComponent', () => {
  let component: YearlyWaterReceivedComponent;
  let fixture: ComponentFixture<YearlyWaterReceivedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ YearlyWaterReceivedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(YearlyWaterReceivedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
