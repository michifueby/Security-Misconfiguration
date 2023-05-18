import { Component, EventEmitter, OnInit, Output, ViewChild } from '@angular/core';

@Component({
  selector: 'app-device-dropdown',
  templateUrl: './device-dropdown.component.html',
  styleUrls: ['./device-dropdown.component.scss']
})
export class DeviceDropdownComponent implements OnInit{


  selectedOption?: string;

  @Output() onSelected = new EventEmitter<string>();

  options = [
    {value: 'ac', label: 'Air Conditioner'},
    {value: 'lightswitch', label: 'Light Switch'},
    {value: 'door', label: 'Door'},
  ];

  ngOnInit(): void {
    this.selectedOption = 'ac';
  }


  select(selected:string) {
    this.selectedOption = this.options.find(option => option.value === selected)?.value;
    this.onSelected.emit(this.selectedOption);
  }
}
