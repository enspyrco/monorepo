import * as funcTest from "firebase-functions-test";
import * as sinon from 'sinon';

import * as admin from 'firebase-admin';
import { firebaseAdmin } from '../src/utils/firebase_admin';

describe('Cloud Functions', () => {
  let myFunctions: any, adminInitStub: any, firebaseAdminStub: any;
  const tester = funcTest();
  before(async () => {
    // Stub functions so importing index.ts (which initializes Firebase etc) doesn't break.
    adminInitStub = sinon.stub(admin, 'initializeApp');
    firebaseAdminStub = sinon.stub(firebaseAdmin, 'getFirestore');

    // Now that we have mocked FirebaseAdmin etc. we import index.ts so we can call our 
    // functions in tests. We use an async import so we can mock before the Firebase modules
    // are accessed.
    myFunctions = await import('../src/index');
  });

  it("createSectionFolder", () => {
    const wrapped = tester.wrap(myFunctions.createSectionFolder);
    const snapshot = tester.firestore.exampleDocumentSnapshot();
    wrapped(snapshot);
  });

  after(() => {
    adminInitStub.restore();
    firebaseAdminStub.restore();
    tester.cleanup();
  });
});
