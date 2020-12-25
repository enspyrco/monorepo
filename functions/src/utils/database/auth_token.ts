import { FieldValue } from "@google-cloud/firestore";
import { db } from "../firebase_admin";

export class AuthToken {
  uid: string;
  authProvider: string;
  accessToken : string;
  refreshToken : string;

  constructor(uid: string, authProvider: string, accessToken: string, refreshToken: string) {
      this.uid = uid;
      this.authProvider = authProvider;
      this.accessToken = accessToken;
      this.refreshToken = refreshToken;
  }
  async save() {
      await db.doc(`tokens/${this.uid}`).set({
          'accessToken' : this.accessToken,
          'refreshToken' : this.accessToken,
      }, {merge: true});
  }
  async failed(failures: any[]) {
      const data = {
          'uid': this.uid,
          'failures': failures,
      };
      await db.collection(`users/${this.uid}/processing_failures`).add({
          'type': 'exchange_code_for_tokens',
          'createdOn': FieldValue.serverTimestamp(),
          'message': JSON.stringify(data),
          'data': data,
      });
  }
}
