import { Component } from '@angular/core';

@Component({
  selector: 'app-temp-control',
  templateUrl: './temp-control.component.html',
  styleUrls: ['./temp-control.component.scss']
})
export class TempControlComponent {

  temperature = 20
  step = 0.5

  minTemp = 16
  maxTemp = 31

  decreaseTemperature() {
    this.temperature = this.temperature > this.minTemp ? this.temperature -= this.step : this.minTemp
  }

  increaseTemperature() {
    this.temperature = this.temperature < this.maxTemp ? this.temperature += this.step : this.maxTemp
  }
}
