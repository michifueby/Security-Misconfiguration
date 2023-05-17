import { AfterViewInit, Component } from '@angular/core';

@Component({
  selector: 'app-sensor-dashboard',
  templateUrl: './sensor-dashboard.component.html',
  styleUrls: ['./sensor-dashboard.component.scss']
})
export class SensorDashboardComponent implements AfterViewInit {

  innerTemperature:number = 20
  innerHumidity:number = 20
  outerTemperature:number = 20
  outerHumidity:number = 20

  innerTemperatureIntervalRef:any
  innerHumidityIntervalRef:any
  outerTemperatureIntervalRef:any
  outerHumidityIntervalRef:any

  delay = 2000;

  ngAfterViewInit(): void {
    this.startAnimation();
  }

  startAnimation() {
    this.innerTemperatureIntervalRef = setInterval(async () => {
      this.innerTemperature = this.getRandomInt(18,26);
    }, this.delay);

    this.innerHumidityIntervalRef = setInterval(async () => {
      this.innerHumidity = this.getRandomInt(40,60);
    }, this.delay);

    this.outerTemperatureIntervalRef = setInterval(async () => {
      this.outerTemperature = this.getRandomInt(20,30);
    }, this.delay);

    this.outerHumidityIntervalRef = setInterval(async () => {
      this.outerHumidity = this.getRandomInt(60,70);
    }, this.delay);
  }

  stopAnimation() {
    clearInterval(this.innerTemperatureIntervalRef);
    clearInterval(this.innerHumidityIntervalRef);
    clearInterval(this.outerTemperatureIntervalRef);
    clearInterval(this.outerHumidityIntervalRef);
  }

  getRandomInt(min:number, max:number) {
    min = Math.ceil(min);
    max = Math.floor(max);
    return Math.floor(Math.random() * (max - min) + min); // The maximum is exclusive and the minimum is inclusive
  }


}
