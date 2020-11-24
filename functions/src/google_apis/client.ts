import * as functions from 'firebase-functions';
import { google } from 'googleapis';

import * as project_credentials from '../project_credentials.json';

export const client = new google.auth.OAuth2(
  project_credentials.id,
  project_credentials.secret,
  project_credentials.redirect_url
);

client.on('tokens', async (tokens) => {
  let id, refresh, access = '-';
  if(tokens.id_token) {
    id = tokens.id_token.substr(0,5)+'...';
    // decode with the firebase admin lib (TODO: doesn't work, remove?)
    // const decodedToken = await auth.verifyIdToken(tokens.id_token);
    // functions.logger.info(`uid: ${decodedToken.uid}`); 
  }
  
  if (tokens.refresh_token) {
    refresh = tokens.refresh_token.substr(0,5)+'...';
  }
  if (tokens.access_token) {
    access = tokens.access_token.substr(0,5)+'...';
  }
  
  functions.logger.info(`id: ${id} \n refresh: ${refresh} \n access: ${access}`); 

  // TODO: store the new access token

});