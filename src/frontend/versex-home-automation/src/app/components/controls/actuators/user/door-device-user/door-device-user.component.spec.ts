import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DoorDeviceUserComponent } from './door-device-user.component';

describe('DoorDeviceUserComponent', () => {
  let component: DoorDeviceUserComponent;
  let fixture: ComponentFixture<DoorDeviceUserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DoorDeviceUserComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DoorDeviceUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
