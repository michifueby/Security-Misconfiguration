import { Component, EventEmitter, Output } from '@angular/core';

@Component({
  selector: 'app-light-switch',
  templateUrl: './light-switch.component.html',
  styleUrls: ['./light-switch.component.scss']
})
export class LightSwitchComponent {

  isChecked: boolean = false;
  @Output() valueChanged = new EventEmitter<boolean>();


  toggle() {
    this.isChecked = !this.isChecked;
    this.valueChanged.emit(this.isChecked);
  }
}
