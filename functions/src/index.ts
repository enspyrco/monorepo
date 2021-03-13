import * as admin from 'firebase-admin';
import * as functions from 'firebase-functions';
admin.initializeApp();

import { saveDetails } from './auth/on_first_sign_in';

// when a new account is created, add auth details to the database
export const saveDetailsOnFirstSignIn = functions.auth.user().onCreate(saveDetails);