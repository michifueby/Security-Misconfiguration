import { AfterViewInit, Component, EventEmitter, Input, Output } from '@angular/core';

@Component({
  selector: 'app-user-dropdown',
  templateUrl: './user-dropdown.component.html',
  styleUrls: ['./user-dropdown.component.scss']
})
export class UserDropdownComponent implements AfterViewInit{

  @Input() username = "<username>"
  @Output() onLogoutClicked = new EventEmitter();
  @Output() onEditClicked = new EventEmitter();


  isDropdownOpen = false;

  ngAfterViewInit(): void {

  }


  toggleDropdown() {
    this.isDropdownOpen = !this.isDropdownOpen;
  }

  logout() {
    this.onLogoutClicked.emit();
    console.log('Logout clicked');
  }

  edit() {
    this.onEditClicked.emit();
    console.log('edit clicked');
  }

}
