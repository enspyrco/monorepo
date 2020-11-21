import * as express from 'express';

import * as google_oauth2 from './google_oauth2_client';

// generate a url that asks permissions for Drive and Docs scopes
const scopes = ['https://www.googleapis.com/auth/documents',
   'https://www.googleapis.com/auth/documents.readonly',
   'https://www.googleapis.com/auth/drive',
   'https://www.googleapis.com/auth/drive.file',
   'https://www.googleapis.com/auth/drive.readonly'];

// Get the code from the request, call retrieveAuthToken and return the response
const authorizationUrlCallback = async (req: any, res: any) => {

  // access_type is either 'online' (default) or 'offline' (gets refresh_token)
  const url = google_oauth2.client.generateAuthUrl({  
    access_type: 'offline',
    scope: scopes,
    state: req.query.state,
  });

  res.redirect(url);
}

// Export an express app that uses the callback we created.
export const redirectToAuthorization = express().use(authorizationUrlCallback);
