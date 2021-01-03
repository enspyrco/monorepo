import { WriteResult } from "@google-cloud/firestore";
import { AsanaCredentials } from "../../../src/models/credentials/asana_credentials";
import { GoogleCredentials } from "../../../src/models/credentials/google_credentials";
import { UserCredentials } from "../../../src/models/credentials/user_credentials";
import { CredentialsService } from "../../../src/services/credentials_service";

const uid = 'uid';

describe('CredentialsService', () => {
  test('retrieveCredentials() throws if there are no credentials found.', async () => {

    const credentialsService = CredentialsService.getInstance();

    let caughtError : Error | null = null;
    try {
      await credentialsService.retrieveCredentials(uid);  
    } catch(error) {
      caughtError = error;
    }
    
    expect(caughtError).not.toBeNull;
  });

  test('retrieveCredentials() returns an object of type UserCredentials.', async () => {

    const credentialsService = CredentialsService.getInstance();

    const credentials : UserCredentials = await credentialsService.retrieveCredentials(uid);
    
    expect(credentials.google).not.toBeUndefined;
    expect(credentials.asana).toBeUndefined;
  });

  test('saveGoogleCredentials() saves the supplied credentials', async () => {

    const credentialsService = CredentialsService.getInstance();

    const credentials : GoogleCredentials = new GoogleCredentials({access_token: 'access_token'});

    const result: FirebaseFirestore.WriteResult = await credentialsService.saveGoogleCredentials(uid, credentials);

    console.log(result);

    expect(result instanceof WriteResult);
    
  });

  test('saveAsanaCredentials() saves the supplied credentials', async () => {

    const credentialsService = CredentialsService.getInstance();

    const credentials : AsanaCredentials = new AsanaCredentials({access_token: 'access_token'});

    const result: FirebaseFirestore.WriteResult = await credentialsService.saveAsanaCredentials(uid, credentials);

    console.log(result);

    expect(result instanceof WriteResult);
    
  });

});
