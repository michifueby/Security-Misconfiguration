import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LoginRegisterCardComponent } from './login-register-card.component';

describe('LoginRegisterCardComponent', () => {
  let component: LoginRegisterCardComponent;
  let fixture: ComponentFixture<LoginRegisterCardComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LoginRegisterCardComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(LoginRegisterCardComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
