import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenStorageService } from 'src/app/services/token/token-storage.service';
import { UserService } from 'src/app/services/user/user.service';

@Component({
  selector: 'app-log-history',
  templateUrl: './log-history.component.html',
  styleUrls: ['./log-history.component.scss'],
})
export class LogHistoryComponent implements OnInit {
  constructor(
    public tokenStorage: TokenStorageService,
    public router: Router,
    public userService: UserService
  ) {}

  ngOnInit(): void {

  }
}
