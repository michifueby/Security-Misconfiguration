import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/pages/login/login.component';
import { ButtonModule } from 'primeng/button';
import { AddDeviceComponent } from './components/controls/add-device/add-device.component';
import { AcDeviceComponent } from './components/controls/ac-device/ac-device.component';
import { InputNumberModule } from 'primeng/inputnumber';
import { TempControlComponent } from './components/customControls/temp-control/temp-control.component';
import { LightDeviceComponent } from './components/controls/light-device/light-device.component';
import { LightSwitchComponent } from './components/customControls/light-switch/light-switch.component';
import { LightLuminacnceComponent } from './components/customControls/light-luminacnce/light-luminacnce.component';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    AddDeviceComponent,
    AcDeviceComponent,
    TempControlComponent,
    LightDeviceComponent,
    LightSwitchComponent,
    LightLuminacnceComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    ButtonModule,
    InputNumberModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
