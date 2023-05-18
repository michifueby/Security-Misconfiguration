import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AcDeviceComponent } from './ac-device.component';

describe('AcDeviceComponent', () => {
  let component: AcDeviceComponent;
  let fixture: ComponentFixture<AcDeviceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AcDeviceComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(AcDeviceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
