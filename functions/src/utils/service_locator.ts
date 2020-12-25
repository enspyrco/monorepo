import { DocsAPI, DocsAPIInterface } from "../google_apis/docs";
import { DriveAPI, DriveAPIInterface } from "../google_apis/drive"
import { SectionData } from "./database/section_data";

// we make a new api object each time but the AuthenticatedClient used by each api object is a singleton map 

export const getDriveAPI = async function(uid: string) : Promise<DriveAPIInterface> {
  const api = await DriveAPI.for(uid);
  return api;
}

export const getDocsAPI = async function(uid: string) : Promise<DocsAPIInterface> {
  const api = await DocsAPI.for(uid);
  return api;
}

export const createSectionData = function(uid: string): SectionData {
  return new SectionData(uid);
}