import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AcDeviceUserComponent } from './ac-device-user.component';

describe('AcDeviceUserComponent', () => {
  let component: AcDeviceUserComponent;
  let fixture: ComponentFixture<AcDeviceUserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AcDeviceUserComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AcDeviceUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
