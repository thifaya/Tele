import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { VolumeTrendsConsumedComponent } from './volume-trends-consumed.component';

describe('VolumeTrendsConsumedComponent', () => {
  let component: VolumeTrendsConsumedComponent;
  let fixture: ComponentFixture<VolumeTrendsConsumedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ VolumeTrendsConsumedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(VolumeTrendsConsumedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
