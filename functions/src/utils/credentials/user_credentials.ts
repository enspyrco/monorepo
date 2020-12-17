import { AsanaCredentials } from './asana_credentials';
import { GoogleCredentials } from './google_credentials';

export class UserCredentials {
  readonly google: GoogleCredentials;
  readonly asana: AsanaCredentials;

  constructor(data: {google: GoogleCredentials, asana: AsanaCredentials}) {
    this.google = data.google;
    this.asana = data.asana;
  }
}
