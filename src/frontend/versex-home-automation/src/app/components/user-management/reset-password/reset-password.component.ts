import { Component, Inject } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { MAT_DIALOG_DATA, MatDialogRef } from '@angular/material/dialog';

@Component({
  selector: 'app-reset-password',
  templateUrl: './reset-password.component.html',
  styleUrls: ['./reset-password.component.scss'],
})
export class ResetPasswordComponent {
  hide = true;
  editUserForm!: FormGroup;

  constructor(
    public dialogRef: MatDialogRef<ResetPasswordComponent>,
    @Inject(MAT_DIALOG_DATA) public data: any
  ) {}

  ngOnInit(): void {
    this.editUserForm = new FormGroup({
      password: new FormControl('', [Validators.required]),
    });
  }

  cancle(): void {
    this.dialogRef.close('canceled');
  }

  onSubmit(): void {
    if (this.editUserForm.invalid) {
      return;
    }

    var result = {
      password: this.editUserForm.value.password,
    };

    this.dialogRef.close(result);
  }
}
