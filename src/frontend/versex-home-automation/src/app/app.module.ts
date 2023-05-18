import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { LoginComponent } from './components/pages/login-register/login.component';
import { NotFoundComponent } from './components/pages/not-found/not-found.component';
import { LoginCardComponent } from './components/customComponents/login-card/login-card.component';
import { authInterceptorProviders } from './helper/interceptor/auth-interceptor.service';
import { ButtonModule } from 'primeng/button';
import { MegaMenuModule } from 'primeng/megamenu';
import { PanelModule } from 'primeng/panel';
import { KnobModule } from 'primeng/knob';
import { CardModule } from 'primeng/card';
import { AvatarModule } from 'primeng/avatar';
import { SpeedDialModule } from 'primeng/speeddial';
import { DropdownModule } from 'primeng/dropdown';
import { ToastModule } from 'primeng/toast';
import { PasswordModule } from 'primeng/password';
import { MatSnackBarModule } from '@angular/material/snack-bar';
import { MatTableModule } from '@angular/material/table';
import { InputTextModule } from 'primeng/inputtext';
import { TableModule } from 'primeng/table';
import { MatDialogModule } from '@angular/material/dialog';
import { ChipModule } from 'primeng/chip';
import { LogHistoryComponent } from './components/pages/log/log-history/log-history.component';
import { DoorDeviceComponent } from './components/controls/actuators/admin/door-device/door-device.component';
import { MacInputComponent } from './components/customComponents/mac-input/mac-input.component';
import { DeviceDropdownComponent } from './components/customComponents/dropdowns/device-dropdown/device-dropdown.component';
import { SelectDeviceComponent } from './components/customComponents/selectors/select-device/select-device.component';
import { TerminalComponent } from './components/customComponents/terminal/terminal.component';
import { UserDropdownComponent } from './components/customComponents/dropdowns/user-dropdown/user-dropdown.component';
import { SensorDashboardComponent } from './components/controls/sensors/sensor-dashboard/sensor-dashboard.component';
import { LuminacnceComponent } from './components/customComponents/lightComponents/luminacnce/luminacnce.component';
import { LightSwitchComponent } from './components/customComponents/lightComponents/light-switch/light-switch.component';
import { LightDeviceComponent } from './components/controls/actuators/admin/light-device/light-device.component';
import { TempControlComponent } from './components/customComponents/temp-control/temp-control.component';
import { AcDeviceComponent } from './components/controls/actuators/admin/ac-device/ac-device.component';
import { AddDeviceComponent } from './components/customComponents/selectors/add-device/add-device.component';
import { DeleteUserComponent } from './components/user-management/delete-user/delete-user.component';
import { EditUserComponent } from './components/user-management/edit-user/edit-user.component';
import { CreateUserComponent } from './components/user-management/create-user/create-user.component';
import { UsersComponent } from './components/pages/user/users/users.component';
import { ResetPasswordComponent } from './components/user-management/reset-password/reset-password.component';
import { AcDeviceUserComponent } from './components/controls/actuators/user/ac-device-user/ac-device-user.component';
import { LightDeviceUserComponent } from './components/controls/actuators/user/light-device-user/light-device-user.component';
import { DoorDeviceUserComponent } from './components/controls/actuators/user/door-device-user/door-device-user.component';
import { ToastComponent } from './components/customControls/notification-toast/toast/toast.component';
import { DashboardComponent } from './components/pages/dashboard/dashboard.component';


@NgModule({
  declarations: [
    AppComponent,
    AcDeviceComponent,
    DoorDeviceComponent,
    LightDeviceComponent,
    SensorDashboardComponent,
    DeviceDropdownComponent,
    UserDropdownComponent,
    LuminacnceComponent,
    LightSwitchComponent,
    LoginCardComponent,
    MacInputComponent,
    AddDeviceComponent,
    SelectDeviceComponent,
    TempControlComponent,
    TerminalComponent,
    DashboardComponent,
    LogHistoryComponent,
    LoginComponent,
    NotFoundComponent,
    UsersComponent,
    CreateUserComponent,
    DeleteUserComponent,
    EditUserComponent,
    ResetPasswordComponent,
    AcDeviceUserComponent,
    LightDeviceUserComponent,
    DoorDeviceUserComponent,
    ToastComponent
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
    ChipModule,
    ToastModule
  ],
  providers: [authInterceptorProviders],
  bootstrap: [AppComponent]
})
export class AppModule { }
