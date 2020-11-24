import * as functions from 'firebase-functions';
import { saveDetails } from './auth/on_first_sign_in';
import { exchangeCodeWithGoogle } from './auth/exchange_with_google';
import { redirectToAuthorization } from './auth/redirect_to_authorization';

// server flow 
export const getAuthorized = functions.https.onRequest(redirectToAuthorization);
export const exchangeWithGoogle = functions.https.onRequest(exchangeCodeWithGoogle);

// when a new account is created, add auth details to the database
export const saveDetailsOnFirstSignIn = functions.auth.user().onCreate(saveDetails);

// Save the token to a document named as the user id
    // const dbEntry = new database.AuthToken(req.query.state, token_response);
    // await dbEntry.save();