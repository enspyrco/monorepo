import { mock } from "jest-mock-extended";
import { AuthenticatedClient } from "../../../../src/services/authenticated_client";
import { DriveAPI } from "../../../../src/services/google_apis/drive_api";

describe('DriveAPI', () => {

  const uid = 'uid';

  test('retrieveCredentials() throws if there are no credentials found.', async () => {

    const clientMock = mock<AuthenticatedClient>();

    const driveAPI = await DriveAPI.for(uid, clientMock);

    let caughtError : Error | null = null;
    try {
      await driveAPI.createFolder(uid);
    } catch(error) {
      console.log(error);
      caughtError = error;
    }
    
    expect(caughtError).not.toBeNull;
  });

});
