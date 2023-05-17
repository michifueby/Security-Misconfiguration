import { Component } from '@angular/core';

@Component({
  selector: 'app-device-dropdown',
  templateUrl: './device-dropdown.component.html',
  styleUrls: ['./device-dropdown.component.scss']
})
export class DeviceDropdownComponent {

  options = [
    {value: 'option1', label: 'Option 1'},
    {value: 'option2', label: 'Option 2'},
    {value: 'option3', label: 'Option 3'},
  ];

  selectedOption: any;

  constructor() { }

  ngOnInit(): void {
  }

  onSelect(optionValue: any): void {
    this.selectedOption = this.options.find(option => option.value === optionValue);
  }
}
