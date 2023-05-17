import { Component, ViewEncapsulation } from '@angular/core';
import { MatDialog } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Router } from '@angular/router';
import { CreateUserComponent } from 'src/app/components/create-user/create-user.component';
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

  public displayedColumns: string[] = ['userId', 'userName', 'firstName', 'lastName', 'roles', 'edit'];
  public dataSource!: Array<User>;

  constructor(
    private tokenService: TokenStorageService,
    private userService: UserService,
    private router: Router,
    public dialog: MatDialog,
    private snackBar: MatSnackBar,
    public tokenStorage: TokenStorageService,
    ) { }

  ngOnInit(): void {
    if (!this.tokenService.getUser()) {
      this.router.navigate(['']);
    }

    if (this.tokenService.getUser().roleId !== 1) {
      this.router.navigate(['']);
    }

    this.getAllUser();
  }

  public getFirstAndSecondNameFromUser(): string {
    let user = this.tokenStorage.getUser()

    return user.userName;
  }

  openEditDialog(userId: number, userName: string, email: string, firstName: string, lastName: string, roles: number): void {
    const dialogRef = this.dialog.open(EditUserComponent, {
      width: '25em',
      data: {userId, userName, email, firstName, lastName, roles}
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result !== undefined){
        if (result == 'delete'){
          this.deleteUser(userId);
          return;
        }

        if (result != 'canceled'){
          this.updateUser(userId, result);
        }
      }
    });
  }

  openCreateDialog(): void {
    const dialogRef = this.dialog.open(CreateUserComponent, {
      width: '25em'
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result != 'canceled' && result !== undefined){
        this.createUser(result);
      }
    });
  }

  openResetPasswordDialog(userId: number, userName: string): void {
    const dialogRef = this.dialog.open(ResetPasswordComponent, {
      width: '25em',
      data: {userName: userName},
    });

    dialogRef.afterClosed().subscribe(result => {
      if (result != 'canceled' && result !== undefined){
        this.resetPasswordUser(userId, result);
      }
    });
  }

  getAllUser(): void {
    this.userService.getAllUser().subscribe({
      next: (value) => {
        console.log(value.users);
        this.dataSource = value.users;
      },
      complete: () => {
        console.log('loaded all User')
      },
      error: (err) => {
        console.log(err);
        this.openSnackBarError('Something went wrong', 'OK');
      }
    });
  }

  updateUser(userId: number, data: any): void {
    this.userService.updateUser(userId, data).subscribe({
      complete: () => {
        this.getAllUser();
        console.log('updated user');
        this.openSnackBarSuccess('User updated', 'OK');
      },
      error: (err) => {
        console.log(err);
        this.openSnackBarError('Something went wrong', 'OK');
      }
    });
  }

  deleteUser(userId: number): void {
    this.userService.deleteUser(userId).subscribe({
      complete: () => {
        this.getAllUser();
        console.log('user deleted');
        this.openSnackBarSuccess('User deleted', 'OK');
      },
      error: (err) => {
        console.log(err);
        this.openSnackBarError('Something went wrong', 'OK');
      }
    });
  }

  createUser(data: UserData): void {
    console.log(data);
    this.userService.createUser(data).subscribe({
      complete: () => {
        this.getAllUser();
        console.log('user created');
        this.openSnackBarSuccess('User created', 'OK');
      },
      error: (err) => {
        console.log(err);
        this.openSnackBarError('Something went wrong', 'OK');
      }
    });
  }

  resetPasswordUser(userId: number, data: any): void {
    this.userService.resetPasswordUser(userId, data).subscribe({
      complete: () => {
        this.getAllUser();
        console.log('password changed');
        this.openSnackBarSuccess('Password changed', 'OK');
      },
      error: (err) => {
        this.openSnackBarError('Something went wrong', 'OK');
      }
    });
  }

  openSnackBarInfo(message: string, action: string) {
    this.snackBar.open(message, action,{
      duration: 3000,
      panelClass: ['red-snackbar']
    });
  }

  openSnackBarSuccess(message: string, action: string) {
    this.snackBar.open(message, action,{
      duration: 3000,
      panelClass: ['successStyle']
    });
  }

  openSnackBarError(message: string, action: string) {
    this.snackBar.open(message, action,{
      duration: 3000,
      panelClass: ['errorStyle'],
    });
  }

  refresh(): void {
    this.getAllUser();
    console.log('list refreshed');
    this.openSnackBarInfo('Refreshed', '')
  }
}
