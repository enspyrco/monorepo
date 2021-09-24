import * as admin from 'firebase-admin';
import { Firestore } from '@google-cloud/firestore';
import { auth } from 'firebase-admin/lib/auth';

export interface FirebaseAdminInterface {
  getFirestore() : Firestore;
  getAuth() : auth.Auth;
}

export class FirebaseAdmin implements FirebaseAdminInterface {
  
  private static instance: FirebaseAdmin;
  
  private constructor() { 
    admin.initializeApp();

    admin.firestore().settings({ 
      ignoreUndefinedProperties: true,
    });
  }

  static getInstance(): FirebaseAdmin {
    if (!FirebaseAdmin.instance) {
      FirebaseAdmin.instance = new FirebaseAdmin();
    }

    return FirebaseAdmin.instance;
  }

  getFirestore() : Firestore {
    return admin.firestore();
  }

  getAuth() : auth.Auth {
    return admin.auth();
  }

}