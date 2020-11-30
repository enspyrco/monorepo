import { docs_v1, google } from 'googleapis';
import { AuthenticatedClient } from '../auth/authenticated_client';

export class DocsAPI {
  rootFolderId: string = '1poq_tgqfzOF34pJFvdbPgYgI_tD6Mseb';
  client!: AuthenticatedClient;
  docs!: docs_v1.Docs;

  // eslint-disable-next-line @typescript-eslint/no-empty-function
  private constructor() {};

  static async for(uid: string) : Promise<DocsAPI> {
    const docsAPI = new DocsAPI();
    
    docsAPI.client = await AuthenticatedClient.getInstanceFor(uid);
    docsAPI.docs = google.docs({version: 'v1', auth: docsAPI.client.getOAuth2Client()});

    return docsAPI;
  }

  async createDoc(title: string) : Promise<docs_v1.Schema$Document> {
    const createResponse = await this.docs.documents.create({
      requestBody: {
        'title': title,
      },
    });

    return createResponse.data;
  }

}