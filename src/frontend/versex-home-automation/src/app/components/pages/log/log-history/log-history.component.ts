import { Component } from '@angular/core';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';

@Component({
  selector: 'app-log-history',
  templateUrl: './log-history.component.html',
  styleUrls: ['./log-history.component.scss']
})
export class LogHistoryComponent {

  constructor(public tokenStorage: TokenStorageService) {

  }

  public getFirstAndSecondNameFromUser(): string {
    let user = this.tokenStorage.getUser()

    return user.userName;
  }
}
