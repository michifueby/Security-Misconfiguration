import { Component, OnInit } from '@angular/core';
import { MegaMenuItem } from 'primeng/api';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.scss']
})

export class AppComponent implements OnInit {
  /** *
   * Initializes a new instance of the AppComponent class.
   */
  constructor() {
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
        routerLink: [''],
      },
      {
        label: 'Dashboard',
        icon: 'pi pi-chart-bar',
        routerLink: ['/dashboard'],
      },
    ];
  }
}
