// import { SecretManagerServiceClient, protos } from "@google-cloud/secret-manager";
// import { mock } from "jest-mock-extended";
// import { mocked } from "ts-jest";
// import { SecretManager } from "../../../src/services/secret_manager";

describe('SecretManager.', () => {
  // test('retrieveSecret() create a secret if none found.', async () => {

  //   const clientMock = mocked(SecretManagerServiceClient);
  //   clientMock.mockImplementationOnce('getSecret')
    
  //   clientMock.getSecret.mockImplementationOnce(() => {
  //     throw new Error();
  //   });

  //   const secretMock = mock<protos.google.cloud.secretmanager.v1.ISecret>();

  //   clientMock.getSecret.mockReturnValueOnce(Promise.resolve([secretMock]));
    
  //   clientMock.createSecret.mockReturnValueOnce(Promise.resolve([secretMock])); 
  //   const secretManager = SecretManager.getInstance(clientMock);

  //   const result = await secretManager.retrieveSecret('uid');

  //   expect(result).toBe(null);

  //   expect(clientMock.getSecret).toHaveBeenCalled();

  //   expect(clientMock.createSecret).toHaveBeenCalled();
    
  // });

  test('saveAsanaCredentials ...', async () => {
    // const clientMock = mock<SecretManagerServiceClient>();

    // clientMock.listSecretVersions.mockReturnValueOnce()

    // const secretManager = SecretManager.getInstance(clientMock);

    return true;
    
  });
});
