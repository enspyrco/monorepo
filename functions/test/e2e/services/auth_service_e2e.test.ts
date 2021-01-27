import { WriteResult } from "@google-cloud/firestore";
import { AsanaCredentials } from "../../../src/models/credentials/asana_credentials";
import { GoogleCredentials } from "../../../src/models/credentials/google_credentials";
import { UserCredentials } from "../../../src/models/credentials/user_credentials";
import { AuthService } from "../../../src/services/auth_service";

const uid = 'uid';

describe('AuthService', () => {
  test('retrieveCredentials() throws if there are no credentials found.', async () => {

    const authService = AuthService.getInstance();

    let caughtError : Error | null = null;
    try {
      await authService.retrieveCredentials(uid);  
    } catch(error) {
      caughtError = error;
    }
    
    expect(caughtError).not.toBeNull;
  });

  test('retrieveCredentials() returns an object of type UserCredentials.', async () => {

    const authService = AuthService.getInstance();

    const credentials : UserCredentials = await authService.retrieveCredentials(uid);
    
    expect(credentials.google).not.toBeUndefined;
    expect(credentials.asana).toBeUndefined;
  });

  test('saveGoogleCredentials() saves the supplied credentials', async () => {

    const authService = AuthService.getInstance();

    const credentials : GoogleCredentials = new GoogleCredentials({access_token: 'access_token'});

    const result: WriteResult = await authService.saveGoogleCredentials(uid, credentials);

    console.log(result);

    expect(result instanceof WriteResult);
    
  });

  test('saveAsanaCredentials() saves the supplied credentials', async () => {

    const authService = AuthService.getInstance();

    const credentials : AsanaCredentials = new AsanaCredentials({access_token: 'access_token'});

    const result: WriteResult = await authService.saveAsanaCredentials(uid, credentials);

    console.log(result);

    expect(result instanceof WriteResult);
    
  });

});
