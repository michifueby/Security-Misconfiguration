import { Component, ViewEncapsulation } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { Router } from '@angular/router';
import { CreateUserComponent } from 'src/app/components/create-user/create-user.component';
import { ToastComponent } from 'src/app/components/customControls/notification-toast/toast/toast.component';
import { EditUserComponent } from 'src/app/components/edit-user/edit-user.component';
import { ResetPasswordComponent } from 'src/app/components/reset-password/reset-password.component';
import { User } from 'src/app/models/user.model';
import { UserData } from 'src/app/models/userData.model';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { UserService } from 'src/app/services/user/user.service';

@Component({
  selector: 'app-users',
  templateUrl: './users.component.html',
  styleUrls: ['./users.component.scss'],
})
export class UsersComponent {
  public displayedColumns: string[] = [
    'userId',
    'userName',
    'firstName',
    'lastName',
    'roles',
    'edit',
  ];

  public dataSource!: Array<User>;

  public toastText!: string;

  constructor(
    private tokenService: TokenStorageService,
    private userService: UserService,
    private router: Router,
    public dialog: MatDialog,
    public tokenStorage: TokenStorageService
  ) {
  }

  private toast!: ToastComponent;

  ngOnInit(): void {
    this.toast = new ToastComponent();

    if (!this.tokenService.getUser()) {
      this.router.navigate(['']);
    }

    if (this.tokenService.getUser().roleId !== 1) {
      this.router.navigate(['']);
    }

    this.getAllUser();
  }

  public getFirstAndSecondNameFromUser(): string {
    let user = this.tokenStorage.getUser();

    return user.userName;
  }

  openEditDialog(
    userId: number,
    userName: string,
    email: string,
    firstName: string,
    lastName: string,
    roles: number
  ): void {
    const dialogRef = this.dialog.open(EditUserComponent, {
      width: '25em',
      data: { userId, userName, email, firstName, lastName, roles },
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result !== undefined) {
        if (result == 'delete') {
          this.deleteUser(userId);
          return;
        }

        if (result != 'canceled') {
          this.updateUser(userId, result);
        }
      }
    });
  }

  openCreateDialog(): void {
    const dialogRef = this.dialog.open(CreateUserComponent, {
      width: '25em',
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result != 'canceled' && result !== undefined) {
        this.createUser(result);
      }
    });
  }

  openResetPasswordDialog(userId: number, userName: string): void {
    const dialogRef = this.dialog.open(ResetPasswordComponent, {
      width: '25em',
      data: { userName: userName },
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result != 'canceled' && result !== undefined) {
        this.resetPasswordUser(userId, result);
      }
    });
  }

  getAllUser(): void {
    this.userService.getAllUser().subscribe({
      next: (value) => {
        console.log('get all user');
        this.dataSource = value.users;
      },
      complete: () => {
        console.log('loaded all User');
      },
      error: (err) => {
        console.log(err);
      },
    });
  }

  updateUser(userId: number, data: any): void {
    this.userService.updateUser(userId, data).subscribe({
      complete: () => {
        this.getAllUser();
        console.log('updated user');
      },
      error: (err) => {
        console.log(err);
      },
    });
  }

  deleteUser(userId: number): void {
    this.userService.deleteUser(userId).subscribe({
      complete: () => {
        this.getAllUser();
        console.log('user deleted');
      },
      error: (err) => {
        console.log(err);
      },
    });
  }

  createUser(data: UserData): void {
    console.log(data);
    this.userService.createUser(data).subscribe({
      complete: () => {
        this.getAllUser();
        console.log('user created');
      },
      error: (err) => {
        console.log(err);
      },
    });
  }

  resetPasswordUser(userId: number, data: any): void {
    this.userService.resetPasswordUser(userId, data).subscribe({
      complete: () => {
        this.getAllUser();
        console.log('password changed');
      },
      error: (err) => {
        console.log('Something went wrong!');
      },
    });
  }

  refresh(): void {
    this.getAllUser();
    console.log('list refreshed');
  }
}
