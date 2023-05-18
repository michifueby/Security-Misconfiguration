import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { UserService } from 'src/app/services/user/user.service';
import { ToastComponent } from 'src/app/components/customControls/notification-toast/toast/toast.component';

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
      console.log('You are already logged out!');
    } else {
      this.tokenStorage.signOut();
      console.log('Logout successful!');
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
