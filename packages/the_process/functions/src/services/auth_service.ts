import { auth } from 'firebase-admin/lib/auth';
import { DocumentData, Firestore, WriteResult } from "@google-cloud/firestore";
import { UserCredentials } from "../models/credentials/user_credentials";
import { FirebaseAdmin } from "./firebase_admin";
import { unNull } from "../utils/null_safety_utils";
import { GoogleCredentials } from "../models/credentials/google_credentials";
import { AsanaCredentials } from "../models/credentials/asana_credentials";
import { UserRecord } from 'firebase-functions/lib/providers/auth';
import { ProviderName } from '../enums/auth/provider_name';
import { AuthorizationStep } from '../enums/auth/authorization_step';

export class AuthService {
  private readonly firestore: Firestore;
  private readonly firebaseAuth: auth.Auth;
  private static instance: AuthService | null;

  private constructor(firebaseAuth? : auth.Auth, firestore? : Firestore) {
    this.firebaseAuth = firebaseAuth ?? FirebaseAdmin.getInstance().getAuth();
    this.firestore = firestore ?? FirebaseAdmin.getInstance().getFirestore();
  }

  static getInstance(firebaseAuth? : auth.Auth, firestore? : Firestore) : AuthService {
    if (!AuthService.instance) {
      AuthService.instance = new AuthService(firebaseAuth, firestore);
    }

    return AuthService.instance;
  }

  static deleteInstance() : void {
    AuthService.instance = null;
  }

  public async getUserRecordByEmail(email : string) : Promise<UserRecord> {
    return this.firebaseAuth.getUserByEmail(email);
  }

  public async saveGoogleCredentials(uid: string, credentials: GoogleCredentials) : Promise<WriteResult> {
    return this.firestore.doc('credentials/'+uid).set({google : {...credentials}}, {merge: true});
  }

  public async saveAsanaCredentials(uid: string, credentials: AsanaCredentials) : Promise<WriteResult> {
    return this.firestore.doc('credentials/'+uid).set({asana : {...credentials}}, {merge: true});
  }

  public async updateAuthorizationStatus(uid: string, provider: ProviderName, step: AuthorizationStep) : Promise<WriteResult> {
    return this.firestore.doc('profiles/'+uid).update({
      [`authorizationStatus.${provider}`] : step,
    })
  }

  public async retrieveCredentials(uid: string) : Promise<UserCredentials> {
    const snapshot = await this.firestore.doc('credentials/'+uid).get();
    const data = snapshot.data();

    const checkedData = unNull(data, 'Retrieving credentials produced \'unknown\' type.') as DocumentData;

    return new UserCredentials(checkedData);
  }
}
