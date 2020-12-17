import { DocumentData, DocumentReference, FieldValue } from '@google-cloud/firestore';
import { firebaseAdmin } from './firebase_admin';

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
            'createdOn': FieldValue.serverTimestamp(),
            'message': JSON.stringify(data),
            'data': data,
        });
    }
}

export interface SectionDataInterface {
    readonly uid: string;
    readonly name: string;
    readonly folderId: string;
    readonly useCasesDocId: string;

    save() : Promise<DocumentReference<DocumentData>>;
    failed(failures: any[])  : Promise<DocumentReference<DocumentData>>;
}

export class SectionData implements SectionDataInterface {
    readonly uid: string;
    readonly name: string;
    readonly folderId: string;
    readonly useCasesDocId: string;

    constructor(uid: string, name: string, folderId: string, useCasesDocId: string) {
        this.uid = uid;
        this.name = name;
        this.folderId = folderId;
        this.useCasesDocId = useCasesDocId;
    }
    async save() : Promise<DocumentReference<DocumentData>> {
        return db.collection('sections').add({
            'createdOn': FieldValue.serverTimestamp(),
            'createdBy': this.uid,
            'name': this.name,
            'folderId': this.folderId,
            'useCasesDocId': this.useCasesDocId,
        });
    }
    async failed(failures: any[])  : Promise<DocumentReference<DocumentData>> {
        const data = {
            'uid': this.uid,
            'failures': failures,
        };
        return db.collection(`users/${this.uid}/processing_failures`).add({
            'type': 'SectionData',
            'createdOn': FieldValue.serverTimestamp(),
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
            'createdOn': FieldValue.serverTimestamp(),
            'message': JSON.stringify(data),
            'data': data,
        });
    }
}