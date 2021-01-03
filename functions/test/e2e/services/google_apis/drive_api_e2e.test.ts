import { DriveAPI } from "../../../../src/services/google_apis/drive_api";

describe('DriveAPI', () => {

  const uid = 'uid';

  test('createFolder() creates a folder and returns the id.', async () => {

    const driveAPI = await DriveAPI.for(uid);

    const folderId = await driveAPI.createFolder(uid);
    
    expect(folderId).not.toBeNull;
    
  });

});
