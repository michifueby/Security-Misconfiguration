import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MacInputComponent } from './mac-input.component';

describe('MacInputComponent', () => {
  let component: MacInputComponent;
  let fixture: ComponentFixture<MacInputComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MacInputComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(MacInputComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
