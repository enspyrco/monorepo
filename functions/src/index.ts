import * as functions from 'firebase-functions';

import { createSectionCallback } from './functions/database/create_section';
import { exchangeWithAsanaExpressApp } from './functions/http/get_asana_authorization';
import { exchangeWithGoogleExpressApp } from './functions/http/get_google_authorization';
import { redirectToAsanaExpressApp } from './functions/http/redirect_to_asana';
import { redirectToGoogleExpressApp } from './functions/http/redirect_to_google';
import { saveDetails } from './functions/auth/on_first_sign_in';

// server flow 
export const startGoogleAuthorization = functions.https.onRequest(redirectToGoogleExpressApp);
export const startAsanaAuthorization = functions.https.onRequest(redirectToAsanaExpressApp);
export const completeGoogleAuthorization = functions.https.onRequest(exchangeWithGoogleExpressApp);
export const completeAsanaAuthorization = functions.https.onRequest(exchangeWithAsanaExpressApp);

// when a new account is created, add auth details to the database
export const saveDetailsOnFirstSignIn = functions.auth.user().onCreate(saveDetails);

// when a user requests a new section, create a folder 
export const createSection = functions.firestore.document('new/{userId}').onCreate(createSectionCallback);
