import { FieldValue } from "@google-cloud/firestore";
import { db } from "../firebase_admin";

export class ProfileData {
  uid: string;
  provider: string;
  authState: string;

  constructor(uid: string, provider: string, authState: string) {
      this.uid = uid;
      this.provider = provider;
      this.authState = authState;
  }
  async save() {
      const providerName = this.provider+'Auth';
      await db.doc(`profiles/${this.uid}`).set({
          [providerName] : this.authState,
      }, {merge: true});
  }
  async failed(failures: any[]) {
      const data = {
          'uid': this.uid,
          'failures': failures,
      };
      await db.collection(`users/${this.uid}/processing_failures`).add({
          'type': 'ProfileData',
          'createdOn': FieldValue.serverTimestamp(),
          'message': JSON.stringify(data),
          'data': data,
      });
  }
}