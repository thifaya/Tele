import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { YearlyWaterConsumedComponent } from './yearly-water-consumed.component';

describe('YearlyWaterConsumedComponent', () => {
  let component: YearlyWaterConsumedComponent;
  let fixture: ComponentFixture<YearlyWaterConsumedComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ YearlyWaterConsumedComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(YearlyWaterConsumedComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
