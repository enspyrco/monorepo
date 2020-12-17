import * as functions from 'firebase-functions';

import { unNull } from '../utils/problem_utils';
import * as service_locator from '../utils/service_locator';
import { the_process_id } from '../utils/the_process_constants';

export async function createSection(snapshot : functions.firestore.DocumentSnapshot, context : functions.EventContext) {

  const data = snapshot.data();

  const checkedData = unNull(data, 'There was no data in the snapshot.');

  const newSection = checkedData['section'];
  const sectionName = newSection['name'];
    
  const driveAPI = await service_locator.getDriveAPI(the_process_id);
  const docsAPI = await service_locator.getDocsAPI(the_process_id);
  const folder = await driveAPI.createFolder(sectionName+': Sections Planning (CL)');

  const checkedFolderId = unNull(folder.id, 'The created folder id was missing.');

  functions.logger.info(`created folder:`, folder);

  const title = '0 - Use Cases < '+sectionName+' (CL)';
  const doc = await docsAPI.createDoc(title);

  const checkedDocId = unNull(doc.documentId, 'The created doc id was missing.');

  functions.logger.info(`created doc:`, doc);

  await driveAPI.moveDoc(checkedDocId, checkedFolderId);
  
  functions.logger.info(`moved doc to folder with id: ${checkedFolderId}`);

  const sectionData = service_locator.createSectionData({uid: snapshot.id, name: sectionName, folderId: checkedFolderId, useCasesDocId: checkedDocId});

  functions.logger.info(`created sectionData: `, sectionData);

  const docRef = await sectionData.save();

  functions.logger.info(`added database entry for section: `, docRef);

  // Delete the document that was created in the 'new' collection.
  // The front end uses this event to change the UI.
  await snapshot.ref.delete();

}
