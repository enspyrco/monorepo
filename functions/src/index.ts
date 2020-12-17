import * as functions from 'firebase-functions';

import { saveDetails } from './auth/on_first_sign_in';
import { exchangeCodeWithGoogle, exchangeCodeWithAsana } from './auth/exchange_code_for_tokens';
import { redirectToAsana, redirectToGoogle } from './auth/redirect_to_authorization';
import { createSection } from './database_triggers/create_section';

// server flow 
export const getGoogleAuthorization = functions.https.onRequest(redirectToGoogle);
export const getAsanaAuthorization = functions.https.onRequest(redirectToAsana);
export const exchangeWithGoogle = functions.https.onRequest(exchangeCodeWithGoogle);
export const exchangeWithAsana = functions.https.onRequest(exchangeCodeWithAsana);

// when a new account is created, add auth details to the database
export const saveDetailsOnFirstSignIn = functions.auth.user().onCreate(saveDetails);

// when a user requests a new section, create a folder 
export const createSectionFolder = functions.firestore.document('new/{userId}').onCreate(createSection);
