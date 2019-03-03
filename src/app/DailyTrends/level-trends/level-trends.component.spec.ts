import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { LevelTrendsComponent } from './level-trends.component';

describe('LevelTrendsComponent', () => {
  let component: LevelTrendsComponent;
  let fixture: ComponentFixture<LevelTrendsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ LevelTrendsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(LevelTrendsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
