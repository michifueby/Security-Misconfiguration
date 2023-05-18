import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/enviroments/environment';
import { UserData } from 'src/app/models/userData.model';
import { TokenStorageService } from '../token/token-storage.service';
import { ActorData } from 'src/app/models/actor.model';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
};

@Injectable({
  providedIn: 'root',
})
export class ActorService {
  constructor(
    private http: HttpClient,
    public tokenStorage: TokenStorageService
  ) {}

  public createActor(data: ActorData): Observable<any> {
    return this.http.put<any>(
      `${environment.apiUrl}/actor/create`,
      {
        name: data.name,
        mac: data.mac,
        state: data.state,
        value: data.value
      },
      httpOptions
    );
  }

}
