import { DocumentData, DocumentReference } from "@google-cloud/firestore";
import { SectionDataInterface } from "../../src/utils/database/section_data";

export class FakeSectionData implements SectionDataInterface {
  readonly uid: string;
  name: string | null = null;
  folderId: string | null = null;
  useCasesDocId: string| null = null;

  error: Error | null;

  constructor(uid: string) {
      this.uid = uid;
      this.error = null;
  }
  async save() : Promise<DocumentReference<DocumentData>> {
    return ({ 'doc': 'abc' } as unknown) as any;

  }
  async onFailureSave(error: Error) : Promise<DocumentReference<DocumentData>> {
    this.error = error;
    return ({ 'doc': 'abc' } as unknown) as any;
  }
}