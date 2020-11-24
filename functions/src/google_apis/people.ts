import { google, people_v1 } from 'googleapis';
import { OAuth2Client } from 'google-auth-library';

// adapted from: https://github.com/googleapis/google-api-nodejs-client/blob/bd0accce744ddd55abdd400efbe2bccd96dc6cdf/samples/people/me.js
// see api docs: https://developers.google.com/people/api/rest/v1/people/get 
export class PeopleAPI {
  
  client: OAuth2Client;
  people: people_v1.People;

  constructor(theClient: OAuth2Client) {
    this.client = theClient;
    this.people = google.people({version: 'v1', auth: theClient});
  }

  async getEmail() : Promise<string> {

    const res = await this.people.people.get({
      resourceName: 'people/me',
      personFields: 'emailAddresses',
    });

    if(res.data.emailAddresses == null || res.data.emailAddresses[0].value == null) {
      throw Error('There was no email address in the retrieved Person data.');
    }

    return res.data.emailAddresses[0].value;
  }

}