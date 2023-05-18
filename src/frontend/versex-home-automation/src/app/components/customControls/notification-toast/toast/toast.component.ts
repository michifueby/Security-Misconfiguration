import { Component, Input } from '@angular/core';

@Component({
  selector: 'app-toast',
  templateUrl: './toast.component.html',
  styleUrls: ['./toast.component.scss']
})
export class ToastComponent {

  public toastText: string = '';

  private duration: number = 3000;

  @Input()
	set text(name: string) {
		this.toastText = name;
	}

  @Input()
	set durationTime(duration: number) {
		this.duration = duration;
	}

  public showToast():void {

    let x = document.getElementById("snackbar");
    x!.className = "show";
    setTimeout(function(){ x!.className = x!.className.replace("show", ""); }, this.duration);
  }
}
