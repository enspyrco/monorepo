import { DocumentData } from "@google-cloud/firestore";
import { UserCredentials } from "../models/credentials/user_credentials";
import { FirebaseAdmin } from "./firebase_admin";
import { unNull } from "../utils/null_safety_utils";
import { GoogleCredentials } from "../models/credentials/google_credentials";
import { AsanaCredentials } from "../models/credentials/asana_credentials";

export class CredentialsService {
  private readonly firestore: FirebaseFirestore.Firestore;
  private static instance: CredentialsService | null;

  private constructor(firestore? : FirebaseFirestore.Firestore) {
    this.firestore = firestore ?? FirebaseAdmin.getInstance().getFirestore();
  }

  static getInstance(firestore? : FirebaseFirestore.Firestore) : CredentialsService {
    if (!CredentialsService.instance) {
      CredentialsService.instance = new CredentialsService(firestore);
    }

    return CredentialsService.instance;
  }

  static deleteInstance() : void {
    CredentialsService.instance = null;
  }

  public async saveGoogleCredentials(uid: string, credentials: GoogleCredentials) : Promise<FirebaseFirestore.WriteResult> {
    return this.firestore.doc('credentials/'+uid).set({google : {...credentials}}, {merge: true});
  }

  public async saveAsanaCredentials(uid: string, credentials: AsanaCredentials) : Promise<FirebaseFirestore.WriteResult> {
    return this.firestore.doc('credentials/'+uid).set({asana : {...credentials}}, {merge: true});
  }

  public async retrieveCredentials(uid: string) : Promise<UserCredentials> {
    const snapshot = await this.firestore.doc('credentials/'+uid).get();
    const data = snapshot.data();

    const checkedData = unNull(data, 'Retrieving credentials produced \'unknown\' type.') as DocumentData;

    return new UserCredentials(checkedData);
  }
}
