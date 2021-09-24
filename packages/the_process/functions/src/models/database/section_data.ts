export class SectionData implements DatabaseEntry {
  readonly path: string;
  readonly data: Record<string, unknown>;

  constructor(data?: {name: string, folderId: string, useCasesDocId: string}) {
    this.path = 'sections';
    this.data = data ?? {};
  }

  set name(name: string) {
    this.data['name'] = name;
  }

  set folderId(folderId: string) {
    this.data['folderId'] = folderId;
  }

  set useCasesDocId(useCasesDocId: string) {
    this.data['useCasesDocId'] = useCasesDocId;
  }
}