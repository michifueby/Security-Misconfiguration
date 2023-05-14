import { Component } from '@angular/core';
import { MenuItem, MessageService } from 'primeng/api';
import { Router } from '@angular/router';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import {MatSnackBar} from '@angular/material/snack-bar';
import { HideContentService } from 'src/app/services/hide-content/hide-content.service';

@Component({
  selector: 'app-avatar',
  templateUrl: './avatar.component.html',
  styleUrls: ['./avatar.component.scss'],
  providers: [MessageService]
})
export class AvatarComponent {

  constructor(
    private router: Router,
    private tokenStorage: TokenStorageService,
    private _snackBar: MatSnackBar,
    public hideContentService: HideContentService
  ) {
    this.avatarMenuItems = [];
  }

  public avatarMenuItems: MenuItem[];

  ngOnInit() {
    this.avatarMenuItems = [
        {
            icon: 'pi pi-user-edit',
            command: () => {
            },
            tooltipOptions: {
              tooltipLabel: 'Edit User'
            },
        },
        {
            icon: 'pi pi-arrow-circle-right',
            command: () => {
              this.logout();
            },
            tooltipOptions: {
              tooltipLabel: 'Logout'
            },
        }
    ];
  }

  public logout(): void {
    if (this.tokenStorage.getToken() === null) {
      this.openSnackBar("Logout", 'You are already logged out!', 'successSnackBar');
    }
    else {
      this.tokenStorage.signOut();
      this.router.navigateByUrl('login');
      this.openSnackBar("Logout", 'Logout successful!', 'successSnackBar');
    }
  }

  // SnackBar for displaying messages
  openSnackBar(message: string, action: string, alertStyle: string) {
    this._snackBar.open(message, action, {
        duration: 5000,
        // Load specific style
        panelClass: [alertStyle]
    });
  }
}
