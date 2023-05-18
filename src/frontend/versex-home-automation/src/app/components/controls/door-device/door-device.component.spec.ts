import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DoorDeviceComponent } from './door-device.component';

describe('DoorDeviceComponent', () => {
  let component: DoorDeviceComponent;
  let fixture: ComponentFixture<DoorDeviceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DoorDeviceComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(DoorDeviceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
