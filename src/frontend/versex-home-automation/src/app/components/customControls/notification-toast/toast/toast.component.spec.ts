import { ComponentFixture, TestBed } from '@angular/core/testing';

<<<<<<<< HEAD:src/frontend/versex-home-automation/src/app/components/customComponents/lightComponents/luminacnce/luminacnce.component.spec.ts
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
========
import { ToastComponent } from './toast.component';

describe('ToastComponent', () => {
  let component: ToastComponent;
  let fixture: ComponentFixture<ToastComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ToastComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(ToastComponent);
>>>>>>>> origin/beta:src/frontend/versex-home-automation/src/app/components/customControls/notification-toast/toast/toast.component.spec.ts
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
