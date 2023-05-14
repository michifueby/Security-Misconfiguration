import { Component, ViewEncapsulation} from '@angular/core';

@Component({
  selector: 'app-login-card',
  templateUrl: './login-card.component.html',
  styleUrls: ['./login-card.component.scss'],
  encapsulation: ViewEncapsulation.Emulated
})
export class LoginCardComponent {

  isVisible:boolean = true

  togglePasswordVisibility() {
    if(!this.isVisible) {
      this.isVisible = true;
      document.getElementById("inputPassword")!.setAttribute("type", "password");
      return;
    }

    if(this.isVisible) {
      this.isVisible = false
      document.getElementById("inputPassword")!.setAttribute("type", "text");
      return;
    }
  }
}
