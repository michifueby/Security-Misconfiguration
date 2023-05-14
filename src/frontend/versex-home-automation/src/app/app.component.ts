import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MegaMenuItem } from 'primeng/api';
import { TokenStorageService } from './services/token/token-storage.service';
import { HideContentService } from './services/hide-content/hide-content.service';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent implements OnInit {
  /** *
   * Initializes a new instance of the AppComponent class.
   */
  constructor( private router: Router,
    private tokenStorage: TokenStorageService,
    public hideContentService: HideContentService) {
    this.items = [];
  }

  title = 'versex-home-automation';

  public items: MegaMenuItem[]

  /**
   * Set the menu elments and load restaurant data from api.
   */
  public ngOnInit(): void {
    this.items = [
      {
        label: 'Home',
        icon: 'pi pi-home',
      },
      {
        label: 'Dashboard',
        icon: 'pi pi-chart-bar',
        routerLink: ['/dashboard'],
      }
    ];
  }
}
