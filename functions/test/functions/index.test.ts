import * as funcTest from "firebase-functions-test";
import * as admin from 'firebase-admin';
import * as service_locator from '../../src/utils/service_locator';
import { firebaseAdmin } from '../../src/utils/firebase_admin';
import { DriveAPI } from "../../src/google_apis/drive";
import { DocsAPI } from "../../src/google_apis/docs";
import { SectionData } from "../../src/utils/database";
import { mock, when, instance, spy, anyString, anything, reset } from 'ts-mockito';
import { DocumentData, DocumentReference, DocumentSnapshot } from "@google-cloud/firestore";

describe('Cloud Functions', () => {
  let myFunctions: any;
  const tester = funcTest();

  const spiedAdmin = spy(admin);
  when(spiedAdmin.initializeApp(anything())).thenReturn(instance(mock(admin.app)))

  const spiedFirebaseAdmin = spy(firebaseAdmin);
  when(spiedFirebaseAdmin.getFirestore()).thenReturn(instance(mock(admin.firestore)));
  
  const mockedDriveAPI:DriveAPI = mock(DriveAPI);
  when(mockedDriveAPI.createFolder(anyString())).thenReturn(Promise.resolve({id: 'folderIdBoop'}));
  const mockedDocsAPI:DocsAPI = mock(DocsAPI);
  when(mockedDocsAPI.createDoc(anyString())).thenReturn(Promise.resolve({documentId: 'docIdBlam'}));

  const mockedSnapshot:DocumentSnapshot = mock<DocumentSnapshot>(); 
  when(mockedSnapshot.data()).thenReturn({section: {name: 'testy'}});

  const mockedSectionData:SectionData = mock(SectionData);
  const mockedDocRef:DocumentReference<DocumentData> = mock(DocumentReference);
  when(mockedSectionData.save()).thenReturn(); // Promise.resolve(instance(mockedDocRef))

  when(mockedSnapshot.ref).thenReturn(instance(mockedDocRef));

  const spiedServiceLocator = spy(service_locator);
  when(spiedServiceLocator.getDriveAPI(anyString())).thenReturn(Promise.resolve(instance(mockedDriveAPI)));
  when(spiedServiceLocator.getDocsAPI(anyString())).thenReturn(Promise.resolve(instance(mockedDocsAPI)));
  when(spiedServiceLocator.createSectionData(anything())).thenReturn(instance(mockedSectionData));

  before(async () => {
    // Import index.ts with an async import so we can mock before the Firebase modules are accessed.
    myFunctions = await import('../../src/index');
  });

  it('should successfully run createSectionFolder', async () => {
    const wrapped = tester.wrap(myFunctions.createSectionFolder);    
    await wrapped(instance(mockedSnapshot));
  });

  after(() => {
    reset(spiedAdmin);
    reset(spiedFirebaseAdmin);
    reset(spiedServiceLocator);
    tester.cleanup();
  });
});
