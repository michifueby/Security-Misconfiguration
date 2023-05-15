import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import {
  MAT_DIALOG_DATA,
  MatDialog,
  MatDialogRef,
} from '@angular/material/dialog';
import { UserData } from 'src/app/models/userData.model';
import { DeleteUserComponent } from '../delete-user/delete-user.component';

@Component({
  selector: 'app-edit-user',
  templateUrl: './edit-user.component.html',
  styleUrls: ['./edit-user.component.scss'],
})
export class EditUserComponent {
  editUserForm!: FormGroup;
  rolesList!: string[];

  constructor(
    public dialog: MatDialog,
    public dialogRef: MatDialogRef<EditUserComponent>,
    @Inject(MAT_DIALOG_DATA) public data: UserData
  ) {}

  ngOnInit(): void {
    this.rolesList = ['Admin', 'User'];

    this.editUserForm = new FormGroup({
      userName: new FormControl(this.data.userName, [Validators.required]),
      email: new FormControl(this.data.email, [Validators.required]),
      firstName: new FormControl(this.data.firstName, [Validators.required]),
      lastName: new FormControl(this.data.lastName, [Validators.required]),
      roles: new FormControl(this.data.roles, [Validators.required]),
    });
  }

  cancle(): void {
    this.dialogRef.close('canceled');
  }

  onDelete(): void {
    const dialogRef = this.dialog.open(DeleteUserComponent, {
      width: '20em',
      data: { userName: this.data.userName },
    });

    dialogRef.afterClosed().subscribe((result) => {
      if (result) {
        this.dialogRef.close('delete');
      }
    });
  }

  onSubmit(): void {
    if (this.editUserForm.invalid) {
      return;
    }

    var result: UserData = {
      userName: this.editUserForm.value.userName,
      firstName: this.editUserForm.value.firstName,
      lastName: this.editUserForm.value.lastName,
      email: this.editUserForm.value.email,
      password: '',
      roles: [this.editUserForm.value.roles],
    };

    this.dialogRef.close(result);
  }
}
