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
            'createdOn': firestore.FieldValue.serverTimestamp(),
            'message': JSON.stringify(data),
            'data': data,
        });
    }
}

export class SectionData {
    uid: string;
    number: number;
    name: string;
    folderId: string;
    useCasesDocId: string;

    constructor(uid: string, number: number, name: string, folderId: string, useCasesDocId: string) {
        this.uid = uid;
        this.number = number;
        this.name = name;
        this.folderId = folderId;
        this.useCasesDocId = useCasesDocId;
    }
    async save() : Promise<firestore.DocumentReference<firestore.DocumentData>> {
        return db.collection('sections').add({
            'createdOn': firestore.FieldValue.serverTimestamp(),
            'createdBy': this.uid,
            'number': this.number,
            'name': this.name,
            'folderId': this.folderId,
            'useCasesDocId': this.useCasesDocId,
        });
    }
    async failed(failures: any[])  : Promise<firestore.DocumentReference<firestore.DocumentData>> {
        const data = {
            'uid': this.uid,
            'failures': failures,
        };
        return db.collection(`users/${this.uid}/processing_failures`).add({
            'type': 'SectionData',
            'createdOn': firestore.FieldValue.serverTimestamp(),
            'message': JSON.stringify(data),
            'data': data,
        });
    }
}

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
            'createdOn': firestore.FieldValue.serverTimestamp(),
            'message': JSON.stringify(data),
            'data': data,
        });
    }
}