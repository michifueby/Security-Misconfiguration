import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { PanelModule } from 'primeng/panel';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { UserService } from 'src/app/services/user/user.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.scss']
})

export class DashboardComponent implements OnInit {

  constructor(public tokenStorage: TokenStorageService, public router: Router, public userService: UserService) { }

  ngOnInit(): void {
    if (!this.tokenStorage.getUser()) {
      this.router.navigate(['']);
    }
  }

}
