export interface AsanaCredentialsInterface { 
  readonly refresh_token: string;
  readonly access_token: string;
  readonly expires_in: number;
}

export class AsanaCredentials implements AsanaCredentialsInterface {
  readonly refresh_token: string;
  readonly access_token: string;
  readonly expires_in: number;

  constructor(data: {refresh_token: string, access_token: string, expires_in: number}) {
    this.refresh_token = data.refresh_token;
    this.access_token = data.access_token;
    this.expires_in = data.expires_in;
  }
}