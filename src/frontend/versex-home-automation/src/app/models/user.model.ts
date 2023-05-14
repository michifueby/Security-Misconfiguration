import { Time } from "@angular/common";

export interface User {
  userName: string;
  firstName: string;
  lastName: string;
  email: string
  token: string;
  password: string;
  claimDuration: Time;
  issueTime: Date;
  roles: Array<string>
}
