import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { FochvilleDashboardComponent } from './fochville-dashboard.component';

describe('FochvilleDashboardComponent', () => {
  let component: FochvilleDashboardComponent;
  let fixture: ComponentFixture<FochvilleDashboardComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ FochvilleDashboardComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(FochvilleDashboardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
