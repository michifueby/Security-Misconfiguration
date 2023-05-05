import { Injectable } from '@angular/core';
import {HttpClient, HttpHeaders} from "@angular/common/http";
import {Observable} from "rxjs";
import { environment } from 'src/enviroments/environment';
import { User } from 'src/app/models/user.model';

const httpOptions = {
  headers: new HttpHeaders({ 'Content-Type': 'application/json' }),
};

@Injectable({
  providedIn: 'root'
})
export class UserService {

  constructor(private http: HttpClient) { }

  getAllUser(): Observable<any> {
    return this.http.get<any>(`${environment.apiUrl}/user/getall`);
  }

  updateUser(userId: number, data: User): Observable<any> {
    return this.http.put<any>(`${environment.apiUrl}/user/update/${userId}`, {
      userName: data.userName,
      firstName: data.firstName,
      email: data.email,
      lastName: data.lastName,
      roles: data.roles
    }, httpOptions);
  }

  resetPasswordUser(userId: number, data: any): Observable<any> {
    return this.http.put<any>(`${environment.apiUrl}/user/update/password/${userId}`, {
      password: data.password
    }, httpOptions);
  }

  deleteUser(userId: number): Observable<any> {
    return this.http.delete<any>(`${environment.apiUrl}/user/delete/${userId}`);
  }

  createUser(data: User): Observable<any> {
    return this.http.put<any>(`${environment.apiUrl}/user/create`, {
      userName: data.userName,
      email: data.email,
      password: data.password,
      firstName: data.firstName,
      lastName: data.lastName,
      roles: data.roles
    }, httpOptions);
  }
}
