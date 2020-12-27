import * as functions from 'firebase-functions';
import * as express from 'express';
import * as querystring from 'querystring';
import * as service_locator from '../../utils/service_locator';
import axios from 'axios';

import * as project_credentials from '../../project_credentials.json';
import { ProfileData } from '../../models/database/profile_data';
import { firebaseAdmin } from '../../utils/firebase_admin';
import { SecretManager } from '../../services/secret_manager';

const auth = firebaseAdmin.getAuth();

// Get the code from the request, call retrieveAuthToken and return the response
// eslint-disable-next-line @typescript-eslint/no-explicit-any
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

    await SecretManager.getInstance().saveAsanaCredentials(userRecord.uid, tokens);

    functions.logger.log('Saving finished state to database...');

    const profileData = new ProfileData({uid: userRecord.uid, provider: 'asana', authState: 'authorized'});
    const databaseService = await service_locator.getDatabaseService(userRecord.uid);
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
export const exchangeWithAsanaExpressApp = express().use(exchangeCodeForAsanaTokens);
