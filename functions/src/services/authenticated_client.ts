import * as functions from 'firebase-functions';
import { google } from 'googleapis';
import { Credentials, OAuth2Client } from 'google-auth-library';

import * as project_credentials from '../project_credentials.json';
import { unNull } from '../utils/null_safety_utils';
import { GoogleCredentials } from '../models/credentials/google_credentials';
import { SecretManager } from './secret_manager';

/// An [OAuth2Client] 
// 
// The instance is a map 
export class AuthenticatedClient {
  
  private static instance = new Map<string, AuthenticatedClient>();

  readonly uid : string;
  private tokens_expiry!: number;
  private oauth2 : OAuth2Client = new google.auth.OAuth2(
    project_credentials.google.id,
    project_credentials.google.secret,
    project_credentials.google.redirect_url,
  );

  private constructor(uid: string) {
    this.uid = uid;
    
    // Add a callback to respond to token refresh 
    this.oauth2.on('tokens', async (tokens) => {
      this.logAnonymized(tokens);
      await this.storeIfNew(tokens);
    });
  }

  static async getInstanceFor(uid: string) : Promise<AuthenticatedClient> {

    if (!AuthenticatedClient.instance.get(uid)) {
      // Create an instance and set the credentials 
      const newClient = new AuthenticatedClient(uid);
      const userCredentials = await SecretManager.getInstance().retrieveUserCredentials(uid);

      if(userCredentials.google !== undefined) {
        
        newClient.oauth2.setCredentials(userCredentials.google);
        // Make sure the expiry is not missing and set 
        const checkedExpiry = unNull(userCredentials.google.expiry_date, `The expiry in the secret manager's google credentials was missing for ${uid}.`) as number;
        newClient.setExpiry(checkedExpiry);

        AuthenticatedClient.instance.set(uid, newClient);

      }
    }

    const client = AuthenticatedClient.instance.get(uid);
    
    const checkedClient = unNull(client, `The AuthenticatedClient instance could not find an entry for ${uid}`) as AuthenticatedClient;
    
    return checkedClient;
  }

  getOAuth2Client() : OAuth2Client {
    return this.oauth2;
  }

  setExpiry(expiry: number) : void {
    this.tokens_expiry = expiry;
  }

  async storeIfNew(credentials: GoogleCredentials) : Promise<void> {

    unNull(credentials.access_token, 'No access token.');
    const newExpiry = unNull(credentials.expiry_date, 'No new expiry date.') as number;

    if(newExpiry > this.tokens_expiry) {
      functions.logger.info('The tokens event fired with a new expiry.');
    }
    else {
      functions.logger.info('The tokens event fired but the expiry was not new.');
      return;
    }

    if(credentials.refresh_token === null || typeof credentials.refresh_token === "undefined") {
      functions.logger.log('The tokens event fired but there was no refresh token.');
      return;
    }

    if(newExpiry > this.tokens_expiry) {
      functions.logger.log('Saving tokens under UID in SecretManager...');
      await SecretManager.getInstance().saveGoogleCredentials(this.uid, credentials);
    }
  }

  logAnonymized(tokens: Credentials) : void {
    const id_str = tokens.id_token?.substr(0,5)+'...';
    const refresh_str = tokens.refresh_token?.substr(0,5)+'...';
    const access_str = tokens.access_token?.substr(0,5)+'...';

    const anonymisedCredentials = {
      'id_token': id_str,
      'refresh_token': refresh_str,
      'access_token': access_str,
      'expiry': tokens.expiry_date,
    }
    
    functions.logger.warn('Anonymized credentials: ', anonymisedCredentials); 
  }

}