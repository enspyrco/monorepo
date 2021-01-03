import { docs_v1, google } from 'googleapis';
import { AuthenticatedClient } from '../authenticated_client';

export interface DocsAPIInterface {
  readonly uid: string;
  readonly client: AuthenticatedClient;
  readonly rootFolderId: string;
  createDoc(title: string) : Promise<docs_v1.Schema$Document>;
}

// we make a new api object each time but the AuthenticatedClient used by each api object is a singleton map 
export class DocsAPI implements DocsAPIInterface {
  readonly uid!: string;
  readonly client!: AuthenticatedClient;
  readonly rootFolderId: string = '1poq_tgqfzOF34pJFvdbPgYgI_tD6Mseb';
  private docs!: docs_v1.Docs;

  private constructor(uid: string, client: AuthenticatedClient, docs: docs_v1.Docs) {
    this.uid = uid;
    this.client = client;
    this.docs = docs;
  }

  static async for(uid: string, client?: AuthenticatedClient, docs?: docs_v1.Docs) : Promise<DocsAPI> {
    const ourClient = client ?? await AuthenticatedClient.getInstanceFor(uid);
    const ourDocs = docs ?? google.docs({version: 'v1', auth: ourClient.getOAuth2Client()});
    return new DocsAPI(uid, ourClient, ourDocs);
  }

  async createDoc(title: string) : Promise<docs_v1.Schema$Document> {
    const createResponse = await this.docs.documents.create({
      requestBody: { 'title': title },
    });

    return createResponse.data;
  }

}