import * as functions from 'firebase-functions';

import { DriveAPI } from '../google_apis/drive';

export async function createSection(snapshot : functions.firestore.DocumentSnapshot, context : functions.EventContext) {

  const data = snapshot.data() ?? {};
  const newSection = data['section'];
  const name = newSection['name'];

  const uid = context.params.userId;
  const driveAPI = new DriveAPI(uid)
  
  await driveAPI.authenticate();
  const file = await driveAPI.createFolder(name, uid);
  
  functions.logger.info(`created folder name: ${name}`, file);

}