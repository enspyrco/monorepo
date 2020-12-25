import { the_process_id } from '../utils/the_process_constants';
import * as functions from 'firebase-functions';
import * as service_locator from '../utils/service_locator';
import { unNull } from '../utils/null_safety_utils';
import { SectionData } from '../utils/database/section_data';

export async function createSectionCallback(snapshot : functions.firestore.DocumentSnapshot, context : functions.EventContext) {

  const sectionData: SectionData = service_locator.createSectionData(snapshot.id);

  // We wrap the whole function in a try/catch and add a ProcessingFailure to the database on any failures
  try {

    const data = snapshot.data();

    const checkedData = unNull(data, 'There was no data in the snapshot.');

    const newSection = checkedData['section'];
    const sectionName = newSection['name'];

    sectionData.name = sectionName;
      
    const driveAPI = await service_locator.getDriveAPI(the_process_id);
    const docsAPI = await service_locator.getDocsAPI(the_process_id);
    const folder = await driveAPI.createFolder(sectionName+': Sections Planning (CL)');

    const checkedFolderId = unNull(folder.id, 'The created folder id was missing.');

    sectionData.folderId = checkedFolderId;

    functions.logger.info(`created folder:`, folder);

    const title = '0 - Use Cases < '+sectionName+' (CL)';
    const doc = await docsAPI.createDoc(title);

    const checkedDocId = unNull(doc.documentId, 'The created doc id was missing.');

    sectionData.useCasesDocId = checkedDocId;

    functions.logger.info(`created doc:`, {documentId: doc.documentId, title: doc.title});

    await driveAPI.moveDoc(checkedDocId, checkedFolderId);
    
    functions.logger.info(`moved doc to folder with id: ${checkedFolderId}`);

    functions.logger.info(`Saving sectionData: `, sectionData);

    const docRef = await sectionData.save();

    functions.logger.info(`added database entry for section: `, docRef);

    // Delete the document that was created in the 'new' collection.
    // The front end uses this event to change the UI.
    await snapshot.ref.delete();
  
  } catch (error) {
    await sectionData.onFailureSave(error);
    await snapshot.ref.delete();
  }

}
