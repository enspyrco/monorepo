import * as functions from 'firebase-functions';

import { DocsAPI } from '../google_apis/docs';
import { DriveAPI } from '../google_apis/drive';
import { unNull } from '../utils/problem_utils';
import { the_process_id } from '../utils/the_process_constants';

export async function createSection(snapshot : functions.firestore.DocumentSnapshot, context : functions.EventContext) {

  const data = snapshot.data() ?? {};
  const newSection = data['section'];
  const name = newSection['name'];
    
  const driveAPI = await DriveAPI.for(the_process_id);
  const docsAPI = await DocsAPI.for(the_process_id);
  
  const folder = await driveAPI.createFolder(name);

  const checkedFolderId = unNull(folder.id, 'The created folder id was missing.')

  functions.logger.info(`created folder:`, folder);

  const title = 'test doc';
  const doc = await docsAPI.createDoc(title);

  const checkedDocId = unNull(doc.documentId, 'The created doc id was missing.');

  functions.logger.info(`created doc:`, doc);

  await driveAPI.moveDoc(checkedDocId, checkedFolderId);
  
  functions.logger.info(`created doc with title: ${title}`, doc);

}
