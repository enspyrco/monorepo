import { AsanaCredentials } from './asana_credentials';
import { GoogleCredentials } from './google_credentials';

export class UserCredentials {
  google: GoogleCredentials | undefined;
  asana: AsanaCredentials | undefined;

  constructor(google?: GoogleCredentials, asana?: AsanaCredentials) {
    this.google = google;
    this.asana = asana;
  }
}
