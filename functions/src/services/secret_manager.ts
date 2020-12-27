import * as functions from 'firebase-functions';
import { SecretManagerServiceClient, protos } from '@google-cloud/secret-manager';
import { unNull } from '../utils/null_safety_utils';
import { UserCredentials } from '../models/credentials/user_credentials';
import { AsanaCredentials } from '../models/credentials/asana_credentials';
import { GoogleCredentials } from '../models/credentials/google_credentials';

// We create the secret with automatic replication, documented as "the right choice in most cases".
const autoReplication = { automatic: {} };

export interface SecretManagerInterface {
  saveGoogleCredentials(uid: string, credentials: GoogleCredentials) : void;
  saveAsanaCredentials(uid: string, credentials: AsanaCredentials) : void;
  retrieveUserCredentials(uid: string) : Promise<UserCredentials>;
}

export class SecretManager implements SecretManagerInterface {
  private client : SecretManagerServiceClient;
  
  private static privateInstance: SecretManager;

  private constructor(client?: SecretManagerServiceClient) {
    this.client = client ?? new SecretManagerServiceClient();
  }

  static getInstance(client?: SecretManagerServiceClient) : SecretManager {
    if (!SecretManager.privateInstance) {
      SecretManager.privateInstance = new SecretManager(client);
    }
    return SecretManager.privateInstance;
  }

  async saveAsanaCredentials(uid: string, asanaCredentials: AsanaCredentials) : Promise<void> {

    const secret = await this.retrieveSecret(uid);

    const [versions] = await this.client.listSecretVersions({
      parent: secret.name,
    });

    let userCredentials;
    if(versions.length > 0) {
      userCredentials = await this.retrieveUserCredentials(uid);
    }
    else {
      userCredentials = new UserCredentials();
    }

    // update the credentials with the new data 
    userCredentials.asana = asanaCredentials;

    // Add a version with a payload onto the secret.
    const [version] = await this.client.addSecretVersion({
      parent: secret.name,
      payload: {
        data: Buffer.from(JSON.stringify(userCredentials), 'utf8'),
      },
    });

    functions.logger.info(`Addeded secret version ${version.name}`);
  }

  async saveGoogleCredentials(uid: string, googleCredentials: GoogleCredentials) : Promise<void> {
    
    const secret = await this.retrieveSecret(uid);

    const userCredentials = await this.retrieveUserCredentials(uid);

    // Update the credentials with the new data.
    userCredentials.google = googleCredentials;

    // Add a version with a payload onto the secret.
    const [version] = await this.client.addSecretVersion({
      parent: secret.name,
      payload: {
        data: Buffer.from(JSON.stringify(userCredentials), 'utf8'),
      },
    });

    functions.logger.info(`Addeded secret version ${version.name}`);
  }

  async retrieveSecret(uid: string) : Promise<protos.google.cloud.secretmanager.v1.ISecret> {
    let secret: protos.google.cloud.secretmanager.v1.ISecret;
    
    // Retrieve the user's secret (or create one if none exists) 
    try {
      [secret] = await this.client.getSecret({
        name: 'projects/the-process-tool/secrets/'+uid,
      });

      functions.logger.info('Retrieved secret: ', secret);
    }
    catch {
      functions.logger.info(`Could not retrieve a secret for: ${uid}`);

      [secret] = await this.client.createSecret({
        parent: 'projects/the-process-tool',
        secretId: uid,
        secret: {
          name: uid,
          replication: autoReplication,
        },
      });

      functions.logger.info('Created secret: ', secret);
    }

    return secret;
  }
  
  async retrieveUserCredentials(uid: string) : Promise<UserCredentials> {
    // Access the secret.
    const [accessResponse] = await this.client.accessSecretVersion({
      name: 'projects/the-process-tool/secrets/'+uid+'/versions/latest',
    });

    const responsePayload = accessResponse.payload?.data?.toString();

    const checkedPayload = unNull(responsePayload, `When retrieving secret for ${uid}, response payload was null`) as string;

    const payloadJson = JSON.parse(checkedPayload);

    functions.logger.log('Parsed json from responsePayload');

    const googleCredentials : GoogleCredentials = new GoogleCredentials(payloadJson.google);
    const asanaCredentials : AsanaCredentials = payloadJson.asana;
    const userCredentials = new UserCredentials(googleCredentials, asanaCredentials);
    
    return userCredentials;
  }
}