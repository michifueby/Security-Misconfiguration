import { Component } from '@angular/core';
import { MenuItem, MessageService } from 'primeng/api';

@Component({
  selector: 'app-avatar',
  templateUrl: './avatar.component.html',
  styleUrls: ['./avatar.component.scss'],
  providers: [MessageService]
})
export class AvatarComponent {

  constructor() {
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
            },
            tooltipOptions: {
              tooltipLabel: 'Logout'
            },
        }
    ];
  }
}
