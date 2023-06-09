import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from 'src/enviroments/environment';
import { UserData } from 'src/app/models/userData.model';
import { TokenStorageService } from '../token/token-storage.service';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
};

@Injectable({
  providedIn: 'root',
})
export class UserService {
  constructor(
    private http: HttpClient,
    public tokenStorage: TokenStorageService
  ) {}

  public getAllUser(): Observable<any> {
    return this.http.get<any>(`${environment.apiUrl}/user/getall`);
  }

  public updateUser(userId: number, data: UserData): Observable<any> {
    return this.http.put<any>(
      `${environment.apiUrl}/user/update/${userId}`,
      {
        userName: data.userName,
        firstName: data.firstName,
        email: data.email,
        lastName: data.lastName,
        roles: data.roles,
      },
      httpOptions
    );
  }

  public resetPasswordUser(userId: number, data: any): Observable<any> {
    return this.http.put<any>(
      `${environment.apiUrl}/user/update/password/${userId}`,
      {
        password: data.password,
      },
      httpOptions
    );
  }

  public deleteUser(userId: number): Observable<any> {
    return this.http.delete<any>(`${environment.apiUrl}/user/delete/${userId}`);
  }

  public createUser(data: UserData): Observable<any> {
    return this.http.put<any>(
      `${environment.apiUrl}/user/create`,
      {
        userName: data.userName,
        email: data.email,
        password: data.password,
        firstName: data.firstName,
        lastName: data.lastName,
        roles: data.roles,
      },
      httpOptions
    );
  }

  public getIsUserAdmin(): boolean {
    return this.tokenStorage.getUser().roleId === 1
  }

  public getUserNameFromUser(): string {
    return this.tokenStorage.getUser().userName;
  }
}
