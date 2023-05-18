import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TempControlComponent } from './temp-control.component';

describe('TempControlComponent', () => {
  let component: TempControlComponent;
  let fixture: ComponentFixture<TempControlComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TempControlComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(TempControlComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
