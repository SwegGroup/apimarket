import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewApiComponent } from './viewApi.component';

describe('ViewApiComponent', () => {
  let component: ViewApiComponent;
  let fixture: ComponentFixture<ViewApiComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ViewApiComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ViewApiComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
