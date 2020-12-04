import * as functions from 'firebase-functions';
import * as express from 'express';
import { google } from 'googleapis';
import { OAuth2Client } from 'google-auth-library';
import * as querystring from 'querystring';
import axios from 'axios';

import * as project_credentials from '../project_credentials.json';
import { firebaseAdmin } from '../utils/firebase_admin';
import { secretManager } from '../utils/credentials/secret_manager';
import { PeopleAPI } from '../google_apis/people';
import { ProfileData } from '../utils/database';

const auth = firebaseAdmin.getAuth();

// Get the code from the request, call retrieveAuthToken and return the response
const exchangeCodeForGoogleTokens = async (req: any, res: any) => {
  try {

    // If we can't get both the code and state from the request it's probably an error message, just send back the original url
    if(req.query.code === null || typeof req.query.code === "undefined" || req.query.state === null || typeof req.query.state === "undefined") {
      return res.send(req.originalUrl);
    }

    functions.logger.log(`Exchanging code for tokens...`);

    const oauth2 : OAuth2Client = new google.auth.OAuth2(
      project_credentials.google.id,
      project_credentials.google.secret,
      project_credentials.google.redirect_url,
    );

    const tokenResponse = await oauth2.getToken(req.query.code);

    functions.logger.log('Setting credentials in oauth2 client...');

    oauth2.setCredentials(tokenResponse.tokens);
    
    functions.logger.log('Requesting an email with PeopleAPI...');

    const peopleAPI = new PeopleAPI(oauth2);
    const email = await peopleAPI.getEmail();

    functions.logger.log('Converting email to Firebase UID...');

    const userRecord = await auth.getUserByEmail(email);

    functions.logger.log('Saving tokens in SecretManager...');
    
    await secretManager.save(userRecord.uid, 'google', tokenResponse.tokens);

    functions.logger.log('Saving finished state to database...');

    const profileData = new ProfileData(userRecord.uid, 'google', 'authorized');
    await profileData.save();

    // Close the window, the entry in database will update the UI of the original window 
    return res.send(`
      <head>
      </head>
      <body>
        <div>Credentials have been saved, you can close this window.</div>
      </body>
      <script>
        window.close();
      </script>
    `);
  } catch(error) {
    functions.logger.error(error);
    return res.status(500).send(`Something went wrong while exchanging the code. \n ${error}`);
  }
};

// Export an express app that uses the callback we created.
export const exchangeCodeWithGoogle = express().use(exchangeCodeForGoogleTokens);



// Get the code from the request, call retrieveAuthToken and return the response
const exchangeCodeForAsanaTokens = async (req: any, res: any) => {
  try {

    // If we can't get both the code and state from the request it's probably an error message, just send back the original url
    if(req.query.code === null || typeof req.query.code === "undefined" || req.query.state === null || typeof req.query.state === "undefined") {
      return res.send(req.originalUrl);
    }

    functions.logger.log(`Exchanging code for tokens...`);

    // Build the post string from an object
    const post_data = querystring.stringify({
      'grant_type' : 'authorization_code',
      'client_id' : project_credentials.asana.client_id,
      'client_secret' : project_credentials.asana.client_secret,
      'redirect_uri' : project_credentials.asana.redirect_uri,
      'code' : req.query.code,
    });

    const resp = await axios.post('https://app.asana.com/-/oauth_token', post_data);

    const email = resp.data.data.email;
    
    functions.logger.log('Converting email to Firebase UID...');

    const userRecord = await auth.getUserByEmail(email);

    functions.logger.log('Saving tokens in SecretManager...');
    
    const tokens = {
      refresh_token: resp.data.refresh_token,
      access_token: resp.data.access_token,
      expires_in: resp.data.expires_in,
    }

    await secretManager.save(userRecord.uid, 'asana', tokens);

    functions.logger.log('Saving finished state to database...');

    const profileData = new ProfileData(userRecord.uid, 'asana', 'authorized');
    await profileData.save();

    // Close the window, the entry in database will update the UI of the original window 
    return res.send(`
      <head>
      </head>
      <body>
        <div>Credentials have been saved, you can close this window.</div>
      </body>
      <script>
        window.close();
      </script>
    `);
  } catch(error) {
    functions.logger.error(error);
    return res.status(500).send(`Something went wrong while exchanging the code. \n ${error}`);
  }
};

// Export an express app that uses the callback we created.
export const exchangeCodeWithAsana = express().use(exchangeCodeForAsanaTokens);
