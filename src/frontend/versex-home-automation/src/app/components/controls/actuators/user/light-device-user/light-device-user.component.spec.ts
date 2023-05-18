import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LightDeviceUserComponent } from './light-device-user.component';

describe('LightDeviceUserComponent', () => {
  let component: LightDeviceUserComponent;
  let fixture: ComponentFixture<LightDeviceUserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LightDeviceUserComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LightDeviceUserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
