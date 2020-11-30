import { firebaseAdmin } from './firebase_admin';
import { firestore } from 'firebase-admin';

const db = firebaseAdmin.getFirestore();

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
            'createdOn': firestore.FieldValue.serverTimestamp,
            'message': JSON.stringify(data),
            'data': data,
        });
    }
}

export class ProfileData {
    uid: string;
    googleAuth: string;

    constructor(uid: string, googleAuth: string) {
        this.uid = uid;
        this.googleAuth = googleAuth;
    }
    async save() {
        await db.doc(`profiles/${this.uid}`).set({
            'googleAuth' : this.googleAuth,
        }, {merge: true});
    }
    async failed(failures: any[]) {
        const data = {
            'uid': this.uid,
            'failures': failures,
        };
        await db.collection(`users/${this.uid}/processing_failures`).add({
            'type': 'googleAuth',
            'createdOn': firestore.FieldValue.serverTimestamp,
            'message': JSON.stringify(data),
            'data': data,
        });
    }
}