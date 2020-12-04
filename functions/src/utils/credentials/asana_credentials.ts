export class AsanaCredentials {
  refresh_token: string;
  access_token: string;
  expires_in: number;

  constructor(refresh_token: string, access_token: string, expires_in: number) {
    this.refresh_token = refresh_token;
    this.access_token = access_token;
    this.expires_in = expires_in;
  }
}