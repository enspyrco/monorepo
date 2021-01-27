import * as admin from 'firebase-admin';
import { FirebaseAdminInterface } from "../firebase_admin";

export class FirebaseAdmin implements FirebaseAdminInterface {

  private static instance: FirebaseAdmin;
  
  private constructor() { 
    admin.initializeApp();

    admin.firestore().settings({
      ignoreUndefinedProperties: true,
      host: 'localhost:8080',
      ssl: false,
    });
  }

  static getInstance(): FirebaseAdmin {
    if (!FirebaseAdmin.instance) {
      FirebaseAdmin.instance = new FirebaseAdmin();
    }

    return FirebaseAdmin.instance;
  }

  getFirestore(): FirebaseFirestore.Firestore {
    return admin.firestore();
  }
  getAuth(): admin.auth.Auth {
    return admin.auth();
  }

}