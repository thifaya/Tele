import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ZonalVarianceComponent } from './zonal-variance.component';

describe('ZonalVarianceComponent', () => {
  let component: ZonalVarianceComponent;
  let fixture: ComponentFixture<ZonalVarianceComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ZonalVarianceComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ZonalVarianceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
