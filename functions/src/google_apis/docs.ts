import { docs_v1, google } from 'googleapis';
import { AuthenticatedClient } from '../auth/authenticated_client';

export interface DocsAPIInterface {
  readonly uid: string;
  readonly client: AuthenticatedClient;
  readonly rootFolderId: string;
  createDoc(title: string) : Promise<docs_v1.Schema$Document>;
}

export class DocsAPI implements DocsAPIInterface {
  readonly uid!: string;
  readonly client!: AuthenticatedClient;
  readonly rootFolderId: string = '1poq_tgqfzOF34pJFvdbPgYgI_tD6Mseb';
  private docs!: docs_v1.Docs;

  private constructor(uid: string, client: AuthenticatedClient) {
    this.uid = uid;
    this.client = client;
    this.docs = google.docs({version: 'v1', auth: client.getOAuth2Client()});
  };

  static async for(uid: string) : Promise<DocsAPI> {
    const client = await AuthenticatedClient.getInstanceFor(uid);
    return new DocsAPI(uid, client);
  }

  async createDoc(title: string) : Promise<docs_v1.Schema$Document> {
    const createResponse = await this.docs.documents.create({
      requestBody: { 'title': title }
    });

    return createResponse.data;
  }

}