import { AfterViewInit, Component, EventEmitter, Input, Output } from '@angular/core';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';

@Component({
  selector: 'app-user-dropdown',
  templateUrl: './user-dropdown.component.html',
  styleUrls: ['./user-dropdown.component.scss']
})
export class UserDropdownComponent implements AfterViewInit{

  @Input() username = "<username>"
  @Output() onLogoutClicked = new EventEmitter();
  @Output() onEditClicked = new EventEmitter();

  constructor(public router: Router, public tokenStorage: TokenStorageService, private snackBar: MatSnackBar,) {

  }

  isDropdownOpen = false;

  ngAfterViewInit(): void {

  }

  toggleDropdown() {
    this.isDropdownOpen = !this.isDropdownOpen;
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
      this.router.navigateByUrl('login');
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
