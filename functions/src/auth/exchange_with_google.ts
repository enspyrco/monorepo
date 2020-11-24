import * as functions from 'firebase-functions';
import * as express from 'express';
import { firebaseAdmin } from '../utils/firebase_admin';

import * as google_oauth2 from '../google_apis/client';
import { secretManager } from './secret_manager';
import { PeopleAPI } from '../google_apis/people';
import { ProfileData } from './database';

const auth = firebaseAdmin.getAuth();

// Get the code from the request, call retrieveAuthToken and return the response
const exchangeCodeForToken = async (req: any, res: any) => {
  try {

    // If we can't get both the code and state from the request it's probably an error message, just send back the original url
    if(req.query.code === null || req.query.code === undefined || req.query.state === null || req.query.state === undefined) {
      return res.send(req.originalUrl);
    }

    functions.logger.log(`Exchanging code for tokens...`);

    const tokenResponse = await google_oauth2.client.getToken(req.query.code);

    if(tokenResponse.tokens.access_token === null) {
      throw Error('No access token in response.');
    }

    functions.logger.log('Adding tokens to client.');

    google_oauth2.client.setCredentials(tokenResponse.tokens);
    
    functions.logger.log('Requesting an email with PeopleAPI.');

    const peopleAPI = new PeopleAPI(google_oauth2.client);
    const email = await peopleAPI.getEmail();
    const userRecord = await auth.getUserByEmail(email);

    functions.logger.log('Saving tokens in SecretManager.');
    
    await secretManager.save(userRecord.uid, tokenResponse.tokens);

    functions.logger.log('Saving finished state to database.');

    const profileData = new ProfileData(userRecord.uid, 'authorized');
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
export const exchangeCodeWithGoogle = express().use(exchangeCodeForToken);
