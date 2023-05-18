import { Component, OnInit, ViewEncapsulation } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { User } from 'src/app/models/user.model';
import { MatDialog } from '@angular/material/dialog';
import { AuthenticationService } from 'src/app/services/authentication/authentication.service';
import { ToastComponent } from '../customControls/notification-toast/toast/toast.component';

@Component({
  selector: 'app-login-card',
  templateUrl: './login-card.component.html',
  styleUrls: ['./login-card.component.scss'],
  encapsulation: ViewEncapsulation.None,
})
export class LoginCardComponent implements OnInit {
  private toast!: ToastComponent;

  constructor(
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthenticationService,
    private tokenStorage: TokenStorageService,
    private dialog: MatDialog
  ) {
    this.toast = new ToastComponent();

    this.returnUrl =
      this.route.snapshot.queryParams['returnUrl'] || '/dashboard';

    if (this.tokenStorage.getUser() != null) {
      this.router.navigate(['/']);
    }
  }

  public toastText!: string;

  loginForm!: FormGroup;

  isVisible: boolean = true;

  hide = true;

  returnUrl: string;

  ngOnInit(): void {
    this.loginForm = new FormGroup({
      userName: new FormControl('', [Validators.required]),
      password: new FormControl('', [Validators.required]),
    });
  }

  onSubmitLogin() {
    // Check if username or password null
    if (this.loginForm.invalid) {
      this.toastText = 'Enter a password and an username!';
      this.toast.showToast();
      return;
    }
    this.authenticationService
      .login(this.loginForm.value.userName, this.loginForm.value.password)
      .subscribe({
        next: (value: User) => {
          this.tokenStorage.saveToken(value.token);
          this.tokenStorage.saveUser(value);
          this.router.navigate([this.returnUrl]);
          this.toastText = 'Login successful!';
          this.toast.showToast();
        },
        error: (err) => {
          this.toastText = 'Invalid username or password!';
          this.toast.showToast();
        },
      });
  }

  togglePasswordVisibility() {
    if (!this.isVisible) {
      this.isVisible = true;
      document
        .getElementById('inputPassword')!
        .setAttribute('type', 'password');
      return;
    }

    if (this.isVisible) {
      this.isVisible = false;
      document.getElementById('inputPassword')!.setAttribute('type', 'text');
      return;
    }
  }
}
