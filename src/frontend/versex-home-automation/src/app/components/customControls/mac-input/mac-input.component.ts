import { Component, ElementRef, EventEmitter, HostListener, Input, Output, ViewChild } from '@angular/core';

@Component({
  selector: 'app-mac-input',
  templateUrl: './mac-input.component.html',
  styleUrls: ['./mac-input.component.scss']
})
export class MacInputComponent {

  @ViewChild('MAC') macRef!: ElementRef;

  @Output() macAddressChange = new EventEmitter<string>();

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

    this.macAddressChange.emit(formattedMac);
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
