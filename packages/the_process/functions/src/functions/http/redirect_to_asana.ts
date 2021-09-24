import * as express from 'express';

import * as project_credentials from '../../project_credentials.json';

////////////////////////////////////////////////////////////////////////////////
// Asana 
////////////////////////////////////////////////////////////////////////////////

// Get the code from the request, call retrieveAuthToken and return the response.
// eslint-disable-next-line @typescript-eslint/no-explicit-any
const asanaRedirect = async (req: any, res: any) => {
  res.redirect(
    'https://app.asana.com/-/oauth_authorize?response_type=code&client_id='
    +project_credentials.asana.client_id
    +'&redirect_uri='
    +project_credentials.asana.redirect_uri
    +'&state='+req.query.state);
}

// Export an express app that uses the callback we created.
export const redirectToAsanaExpressApp = express().use(asanaRedirect);