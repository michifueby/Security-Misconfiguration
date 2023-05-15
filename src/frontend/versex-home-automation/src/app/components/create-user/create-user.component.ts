import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef } from '@angular/material/dialog';
import { Roles } from 'src/app/models/roles.model';
import { UserData } from 'src/app/models/userData.model';

@Component({
  selector: 'app-create-user',
  templateUrl: './create-user.component.html',
  styleUrls: ['./create-user.component.scss']
})
export class CreateUserComponent {
  hide = true;

  editUserForm!: FormGroup;
  rolesList!: Array<string>;

  constructor(
    public dialogRef: MatDialogRef<CreateUserComponent>,
    ) { }

  ngOnInit(): void {
    this.rolesList = ['Admin', 'User'];

    this.editUserForm = new FormGroup({
      userName: new FormControl('', [Validators.required]),
      firstName: new FormControl('', [Validators.required]),
      lastName: new FormControl('', [Validators.required]),
      email: new FormControl('', [Validators.required]),
      password: new FormControl('', [Validators.required]),
      roles: new FormControl('', [Validators.required])
    })
  }

  cancle(): void {
    this.dialogRef.close('canceled');
  }

  delete(): void {
    this.dialogRef.close('delete');
  }

  onSubmit(): void {
    if (this.editUserForm.invalid){
      return;
    }

    var result: UserData = {
      userName: this.editUserForm.value.userName,
      email: this.editUserForm.value.email,
      password: this.editUserForm.value.password,
      firstName: this.editUserForm.value.firstName,
      lastName: this.editUserForm.value.lastName,
      roles: [this.editUserForm.value.roles]
    }

    this.dialogRef.close(result);
  }
}
