import {
  Component,
  OnInit,
  ViewEncapsulation,
} from '@angular/core';
import {
  FormControl,
  FormGroup,
  Validators,
} from '@angular/forms';
import { ActivatedRoute, Router } from '@angular/router';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { HideContentService } from 'src/app/services/hide-content/hide-content.service';
import { User } from 'src/app/models/user.model';
import { MatDialog } from '@angular/material/dialog';
import {MatSnackBar} from '@angular/material/snack-bar';
import { AuthenticationService } from 'src/app/services/authentication/authentication.service';

@Component({
  selector: 'app-login-register-card',
  templateUrl: './login-register-card.component.html',
  styleUrls: ['./login-register-card.component.scss'],
  encapsulation: ViewEncapsulation.Emulated,
})

export class LoginRegisterCardComponent implements OnInit {

  constructor(
    private _snackBar: MatSnackBar,
    private route: ActivatedRoute,
    private router: Router,
    private authenticationService: AuthenticationService,
    private tokenStorage: TokenStorageService,
    private dialog: MatDialog,
    private hideContentService: HideContentService
  ) {
    this.returnUrl = this.route.snapshot.queryParams['returnUrl'] || '/dashboard';

    if (this.tokenStorage.getUser() != null) {
      this.router.navigate(['/']);
    }
  }

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
      this.openSnackBar(
        'Login',
        'Enter a password and an username!',
        'errorSnackBar'
      );
      return;
    }
    this.authenticationService
      .login(this.loginForm.value.userName, this.loginForm.value.password)
      .subscribe({
        next: (value: User) => {
          this.tokenStorage.saveToken(value.token);
          this.tokenStorage.saveUser(value);
          this.router.navigate([this.returnUrl]);
          this.openSnackBar('Login', 'Login successful!', 'successSnackBar');
        },
        error: (err) => {
          this.openSnackBar(
            'Login',
            'Error to connecting to the server!',
            'errorSnackBar'
          );
        },
      });
  }

  // SnackBar for displaying messages
  openSnackBar(message: string, action: string, alertStyle: string) {
    this._snackBar.open(message, action, {
      duration: 5000,
      // Load specific style
      panelClass: [alertStyle],
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
