import * as functions from 'firebase-functions';
import * as express from 'express';
import { google } from 'googleapis';
import { OAuth2Client } from 'google-auth-library';

import * as project_credentials from '../../project_credentials.json';
import { PeopleAPI } from '../../services/google_apis/people_api';
import { ProfileData } from '../../models/database/profile_data';
import { CredentialsService } from '../../services/credentials_service';
import { FirebaseAdmin } from '../../services/firebase_admin';
import { DatabaseService } from '../../services/database_service';

// Get the code from the request, call retrieveAuthToken and return the response
// eslint-disable-next-line @typescript-eslint/no-explicit-any
const exchangeCodeForGoogleTokens = async (req: any, res: any) => {
  try {

    const authService = FirebaseAdmin.getInstance().getAuth();
    const credentialsService = CredentialsService.getInstance();

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
    
    const tokenResponse = await oauth2.getToken(req.query.code.toString());

    functions.logger.log('Setting credentials in oauth2 client...');

    oauth2.setCredentials(tokenResponse.tokens);
    
    functions.logger.log('Requesting an email with PeopleAPI...');

    const peopleAPI = new PeopleAPI(oauth2);
    const email = await peopleAPI.getEmail();

    functions.logger.log('Converting email to Firebase UID...');

    const userRecord = await authService.getUserByEmail(email);

    const databaseService = await DatabaseService.getInstanceFor(userRecord.uid);

    functions.logger.log('Saving tokens...');
    
    await credentialsService.saveGoogleCredentials(userRecord.uid, {...tokenResponse.tokens});

    functions.logger.log('Saving finished state to database...');

    const profileData = new ProfileData({uid: userRecord.uid, provider: 'google', authState: 'authorized'});
    await databaseService.save(profileData);

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
export const exchangeWithGoogleExpressApp = express().use(exchangeCodeForGoogleTokens);

