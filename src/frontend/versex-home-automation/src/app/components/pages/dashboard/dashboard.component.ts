import { Component, OnInit } from '@angular/core';
import { PanelModule } from 'primeng/panel';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { Device } from '../../customComponents/selectors/select-device/select-device.component';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})

export class DashboardComponent implements OnInit {

  constructor(public tokenStorage: TokenStorageService) { }

  ngOnInit(): void {
  }

  public getFirstAndSecondNameFromUser(): string {
    let user = this.tokenStorage.getUser()

    return user.userName;
  }

  showDeviceDialog = false;
  devices:Device[] = [];

  addDevice(device:Device){
    this.devices.push(device);
    console.log(this.devices);
    this.showDeviceDialog = false;
  }

  displayDeviceDialog() {
    this.showDeviceDialog = true;
  }

  closeComponent(){
    this.showDeviceDialog = false;
  }

}
