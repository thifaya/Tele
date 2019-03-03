import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VolumeTrendsReceivedComponent } from './volume-trends-received.component';

describe('VolumeTrendsReceivedComponent', () => {
  let component: VolumeTrendsReceivedComponent;
  let fixture: ComponentFixture<VolumeTrendsReceivedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VolumeTrendsReceivedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VolumeTrendsReceivedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
