import * as funcTest from "firebase-functions-test";
import * as admin from 'firebase-admin';
import * as service_locator from '../../../src/utils/service_locator';
import { firebaseAdmin } from '../../../src/utils/firebase_admin';
import { DocumentReference, DocumentSnapshot, WriteResult } from "@google-cloud/firestore";
import { mock, mockDeep } from "jest-mock-extended";
import { DriveAPIInterface } from "../../../src/services/google_apis/drive";
import { DocsAPIInterface } from "../../../src/services/google_apis/docs";
import { DatabaseService } from "../../../src/services/database_service";
import { SectionData } from "../../../src/models/database/section_data";

describe('CloudFunction', () => {
  let myFunctions: typeof import("../../../src/index");
  const tester = funcTest();
  
  beforeAll(async () => {
    // Use async import so we can spy before the Firebase modules are accessed.
    myFunctions = await import('../../../src/index');

    // replace calls during the firebase initialization that require a live connection 
    jest.spyOn(admin, 'initializeApp').mockImplementationOnce(() => mockDeep());
    jest.spyOn(firebaseAdmin, 'getFirestore').mockImplementationOnce(() => mockDeep());
  });

  it('.createSection saves failures to database', async () => {

    const databaseServiceMock = mock<DatabaseService>();
    
    jest.spyOn(service_locator, 'getDatabaseService').mockImplementationOnce(() => Promise.resolve(databaseServiceMock));

    // setup the test harness and call the function 
    const wrapped = tester.wrap(myFunctions.createSection);
    await wrapped(mockDeep<DocumentSnapshot>());

    // check that the section has the expected values 
    expect(databaseServiceMock.saveFailure).toHaveBeenCalled;
  });

  it('.createSection saves SectionData with expected values', async () => {

    // Create an example object with values that we inject during the test. 
    const exampleSectionData = new SectionData({name: 'testy', folderId: 'folderIdBoop', useCasesDocId: 'docIdBlam'});

    // Create mocks to be returned in place of services, injecting our example data during the test.
    const driveAPIMock = mock<DriveAPIInterface>();
    driveAPIMock.createFolder.mockResolvedValueOnce({id: exampleSectionData.data.folderId as string});
    const docsAPIMock = mock<DocsAPIInterface>();
    docsAPIMock.createDoc.mockResolvedValueOnce({documentId: exampleSectionData.data.useCasesDocId as string});
    const databaseServiceMock = mock<DatabaseService>();

    // Replace service_locator functions to return our mocked services.
    jest.spyOn(service_locator, 'getDatabaseService').mockImplementationOnce(() => Promise.resolve(databaseServiceMock));
    jest.spyOn(service_locator, 'getDriveAPI').mockImplementationOnce(() => Promise.resolve(driveAPIMock));
    jest.spyOn(service_locator, 'getDocsAPI').mockImplementationOnce(() => Promise.resolve(docsAPIMock));

    // Create a mocked DocumentSnapshot to pass in to the function under test.
    const snapshotMock = mock<DocumentSnapshot>();
    snapshotMock.data.mockReturnValueOnce({section: {name: exampleSectionData.data.name as string}});
    // Replacing getters is difficult, this seems to be the best way.
    Object.defineProperty(snapshotMock, 'ref', {
      get: () => {
        const docRefMock = mock<DocumentReference>();
        docRefMock.delete.mockResolvedValueOnce(mockDeep<WriteResult>());
        return docRefMock;
      },
    });

    // Setup the test harness and call the function.
    const wrapped = tester.wrap(myFunctions.createSection);
    await wrapped(snapshotMock);

    // Check that the section has the expected values.
    expect(databaseServiceMock.save).toHaveBeenCalledWith(exampleSectionData);
  });

  afterAll(() => {
    jest.resetAllMocks();
    tester.cleanup();
  });
});
