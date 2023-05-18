import { AfterViewInit, Component, ViewChild, ElementRef, Input } from '@angular/core';

@Component({
  selector: 'app-light-device',
  templateUrl: './light-device.component.html',
  styleUrls: ['./light-device.component.scss']
})
export class LightDeviceComponent implements AfterViewInit {

  @Input() aliasName = ""

  @ViewChild('lightbulbCanvas') canvasRef!: ElementRef<HTMLCanvasElement>;
  context!: CanvasRenderingContext2D;

  lightStatus = false;
  brightness:number = 1;

  ngAfterViewInit(): void {
    const canvas = this.canvasRef.nativeElement
    this.brightness = 1

    this.context = canvas.getContext('2d')!;
    this.context.lineWidth = 4;

    this.context.strokeStyle = `rgba(62, 62, 62, 255)`
    this.renderLightbulb(this.context)
  }

  update (value:number) {
    this.brightness = value;
    this.context.strokeStyle = this.lightStatus == false ? `rgba(62, 62, 62, 255)` : `rgba(127, 255, 212, ${this.brightness})`
    this.renderLightbulb(this.context)
  }


  toggleLight (status:boolean){
    this.lightStatus = status
    this.context.strokeStyle = this.lightStatus == false ? `rgba(62, 62, 62, 255)` : `rgba(127, 255, 212, ${this.brightness})`
    this.renderLightbulb(this.context)
  }

  renderLightbulb (ctx:CanvasRenderingContext2D) {

    var centerX = this.canvasRef.nativeElement.width / 2;
    var centerY = this.canvasRef.nativeElement.height / 2;

    this.clearCanvas();
    ctx.beginPath();

    // Bulb
    ctx.arc(centerX, centerY, 30, 0, 2 * Math.PI);

    // Left
    ctx.moveTo(35, 75);
    ctx.lineTo(40, 100);

    // Right
    ctx.moveTo(65, 75);
    ctx.lineTo(60, 100);

    // Bottom
    ctx.moveTo(40, 98);
    ctx.lineTo(60, 98);

    // Shine effect
    this.lightStatus ? this.renderShine(ctx) : ctx.stroke();
  }

  renderShine (ctx:CanvasRenderingContext2D) {

    // South-West
    ctx.moveTo(15, 75);
    ctx.lineTo(5, 85);

    // West
    ctx.moveTo(0, 50);
    ctx.lineTo(10, 50);

    // Noth-West
    ctx.moveTo(10, 10);
    ctx.lineTo(20, 20);

    // North
    ctx.moveTo(50, 0);
    ctx.lineTo(50, 10);

    // North-East
    ctx.moveTo(90, 10);
    ctx.lineTo(80, 20);

    // East
    ctx.moveTo(90, 50);
    ctx.lineTo(100, 50);

    // South-East
    ctx.moveTo(85, 75);
    ctx.lineTo(95, 85);

    ctx.stroke();
  }

  clearCanvas() {
    this.context.clearRect(0, 0, this.canvasRef.nativeElement.width, this.canvasRef.nativeElement.height);
  }

}
