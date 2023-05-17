import { Component, OnInit } from '@angular/core';
import { PanelModule } from 'primeng/panel';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';

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

}
