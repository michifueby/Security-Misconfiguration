import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { Device } from '../../customComponents/selectors/select-device/select-device.component';
import { UserService } from 'src/app/services/user/user.service';
import { ActorService } from 'src/app/services/actor/actor.service';
import { ActorData } from 'src/app/models/actor.model';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss'],
})
export class DashboardComponent implements OnInit {
  constructor(
    public tokenStorage: TokenStorageService,
    public router: Router,
    public userService: UserService,
    private actorService: ActorService
  ) {}

  ngOnInit(): void {
    if (!this.tokenStorage.getUser()) {
      this.router.navigate(['']);
    }
  }

  showDeviceDialog = false;
  devices:Device[] = [];

  addDevice(device:Device){
    this.devices.push(device);
    this.showDeviceDialog = false;
  }

  displayDeviceDialog() {
    this.showDeviceDialog = true;
  }

  closeComponent(){
    this.showDeviceDialog = false;
  }

}
