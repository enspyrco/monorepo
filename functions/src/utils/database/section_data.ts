import { DocumentData, DocumentReference, FieldValue } from "@google-cloud/firestore";
import { db } from "../firebase_admin";

export interface SectionDataInterface {
  readonly uid: string;
  name: string | null;
  folderId: string | null;
  useCasesDocId: string | null;

  save() : Promise<DocumentReference<DocumentData> | null>;
  onFailureSave(error: Error) : Promise<DocumentReference<DocumentData> | null>;
}

export class SectionData implements SectionDataInterface {
  readonly uid: string;
  name: string | null = null;
  folderId: string | null = null;
  useCasesDocId: string| null = null;

  constructor(uid: string) {
      this.uid = uid;
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
  
  async onFailureSave(error: Error) : Promise<DocumentReference<DocumentData>> {
    return db.collection(`processing_failures`).add({
      error: JSON.stringify(error, Object.getOwnPropertyNames(error)),
      type: 'SectionData',
      createdOn: FieldValue.serverTimestamp(),
      data: {
        uid: this.uid,
        name: this.name,
        folderId: this.folderId,
        useCasesDocId: this.useCasesDocId,
      },
    });
  }
}