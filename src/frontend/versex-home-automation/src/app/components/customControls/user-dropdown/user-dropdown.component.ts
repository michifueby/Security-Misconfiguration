import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { UserService } from 'src/app/services/user/user.service';
import { ToastComponent } from '../notification-toast/toast/toast.component';

@Component({
  selector: 'app-user-dropdown',
  templateUrl: './user-dropdown.component.html',
  styleUrls: ['./user-dropdown.component.scss'],
})
export class UserDropdownComponent implements OnInit {
  private toast!: ToastComponent;

  @Input() username = '<username>';
  @Output() onLogoutClicked = new EventEmitter();
  @Output() onEditClicked = new EventEmitter();

  constructor(
    public router: Router,
    public tokenStorage: TokenStorageService,
    public userService: UserService
  ) {
  }

  public toastText!: string;

  isDropdownOpen = false;

  public ngOnInit(): void {
    this.toast = new ToastComponent();

    if (this.tokenStorage.getUser().userId !== 1)
      this.router.navigateByUrl('dashboard');
  }

  toggleDropdown() {
    this.isDropdownOpen = !this.isDropdownOpen;
  }

  public getFirstAndSecondNameFromUser(): string {
    return this.tokenStorage.getUser().userName;
  }

  logout() {
    //this.onLogoutClicked.emit();
    if (this.tokenStorage.getToken() === null) {
      this.toastText = 'You are already logged out!';
      this.toast.showToast();
    } else {
      this.tokenStorage.signOut();
      this.toastText = 'Logout successful!!';
      this.toast.showToast();
      this.router.navigateByUrl('');
    }
    console.log('Logout clicked');
  }

  edit() {
    //this.onEditClicked.emit();
    this.router.navigateByUrl('users');
    console.log('edit clicked');
  }
}
