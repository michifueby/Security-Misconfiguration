import { AfterViewInit, Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { UserService } from 'src/app/services/user/user.service';

@Component({
  selector: 'app-user-dropdown',
  templateUrl: './user-dropdown.component.html',
  styleUrls: ['./user-dropdown.component.scss']
})
export class UserDropdownComponent implements OnInit{

  @Input() username = "<username>"
  @Output() onLogoutClicked = new EventEmitter();
  @Output() onEditClicked = new EventEmitter();

  constructor(public router: Router, public tokenStorage: TokenStorageService, private snackBar: MatSnackBar, public userService: UserService) {
  }

  isDropdownOpen = false;

  public ngOnInit(): void {
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
      this.openSnackBar(
        'Logout',
        'You are already logged out!',
        'successSnackBar'
      );
    } else {
      this.tokenStorage.signOut();
      this.router.navigateByUrl('');
      this.openSnackBar('Logout', 'Logout successful!', 'successSnackBar');
    }
    console.log('Logout clicked');
  }

  edit() {
    //this.onEditClicked.emit();
    this.router.navigateByUrl('users');
    console.log('edit clicked');
  }

  // SnackBar for displaying messages
  openSnackBar(message: string, action: string, alertStyle: string) {
    this.snackBar.open(message, action, {
      duration: 5000,
      // Load specific style
      panelClass: [alertStyle],
    });
  }

}
