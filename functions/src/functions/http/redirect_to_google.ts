import * as express from 'express';

import { google } from 'googleapis';
import { OAuth2Client } from 'google-auth-library';

import * as project_credentials from '../../project_credentials.json';

////////////////////////////////////////////////////////////////////////////////
// Google  
////////////////////////////////////////////////////////////////////////////////

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

// Generate a redirect URL and respond with a redirect.
// eslint-disable-next-line @typescript-eslint/no-explicit-any
const googleRedirect = async (req: any, res: any) => {

  const oauth2 : OAuth2Client = new google.auth.OAuth2(
    project_credentials.google.id,
    project_credentials.google.secret,
    project_credentials.google.redirect_url,
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

// Generate a redirect URL and respond with a redirect. 
export const redirectToGoogleExpressApp = express().use(googleRedirect);
