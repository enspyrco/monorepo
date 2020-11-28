import { drive_v3, google } from 'googleapis';
import { Credentials } from 'google-auth-library';

import { secretManager } from '../utils/secret_manager';
import * as project_credentials from '../project_credentials.json';
import { unNull } from '../utils/problem_utils';

export class DriveAPI {
  uid : string;
  rootFolderId: string;
  client = new google.auth.OAuth2(
    project_credentials.id,
    project_credentials.secret,
    project_credentials.redirect_url,
  );
  drive: drive_v3.Drive;

  constructor(uid: string) {
    this.uid = uid;
    this.rootFolderId = '1poq_tgqfzOF34pJFvdbPgYgI_tD6Mseb';
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

  async createFolder(name: string) : Promise<drive_v3.Schema$File> {
    this.throwIfNotAuthenticated();

    const filesResponse = await this.drive.files.create({
      requestBody: {
        'name': name,
        'mimeType': 'application/vnd.google-apps.folder',
        'parents': [this.rootFolderId],
      },
      fields: 'id',
    });

    const id = unNull(filesResponse.data.id, 'Creating folder did not return an id.');

    const permissionParams : drive_v3.Params$Resource$Permissions$Create = {
      fileId: id,
      requestBody: {
        emailAddress: 'the-crowdleague-team@googlegroups.com',
        type: 'group',
        role: 'writer',
      },
    }

    const permissionResponse = await this.drive.permissions.create(permissionParams);

    return permissionResponse.data;
  }

}