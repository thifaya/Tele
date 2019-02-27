import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { CarltonvilleDashboardComponent } from './carltonville-dashboard.component';

describe('CarltonvilleDashboardComponent', () => {
  let component: CarltonvilleDashboardComponent;
  let fixture: ComponentFixture<CarltonvilleDashboardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ CarltonvilleDashboardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(CarltonvilleDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
