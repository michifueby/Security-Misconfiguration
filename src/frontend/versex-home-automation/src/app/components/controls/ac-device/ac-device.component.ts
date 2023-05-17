import { AfterViewInit, Component, ElementRef, Input, ViewChild } from '@angular/core';

@Component({
  selector: 'app-ac-device',
  templateUrl: './ac-device.component.html',
  styleUrls: ['./ac-device.component.scss']
})

export class AcDeviceComponent implements AfterViewInit {

  @Input() aliasName = ""
  @ViewChild('fanCanvas') canvasRef!: ElementRef<HTMLCanvasElement>;
  context!: CanvasRenderingContext2D;

  ngAfterViewInit(): void {
    const canvas = this.canvasRef.nativeElement

    this.context = canvas.getContext('2d')!;
    this.context.strokeStyle = "rgba(127, 255, 212, 255)"

    this.renderFan(this.context)
  }

  isActive = false;

  toggleFan() {
    this.isActive = !this.isActive
  }

  renderFan(ctx:CanvasRenderingContext2D) {

    var centerX = this.canvasRef.nativeElement.width / 2;
    var centerY = this.canvasRef.nativeElement.height / 2;

    // Base - outer
    ctx.beginPath();
    this.context.lineWidth = 2;
    ctx.arc(centerX, centerY, 15, 0, 2 * Math.PI);
    ctx.stroke();
    ctx.closePath()

    // Base - inner
    ctx.beginPath();
    ctx.arc(centerX, centerY, 8, 0, 2 * Math.PI);
    ctx.stroke();
    ctx.fillStyle = "rgba(127, 255, 212, 255)";
    ctx.fill();
    ctx.closePath();

    // Rotor West
    ctx.beginPath()
    ctx.moveTo(35, 45);
    ctx.lineTo(0, 35);
    ctx.moveTo(0, 35);
    ctx.lineTo(0, 65);
    ctx.moveTo(35, 55);
    ctx.lineTo(0, 65);
    ctx.stroke()
    ctx.closePath();

    // Rotor North
    ctx.beginPath()
    ctx.moveTo(45, 35);
    ctx.lineTo(35, 0);
    ctx.moveTo(35, 0);
    ctx.lineTo(65, 0);
    ctx.moveTo(55, 35);
    ctx.lineTo(65, 0);
    ctx.stroke();
    ctx.closePath();

    // Rotor East
    ctx.beginPath()
    ctx.moveTo(65, 45);
    ctx.lineTo(100, 35);
    ctx.moveTo(100, 35);
    ctx.lineTo(100, 65);
    ctx.moveTo(65, 55);
    ctx.lineTo(100, 65);
    ctx.stroke()
    ctx.closePath();

    // Rotor South
    ctx.beginPath()
    ctx.moveTo(45, 65);
    ctx.lineTo(35, 100);
    ctx.moveTo(35, 100);
    ctx.lineTo(65, 100);
    ctx.moveTo(55, 65);
    ctx.lineTo(65, 100);
    ctx.stroke()
    ctx.closePath()








  }

}
