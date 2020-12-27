export class ProfileData implements DatabaseEntry {
  readonly path: string;
  readonly data: Record<string, string>;

  constructor(data: {uid: string, provider: string, authState: string}) {
    this.path = `profiles/${data.uid}`;
    this.data = data;
  }
}