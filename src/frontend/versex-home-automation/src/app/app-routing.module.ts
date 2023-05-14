import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { CommonModule } from '@angular/common';

import { MatTabsModule } from '@angular/material/tabs';
import { MatIconModule } from '@angular/material/icon'

import { DashboardComponent } from './components/pages/dashboard/dashboard.component';
import { NotFoundComponent } from './components/pages/not-found/not-found.component';
import { LoginComponent } from './components/pages/login-register/login.component';

const routes: Routes = [
  {path: 'login', component: LoginComponent},
  { path: 'dashboard', component: DashboardComponent },
  { path: '**', component: NotFoundComponent },
];

@NgModule({
  imports: [
    CommonModule,
    RouterModule.forRoot(routes)],
  exports: [RouterModule, MatTabsModule, MatIconModule]
})

export class AppRoutingModule { }
