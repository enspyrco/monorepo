import { drive_v3, google } from 'googleapis';
import { Credentials } from 'google-auth-library';

import { secretManager } from '../utils/secret_manager';
import * as project_credentials from '../project_credentials.json';

export class DriveAPI {
  uid : string;
  client = new google.auth.OAuth2(
    project_credentials.id,
    project_credentials.secret,
    project_credentials.redirect_url,
  );
  drive: drive_v3.Drive;

  constructor(uid: string) {
    this.uid = uid;
    this.drive = google.drive({version: 'v3', auth: this.client});
  }

  throwIfNotAuthenticated() {
    if(!this.client.credentials) {
      throw Error('The client for DriveAPI needs to be authenticated');
    }
  }
  
  async authenticate() {
    const tokens : Credentials = await secretManager.retrieveCredentials(this.uid);
    this.client.setCredentials(tokens);
  }

  async createFolder(name: string, parentId: string) : Promise<drive_v3.Schema$File> {
    this.throwIfNotAuthenticated();

    const response = await this.drive.files.create({
      requestBody: {
        'name': name,
        'mimeType': 'application/vnd.google-apps.folder',
      },
      fields: 'id',
    });

    // const response = await this.drive.files.create({
    //   media: {
    //     mimeType: 'application/vnd.google-apps.folder',
    //   },
    //   requestBody: {
    //     name: name,
    //   },
    // });

    return response.data;
  }

}