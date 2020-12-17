import { AsanaCredentials } from "../../src/utils/credentials/asana_credentials";
import { GoogleCredentials } from "../../src/utils/credentials/google_credentials";
import { UserCredentials } from "../../src/utils/credentials/user_credentials";

const example_google_credentials = new GoogleCredentials({
  refresh_token: 'example_refresh_token',
  expiry_date: 1000,
  access_token: 'example_access_token',
  token_type: 'example_token_type',
  id_token: 'example_id_token',
  scope: 'example_scope',
});

const example_asana_credential = new AsanaCredentials({
  refresh_token: 'example_refresh_token',
  access_token: 'access_token',
  expires_in: 1000,
});

export const example_user_credentials = new UserCredentials({
  google: example_google_credentials, 
  asana: example_asana_credential,
});
