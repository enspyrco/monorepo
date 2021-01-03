import { DocumentData } from "@google-cloud/firestore";
import { mock } from "jest-mock-extended";
import { AsanaCredentials } from "../../../src/models/credentials/asana_credentials";
import { GoogleCredentials } from "../../../src/models/credentials/google_credentials";
import { UserCredentials } from "../../../src/models/credentials/user_credentials";
import { CredentialsService } from "../../../src/services/credentials_service";

describe('CredentialsService', () => {
  test('updates the appropriate doc in credentials collection', async () => {

    // Create example data.
    
    const exampleUID = 'uid';
    const exampleAsanaCredentials = new AsanaCredentials({ access_token: 'access_token'});
    const exampleGoogleCredentials = new GoogleCredentials({ access_token: 'access_token'});

    // Create and configure mocks.

    const firestoreMock = mock<FirebaseFirestore.Firestore>();
    const documentReferenceMock = mock<FirebaseFirestore.DocumentReference<FirebaseFirestore.DocumentData>>();

    firestoreMock.doc.mockReturnValueOnce(documentReferenceMock);

    // Create the Subject Under Test.

    const credentialsService = CredentialsService.getInstance(firestoreMock);

    // Run saveAsanaCredentials function.

    await credentialsService.saveAsanaCredentials(exampleUID, exampleAsanaCredentials);
    
    expect(firestoreMock.doc).toHaveBeenLastCalledWith('credentials/'+exampleUID);

    expect(documentReferenceMock.set).toHaveBeenCalledWith({asana : {...exampleAsanaCredentials}}, {merge: true})

    // Reset the mocks.

    firestoreMock.doc.mockReturnValueOnce(documentReferenceMock);
    
    // Run saveGoogleCredentials function.

    await credentialsService.saveGoogleCredentials(exampleUID, exampleGoogleCredentials);
    
    expect(firestoreMock.doc).toHaveBeenLastCalledWith('credentials/'+exampleUID);

    expect(documentReferenceMock.set).toHaveBeenCalledWith({google : {...exampleGoogleCredentials}}, {merge: true})

    CredentialsService.deleteInstance();

  });

  test('retrieves the relevant doc from the credentials collection', async () => {
    const exampleUID = 'uid';
    const validDocumentData = {asana: {access_token: 'access_token'}, google: {refresh_token: 'access_token'}};

    const firestoreMock = mock<FirebaseFirestore.Firestore>();
    const documentReferenceMock = mock<FirebaseFirestore.DocumentReference<FirebaseFirestore.DocumentData>>();
    const snapshotMock = mock<FirebaseFirestore.DocumentSnapshot<DocumentData>>();

    firestoreMock.doc.mockReturnValueOnce(documentReferenceMock);
    documentReferenceMock.get.mockResolvedValueOnce(snapshotMock);
    snapshotMock.data.mockReturnValueOnce(validDocumentData);

    const credentialsService = CredentialsService.getInstance(firestoreMock);

    const userCredentials = await credentialsService.retrieveCredentials(exampleUID);

    expect(firestoreMock.doc).toHaveBeenLastCalledWith('credentials/'+exampleUID);

    expect(documentReferenceMock.get).toHaveBeenCalled();

    // As there were no valid members in the exampleDocumentData, the returned UserCredentials should be empty
    const credentials = new UserCredentials(validDocumentData);
    expect(userCredentials).toMatchObject(credentials);

    CredentialsService.deleteInstance();

  });

  test('returns an empty UserCredentials object when firestore data is invalid', async () => {
    const exampleUID = 'uid';
    const invalidDocumentData = {hello: 'there'};

    const firestoreMock = mock<FirebaseFirestore.Firestore>();
    const documentReferenceMock = mock<FirebaseFirestore.DocumentReference<FirebaseFirestore.DocumentData>>();
    const snapshotMock = mock<FirebaseFirestore.DocumentSnapshot<DocumentData>>();

    firestoreMock.doc.mockReturnValueOnce(documentReferenceMock);
    documentReferenceMock.get.mockResolvedValueOnce(snapshotMock);
    snapshotMock.data.mockReturnValueOnce(invalidDocumentData);

    const credentialsService = CredentialsService.getInstance(firestoreMock);

    const userCredentials = await credentialsService.retrieveCredentials(exampleUID);

    expect(firestoreMock.doc).toHaveBeenLastCalledWith('credentials/'+exampleUID);

    expect(documentReferenceMock.get).toHaveBeenCalled();

    // As there were no valid members in the exampleDocumentData, the returned UserCredentials should be empty
    const emptyCredentials = new UserCredentials({asana: undefined, google: undefined});
    expect(userCredentials).toMatchObject(emptyCredentials);

    CredentialsService.deleteInstance();

  });
});
