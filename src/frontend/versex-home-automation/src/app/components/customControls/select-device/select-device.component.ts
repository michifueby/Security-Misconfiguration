import { Component, ElementRef, EventEmitter, HostListener, Input, OnInit, Output, ViewChild } from '@angular/core';

export interface Device {
  name:string;
  mac:string;
  type:string;
}

@Component({
  selector: 'app-select-device',
  templateUrl: './select-device.component.html',
  styleUrls: ['./select-device.component.scss']
})

export class SelectDeviceComponent {

  @ViewChild('alias') aliasRef!: ElementRef;
  @ViewChild('dialog') dialogRef!: ElementRef;

  deviceType:string = "ac";

  macAdress:any = "";

  @Output() onAddDeviceClicked = new EventEmitter<Device>();
  @Output() onCloseClicked = new EventEmitter();

  addDevice(){
    var device:Device = {
      name: this.aliasRef.nativeElement.value,
      mac : this.macAdress,
      type: this.deviceType
    }

    this.onAddDeviceClicked.emit(device);
  }

  onMacChanged(mac:string) {
    this.macAdress = mac
  }

  close() {
    this.onCloseClicked.emit();
  }

  setDevice(type:any) {
    this.deviceType = type;
  }
}
