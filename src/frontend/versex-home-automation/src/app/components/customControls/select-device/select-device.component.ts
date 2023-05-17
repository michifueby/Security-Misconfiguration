import { Component, ElementRef, HostListener, OnInit, ViewChild } from '@angular/core';

interface Type {
  desc: String
}

interface Device {
  name: String
  mac: String
  type: String
}

@Component({
  selector: 'app-select-device',
  templateUrl: './select-device.component.html',
  styleUrls: ['./select-device.component.scss']
})

export class SelectDeviceComponent {

  @ViewChild('MAC') macRef!: ElementRef;

  @HostListener('keydown', ['$event'])
  onKeyDown(event: KeyboardEvent) {
    const allowedKeys = ['Backspace', 'Tab', 'Delete', 'ArrowLeft', 'ArrowRight'];
    const key = event.key;

    if (!this.isValidKey(key) && !allowedKeys.includes(key)) {
      event.preventDefault();
    }
  }

  @HostListener('input')
  onInput() {
    const mac = this.macRef.nativeElement.value;
    const formattedMac = this.formatMac(mac);
    this.macRef.nativeElement.value = formattedMac;
  }

  isValidKey(key: string): boolean {
    const regex = /^[0-9a-fA-F]$/;
    return regex.test(key);
  }

  formatMac(mac: string): string {
    const macs = mac.replace(/:/g, '').toUpperCase();
    const chunks = this.chunk(macs, 2);
    return chunks.join(':');
  }

  chunk(str: string, n: number): string[] {
    const ret = [];
    let i;
    const len = str.length;

    for (i = 0; i < len; i += n) {
      ret.push(str.substr(i, n));
    }

    return ret;
  }



}
