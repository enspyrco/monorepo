import * as functions from 'firebase-functions';
import * as express from 'express';
import * as google_oauth2 from './google_oauth2_client';

import { secretManager } from './secret_manager';

// Get the code from the request, call retrieveAuthToken and return the response
const exchangeCodeForToken = async (req: any, res: any) => {
  try {

    // If we can't get both the code and state from the request it's probably an error message, just send back the original url
    if(req.query.code === null || req.query.code === undefined || req.query.state === null || req.query.state === undefined) {
      return res.send(req.originalUrl);
    }

    functions.logger.log(`Exchanging code for tokens...`);

    const tokenResponse = await google_oauth2.client.getToken(req.query.code);

    functions.logger.log(`Exchanged code for tokens.`);

    await secretManager.save(req.query.state, tokenResponse.tokens);

    // Close the window, the entry in database will update the UI of the original window 
    return res.send(`
      <script>
        window.close();
      </script>
    `);
  } catch(error) {
    functions.logger.error(error);
    return res.status(500).send('Something went wrong while exchanging the code.');
  }
};

// Export an express app that uses the callback we created.
export const exchangeCodeWithGoogle = express().use(exchangeCodeForToken);
