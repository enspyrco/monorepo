import * as express from 'express';

import { google } from 'googleapis';
import { OAuth2Client } from 'google-auth-library';

import * as project_credentials from '../project_credentials.json';

// generate a url that asks permissions for Drive and Docs scopes
const scopes = [
  'https://www.googleapis.com/auth/userinfo.email',
  'https://www.googleapis.com/auth/userinfo.profile',
  'https://www.googleapis.com/auth/documents',
  'https://www.googleapis.com/auth/documents.readonly',
  'https://www.googleapis.com/auth/drive',
  'https://www.googleapis.com/auth/drive.file',
  'https://www.googleapis.com/auth/drive.readonly',
];

// Get the code from the request, call retrieveAuthToken and return the response
const authorizationUrlCallback = async (req: any, res: any) => {

  const oauth2 : OAuth2Client = new google.auth.OAuth2(
    project_credentials.id,
    project_credentials.secret,
    project_credentials.redirect_url,
  );

  // access_type is either 'online' (default) or 'offline' (gets refresh_token)
  const url = oauth2.generateAuthUrl({  
    access_type: 'offline',
    scope: scopes,
    state: req.query.state,
    prompt: 'consent',
  });

  res.redirect(url);
}

// Export an express app that uses the callback we created.
export const redirectToAuthorization = express().use(authorizationUrlCallback);
