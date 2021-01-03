import { AsanaCredentials } from './asana_credentials';
import { GoogleCredentials } from './google_credentials';

type IndexedData = {
  [field: string]: unknown;
}

export class UserCredentials {
  google: GoogleCredentials | undefined;
  asana: AsanaCredentials | undefined;

  constructor(credentialData: IndexedData) {
    this.google = credentialData['google'] as GoogleCredentials;
    this.asana = credentialData['asana'] as AsanaCredentials;
  }
}
