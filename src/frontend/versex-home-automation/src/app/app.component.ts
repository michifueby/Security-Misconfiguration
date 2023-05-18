import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { TokenStorageService } from './services/token/token-storage.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent {
  /** *
   * Initializes a new instance of the AppComponent class.
   */
  constructor( private router: Router,
    private tokenStorage: TokenStorageService) {
  }

  title = 'versex-home-automation';

}
