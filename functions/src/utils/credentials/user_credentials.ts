import { Credentials } from 'google-auth-library';
import { AsanaCredentials } from './asana_credentials';

export class UserCredentials {
  google: Credentials;
  asana: AsanaCredentials;

  constructor(google: Credentials, asana: AsanaCredentials) {
    this.google = google;
    this.asana = asana;
  }
}
