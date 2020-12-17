import * as functions from 'firebase-functions';
import { google } from 'googleapis';
import { Credentials, OAuth2Client } from 'google-auth-library';

import { secretManager } from '../utils/credentials/secret_manager';
import * as project_credentials from '../project_credentials.json';
import { unNull } from '../utils/problem_utils';

// A Singleton class that provides a single instance 
export class AuthenticatedClient {
  
  private static instance = new Map<String, AuthenticatedClient>();

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
      const client = new AuthenticatedClient(uid);
      const userCredentials = await secretManager.retrieveCredentials(uid);
      client.oauth2.setCredentials(userCredentials.google);

      // Make sure the expiry is not missing and set 
      const checkedExpiry = unNull(userCredentials.google.expiry_date, `The expiry in the secret manager\'s google credentials was missing for ${uid}.`);
      client.setExpiry(checkedExpiry);

      AuthenticatedClient.instance.set(uid, client);
    }

    return AuthenticatedClient.instance.get(uid)!; // guaranteed to be set so we bang it
  }

  getOAuth2Client() : OAuth2Client {
    return this.oauth2;
  }

  setExpiry(expiry: number) {
    this.tokens_expiry = expiry;
  }

  async storeIfNew(tokens: Credentials) {

    unNull(tokens.access_token, 'No access token.');
    const newExpiry = unNull(tokens.expiry_date, 'No new expiry date.');

    if(newExpiry > this.tokens_expiry) {
      functions.logger.info('The tokens event fired with a new expiry.');
    }
    else {
      functions.logger.info('The tokens event fired but the expiry was not new.');
      return;
    }

    if(tokens.refresh_token === null || typeof tokens.refresh_token === "undefined") {
      functions.logger.log('The tokens event fired but there was no refresh token.');
      return;
    }

    if(newExpiry > this.tokens_expiry) {
      functions.logger.log('Saving tokens under UID in SecretManager...');
      await secretManager.save(this.uid, 'google', tokens);
    }
  }

  logAnonymized(tokens: Credentials) {
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