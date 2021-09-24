import { google, people_v1 } from 'googleapis';
import { OAuth2Client } from 'google-auth-library';
import { unNull } from '../../utils/null_safety_utils';

// adapted from: https://github.com/googleapis/google-api-nodejs-client/blob/bd0accce744ddd55abdd400efbe2bccd96dc6cdf/samples/people/me.js
// see api docs: https://developers.google.com/people/api/rest/v1/people/get 

// we make a new api object each time but the AuthenticatedClient used by each api object is a singleton map 
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

    const checkedEmailAddresses = unNull(res.data.emailAddresses, 'There were no email addresses in the retrieved Person data.') as people_v1.Schema$EmailAddress[];
    const checkedValue = unNull(checkedEmailAddresses[0].value, 'There was no email address value in the email addresses list.') as string;

    return checkedValue;
  }

}