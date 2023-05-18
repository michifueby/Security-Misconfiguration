import { Component, HostBinding, OnInit } from '@angular/core';
import { LogService } from 'src/app/services/log/log.service';
import { Log } from 'src/app/models/log.model';

@Component({
  selector: 'app-terminal',
  templateUrl: './terminal.component.html',
  styleUrls: ['./terminal.component.scss'],
})
export class TerminalComponent implements OnInit {
  public dataSource!: Array<Log>;

  constructor(public logService: LogService) {}
  
  ngOnInit(): void {
    this.getAllLogs();
  }

  getAllLogs(): void {
    this.logService.getAllLogs().subscribe({
      next: (value) => {
        this.dataSource = value.logs;
      },
      complete: () => {
        console.log('loaded all Logs');
      },
      error: (err) => {
        console.log(err);
      },
    });
  }
}
