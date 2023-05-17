import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-add-device',
  templateUrl: './add-device.component.html',
  styleUrls: ['./add-device.component.scss']
})
export class AddDeviceComponent {

  @Output() onClicked = new EventEmitter()

  click(){
    this.onClicked.emit();

  }
}
