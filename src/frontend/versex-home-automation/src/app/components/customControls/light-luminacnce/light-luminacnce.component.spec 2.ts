import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LightLuminacnceComponent } from './light-luminacnce.component';

describe('LightLuminacnceComponent', () => {
  let component: LightLuminacnceComponent;
  let fixture: ComponentFixture<LightLuminacnceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LightLuminacnceComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LightLuminacnceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
