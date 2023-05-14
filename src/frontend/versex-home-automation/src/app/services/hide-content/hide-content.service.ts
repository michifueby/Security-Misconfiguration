import { Injectable } from '@angular/core';
import { TokenStorageService } from '../token/token-storage.service';

@Injectable({
  providedIn: 'root'
})

export class HideContentService {

  constructor(private token: TokenStorageService) {}

  hideContent(): boolean {
    return this.token.getUser() === null
  }

  hideContentUser(): boolean {
    if (this.hideContent()){
      return false;
    }
    else{
      return this.token.getUser().roles.includes('Admin');
    }
  }
}
