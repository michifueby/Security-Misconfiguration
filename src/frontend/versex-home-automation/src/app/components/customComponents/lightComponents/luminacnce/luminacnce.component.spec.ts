import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LuminacnceComponent } from './luminacnce.component';

describe('LuminacnceComponent', () => {
  let component: LuminacnceComponent;
  let fixture: ComponentFixture<LuminacnceComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LuminacnceComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LuminacnceComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
