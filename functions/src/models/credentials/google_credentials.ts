export interface GoogleCredentialsInterface {
  readonly refresh_token?: string | null;
  readonly expiry_date?: number | null;
  readonly access_token?: string | null;
  readonly token_type?: string | null;
  readonly id_token?: string | null;
  readonly scope?: string;
}

export class GoogleCredentials implements GoogleCredentialsInterface {
  readonly refresh_token?: string | null;
  readonly expiry_date?: number | null;
  readonly access_token?: string | null;
  readonly token_type?: string | null;
  readonly id_token?: string | null;
  readonly scope?: string;

  constructor(data: {
    refresh_token?: string | null,
    expiry_date?: number | null,
    access_token?: string | null,
    token_type?: string | null,
    id_token?: string | null,
    scope?: string;
  }) {
    this.refresh_token = data.refresh_token;
    this.expiry_date = data.expiry_date;
    this.access_token = data.access_token;
    this.token_type = data.token_type;
    this.id_token = data.id_token;
    this.scope = data.scope;
  }
}