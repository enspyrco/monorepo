import * as admin from 'firebase-admin';
import { Firestore } from '@google-cloud/firestore';

class FirebaseAdmin {
  
  private static instance: FirebaseAdmin;
  
  private constructor() { 
    admin.initializeApp();
  }

  public static getInstance(): FirebaseAdmin {
    if (!FirebaseAdmin.instance) {
      FirebaseAdmin.instance = new FirebaseAdmin();
    }

    return FirebaseAdmin.instance;
  }

  getAuth() : admin.auth.Auth { return admin.auth(); }

  getFirestore() : Firestore { return admin.firestore(); }
}

export const firebaseAdmin = FirebaseAdmin.getInstance();
export const db = FirebaseAdmin.getInstance().getFirestore();
export const auth = FirebaseAdmin.getInstance().getAuth();