import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LightDeviceComponent } from './light-device.component';

describe('LightDeviceComponent', () => {
  let component: LightDeviceComponent;
  let fixture: ComponentFixture<LightDeviceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LightDeviceComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LightDeviceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
