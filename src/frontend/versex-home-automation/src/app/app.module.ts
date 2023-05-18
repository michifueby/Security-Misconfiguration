import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/pages/login-register/login.component';
import { NotFoundComponent } from './components/pages/not-found/not-found.component';
import { DashboardComponent } from './components/pages/dashboard/dashboard.component';
import { LoginCardComponent } from './components/login-card/login-card.component';
import { authInterceptorProviders } from './helper/interceptor/auth-interceptor.service';
import { ButtonModule } from 'primeng/button';
import { MegaMenuModule } from 'primeng/megamenu';
import { PanelModule } from 'primeng/panel';
import { KnobModule } from 'primeng/knob';
import { CardModule } from 'primeng/card';
import { AvatarModule } from 'primeng/avatar';
import { AvatarComponent } from './components/avatar/avatar.component';
import { SpeedDialModule } from 'primeng/speeddial';
import { DropdownModule } from 'primeng/dropdown';
import { PasswordModule } from 'primeng/password';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTableModule } from '@angular/material/table';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { MatDialogModule } from '@angular/material/dialog';
import { ChipModule } from 'primeng/chip';
import { UsersComponent } from './components/pages/user/users/users.component';
import { CreateUserComponent } from './components/create-user/create-user.component';
import { EditUserComponent } from './components/edit-user/edit-user.component';
import { ResetPasswordComponent } from './components/reset-password/reset-password.component';
import { DeleteUserComponent } from './components/delete-user/delete-user.component';
import { AddDeviceComponent } from './components/controls/add-device/add-device.component';
import { AcDeviceComponent } from './components/controls/ac-device/ac-device.component';
import { InputNumberModule } from 'primeng/inputnumber';
import { TempControlComponent } from './components/customControls/temp-control/temp-control.component';
import { LightDeviceComponent } from './components/controls/light-device/light-device.component';
import { LightSwitchComponent } from './components/customControls/light-switch/light-switch.component';
import { LightLuminacnceComponent } from './components/customControls/light-luminacnce/light-luminacnce.component';
import { SensorDashboardComponent } from './components/pages/sensor-dashboard/sensor-dashboard.component';
import { UserDropdownComponent } from './components/customControls/user-dropdown/user-dropdown.component';
import { TerminalComponent } from './components/terminal/terminal.component';
import { SelectDeviceComponent } from './components/customControls/select-device/select-device.component';
import { DeviceDropdownComponent } from './components/customControls/device-dropdown/device-dropdown.component';
import { LogHistoryComponent } from './components/pages/log/log-history/log-history.component';
import { MacInputComponent } from './components/customControls/mac-input/mac-input.component';


@NgModule({
  declarations: [
    AppComponent,
    LoginComponent,
    LoginCardComponent,
    NotFoundComponent,
    DashboardComponent,
    AvatarComponent,
    UsersComponent,
    CreateUserComponent,
    EditUserComponent,
    ResetPasswordComponent,
    DeleteUserComponent,
    AddDeviceComponent,
    AcDeviceComponent,
    TempControlComponent,
    LightDeviceComponent,
    LightSwitchComponent,
    LightLuminacnceComponent,
    SensorDashboardComponent,
    UserDropdownComponent,
    TerminalComponent,
    SelectDeviceComponent,
    DeviceDropdownComponent,
    LogHistoryComponent,
    MacInputComponent
  ],
  imports: [
    AppRoutingModule,
    BrowserModule,
    BrowserAnimationsModule,
    ButtonModule,
    MegaMenuModule,
    PanelModule,
    KnobModule,
    CardModule,
    AvatarModule,
    SpeedDialModule,
    FormsModule,
    ReactiveFormsModule,
    MatSnackBarModule,
    MatDialogModule,
    HttpClientModule,
    DropdownModule,
    MatTableModule,
    TableModule,
    InputTextModule,
    PasswordModule,
    ChipModule
  ],
  providers: [authInterceptorProviders],
  bootstrap: [AppComponent]
})
export class AppModule { }
