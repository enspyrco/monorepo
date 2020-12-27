import { DocsAPI, DocsAPIInterface } from "../services/google_apis/docs";
import { DriveAPI, DriveAPIInterface } from "../services/google_apis/drive"
import { DatabaseService } from "../services/database_service";

// we make a new api object each time but the AuthenticatedClient used by each api object is a singleton map 

export const getDriveAPI = async function(uid: string) : Promise<DriveAPIInterface> {
  return DriveAPI.for(uid);
}

export const getDocsAPI = async function(uid: string) : Promise<DocsAPIInterface> {
  return DocsAPI.for(uid);
}

export const getDatabaseService = async function(uid: string) : Promise<DatabaseService> {
  return DatabaseService.getInstanceFor(uid);
}