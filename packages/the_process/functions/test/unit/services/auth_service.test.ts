import { DocumentData, DocumentReference, DocumentSnapshot, Firestore } from "@google-cloud/firestore";
import { auth } from 'firebase-admin/lib/auth';
import { mock } from "jest-mock-extended";
import { AsanaCredentials } from "../../../src/models/credentials/asana_credentials";
import { GoogleCredentials } from "../../../src/models/credentials/google_credentials";
import { UserCredentials } from "../../../src/models/credentials/user_credentials";
import { AuthService } from "../../../src/services/auth_service";

describe('AuthService', () => {
  test('updates the appropriate doc in credentials collection', async () => {

    // Create example data.
    
    const exampleUID = 'uid';
    const exampleAsanaCredentials = new AsanaCredentials({ access_token: 'access_token'});
    const exampleGoogleCredentials = new GoogleCredentials({ access_token: 'access_token'});

    // Create and configure mocks.

    const firebaseAuthMock = mock<auth.Auth>();
    const firestoreMock = mock<Firestore>();
    const documentReferenceMock = mock<DocumentReference<DocumentData>>();

    firestoreMock.doc.mockReturnValueOnce(documentReferenceMock);

    // Create the Subject Under Test.

    const authService = AuthService.getInstance(firebaseAuthMock, firestoreMock);

    // Run saveAsanaCredentials function.

    await authService.saveAsanaCredentials(exampleUID, exampleAsanaCredentials);
    
    expect(firestoreMock.doc).toHaveBeenLastCalledWith('credentials/'+exampleUID);

    expect(documentReferenceMock.set).toHaveBeenCalledWith({asana : {...exampleAsanaCredentials}}, {merge: true})

    // Reset the mocks.

    firestoreMock.doc.mockReturnValueOnce(documentReferenceMock);
    
    // Run saveGoogleCredentials function.

    await authService.saveGoogleCredentials(exampleUID, exampleGoogleCredentials);
    
    expect(firestoreMock.doc).toHaveBeenLastCalledWith('credentials/'+exampleUID);

    expect(documentReferenceMock.set).toHaveBeenCalledWith({google : {...exampleGoogleCredentials}}, {merge: true})

    AuthService.deleteInstance();

  });

  test('retrieves the relevant doc from the credentials collection', async () => {
    const exampleUID = 'uid';
    const validDocumentData = {asana: {access_token: 'access_token'}, google: {refresh_token: 'access_token'}};

    const firebaseAuthMock = mock<auth.Auth>();
    const firestoreMock = mock<Firestore>();
    const documentReferenceMock = mock<DocumentReference<DocumentData>>();
    const snapshotMock = mock<DocumentSnapshot<DocumentData>>();

    firestoreMock.doc.mockReturnValueOnce(documentReferenceMock);
    documentReferenceMock.get.mockResolvedValueOnce(snapshotMock);
    snapshotMock.data.mockReturnValueOnce(validDocumentData);

    const authService = AuthService.getInstance(firebaseAuthMock, firestoreMock);

    const userCredentials = await authService.retrieveCredentials(exampleUID);

    expect(firestoreMock.doc).toHaveBeenLastCalledWith('credentials/'+exampleUID);

    expect(documentReferenceMock.get).toHaveBeenCalled();

    // As there were no valid members in the exampleDocumentData, the returned UserCredentials should be empty
    const credentials = new UserCredentials(validDocumentData);
    expect(userCredentials).toMatchObject(credentials);

    AuthService.deleteInstance();

  });

  test('returns an empty UserCredentials object when firestore data is invalid', async () => {
    const exampleUID = 'uid';
    const invalidDocumentData = {hello: 'there'};

    const firebaseAuthMock = mock<auth.Auth>();
    const firestoreMock = mock<Firestore>();
    const documentReferenceMock = mock<DocumentReference<DocumentData>>();
    const snapshotMock = mock<DocumentSnapshot<DocumentData>>();

    firestoreMock.doc.mockReturnValueOnce(documentReferenceMock);
    documentReferenceMock.get.mockResolvedValueOnce(snapshotMock);
    snapshotMock.data.mockReturnValueOnce(invalidDocumentData);

    const authService = AuthService.getInstance(firebaseAuthMock, firestoreMock);

    const userCredentials = await authService.retrieveCredentials(exampleUID);

    expect(firestoreMock.doc).toHaveBeenLastCalledWith('credentials/'+exampleUID);

    expect(documentReferenceMock.get).toHaveBeenCalled();

    // As there were no valid members in the exampleDocumentData, the returned UserCredentials should be empty
    const emptyCredentials = new UserCredentials({asana: undefined, google: undefined});
    expect(userCredentials).toMatchObject(emptyCredentials);

    AuthService.deleteInstance();

  });
});
