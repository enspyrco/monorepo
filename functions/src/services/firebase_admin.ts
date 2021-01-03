import * as admin from 'firebase-admin';
declare let process : {
  env: {
    GCP_PROJECT: string
  }
}

export class FirebaseAdmin {
  
  private static instance: FirebaseAdmin;
  
  private constructor() { 
    admin.initializeApp();

    const settingsValues : { [field: string] : unknown } = { 
      ignoreUndefinedProperties: true,
    };
    // if(!process.env.GCP_PROJECT) {
    //   settingsValues.host = 'localhost:8080';
    //   settingsValues.ssl = false;
    // }
    // Configure firestore settings.
    admin.firestore().settings(settingsValues);

  }

  public static getInstance(): FirebaseAdmin {
    if (!FirebaseAdmin.instance) {
      FirebaseAdmin.instance = new FirebaseAdmin();
    }

    return FirebaseAdmin.instance;
  }

  public getFirestore() : FirebaseFirestore.Firestore {
    return admin.firestore();
  }

  public getAuth() : admin.auth.Auth {
    return admin.auth();
  }

}