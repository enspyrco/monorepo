export class AuthToken implements DatabaseEntry {
  readonly path : string;
  readonly data: Record<string, string>;

  constructor(data: {
    uid : string,
    authProvider : string,
    accessToken : string,
    refreshToken : string,
  }) {
    this.path = 'tokens/uid';
    this.data = data;
  }
}
