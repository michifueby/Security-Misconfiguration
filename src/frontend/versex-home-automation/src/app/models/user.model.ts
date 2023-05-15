import { Time } from "@angular/common";

export interface User {
  username: string,
  firstName: string,
  lastName: string,
  email: string,
  token: string,
  claimDuration: Time,
  issueTime: Date,
  roles: Array<string>
}
