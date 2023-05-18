import { Component, ElementRef, Input, ViewChild } from '@angular/core';

@Component({
  selector: 'app-door-device',
  templateUrl: './door-device.component.html',
  styleUrls: ['./door-device.component.scss']
})
export class DoorDeviceComponent {
  @Input() aliasName = ""

  @ViewChild('doorCanvas') canvasRef!: ElementRef<HTMLCanvasElement>;
  context!: CanvasRenderingContext2D;

  ngAfterViewInit() {
    const canvas = this.canvasRef.nativeElement

    this.context = canvas.getContext('2d')!;
    this.context.strokeStyle = `rgba(127, 255, 212, 255)`;
    this.context.fillStyle = `rgba(127, 255, 212, 255)`;

    this.displayDoor(this.context);
  }

  isActive = false;

  toggleDoor() {
    this.isActive = !this.isActive

    if(!this.isActive) {
      this.openDoor(this.context);
    }
    else {
      this.closeDoor(this.context);
    }
  }


  closeDoor(ctx:CanvasRenderingContext2D) {

    const speed = 0.2;

    const leftDoor = {
      left: 15,
      top: 10,
      width: 0,
      height: 85,
      maxWidth: 33,
    };

    const rightDoor = {
      right: 85,
      top: 10,
      width: 0,
      height: 85,
      maxWidth: 33,
    };

    const closeAnimation = () => {
      if (leftDoor.width < leftDoor.maxWidth) {
        leftDoor.width += speed;
        ctx.clearRect(leftDoor.left, leftDoor.top, speed, leftDoor.height);
        ctx.fillRect(leftDoor.left, leftDoor.top, leftDoor.width, leftDoor.height);
        requestAnimationFrame(closeAnimation);
      }

      if (rightDoor.width < rightDoor.maxWidth) {
        rightDoor.width += speed;
        rightDoor.right -= speed;
        ctx.clearRect(rightDoor.right, rightDoor.top, speed, rightDoor.height);
        ctx.fillRect(rightDoor.right, rightDoor.top, rightDoor.width, rightDoor.height);
        requestAnimationFrame(closeAnimation);
      }
    }

    closeAnimation();
  }

  openDoor(ctx:CanvasRenderingContext2D) {

    const speed = 0.5;

    const leftDoor = {
      left: 15,
      top: 10,
      width: 34.5,
      height: 85,
      minWidth: 0,
    };

    const rightDoor = {
      right: 85,
      top: 10,
      width: 34.5,
      height: 85,
      minWidth: 0,
    };

    const openAnimation = () => {
      if (leftDoor.width > leftDoor.minWidth) {
        leftDoor.width -= speed;
        ctx.clearRect(leftDoor.left + leftDoor.width, leftDoor.top, 1, leftDoor.height);
      }

      if (rightDoor.width > rightDoor.minWidth) {
        rightDoor.width -= speed
        ctx.clearRect(rightDoor.right - rightDoor.width, rightDoor.top, 1, rightDoor.height);
      }

      requestAnimationFrame(openAnimation);
    }

    openAnimation();
  }

  displayDoor(ctx:CanvasRenderingContext2D) {

    ctx.lineWidth = 2;

    // left
    ctx.beginPath();
    ctx.moveTo(10,95);
    ctx.lineTo(10,5);
    ctx.stroke();
    ctx.closePath();

    // top
    ctx.beginPath();
    ctx.moveTo(10,5);
    ctx.lineTo(90,5);
    ctx.stroke();
    ctx.closePath();

    // right
    ctx.beginPath();
    ctx.moveTo(90, 95);
    ctx.lineTo(90, 5);
    ctx.stroke();
    ctx.closePath();
  }
}
