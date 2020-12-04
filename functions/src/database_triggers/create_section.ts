import * as functions from 'firebase-functions';

import { DocsAPI } from '../google_apis/docs';
import { DriveAPI } from '../google_apis/drive';
import { SectionData } from '../utils/database';
import { unNull } from '../utils/problem_utils';
import { the_process_id } from '../utils/the_process_constants';

export async function createSection(snapshot : functions.firestore.DocumentSnapshot, context : functions.EventContext) {

  const data = snapshot.data() ?? {};
  const newSection = data['section'];
  const sectionName = newSection['name'];
  const sectionNumber = newSection['number'];
    
  const driveAPI = await DriveAPI.for(the_process_id);
  const docsAPI = await DocsAPI.for(the_process_id);
  const folder = await driveAPI.createFolder(sectionNumber+'. '+sectionName+': Sections Planning (CL)');

  const checkedFolderId = unNull(folder.id, 'The created folder id was missing.');

  functions.logger.info(`created folder:`, folder);

  const title = '0 - Use Cases < '+sectionName+' (CL)';
  const doc = await docsAPI.createDoc(title);

  const checkedDocId = unNull(doc.documentId, 'The created doc id was missing.');

  functions.logger.info(`created doc:`, doc);

  await driveAPI.moveDoc(checkedDocId, checkedFolderId);
  
  functions.logger.info(`moved doc to folder with id: ${checkedFolderId}`);

  const sectionData = new SectionData(snapshot.id, sectionNumber, sectionName, checkedFolderId, checkedDocId); 

  functions.logger.info(`created sectionData: `, sectionData);

  const docRef = await sectionData.save();

  functions.logger.info(`added database entry for section: `, docRef);

  // Delete the document that was created in the 'new' collection.
  // The front end uses this event to change the UI.
  await snapshot.ref.delete();

}
