import * as functions from 'firebase-functions';

import { DriveAPI } from '../google_apis/drive';

export async function createSection(snapshot : functions.firestore.DocumentSnapshot, context : functions.EventContext) {

  const data = snapshot.data() ?? {};
  const newSection = data['section'];
  const name = newSection['name'];
    
  // in this case we want to authenticate as the.process@crowdleague.app
  const driveAPI = new DriveAPI('EmMNvzWZERdIpbk4cl3klhMPZg82');
  
  await driveAPI.authenticate();
  const file = await driveAPI.createFolder(name);
  
  functions.logger.info(`created folder name: ${name}`, file);

}