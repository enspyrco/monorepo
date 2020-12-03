import * as functions from 'firebase-functions';
import { SecretManagerServiceClient, protos } from '@google-cloud/secret-manager';

// We create the secret with automatic replication, documented as "the right choice in most cases".
const autoReplication = { automatic: {} };

class SecretManager {
  secretsClient = new SecretManagerServiceClient();

  async save(uid: string, provider: string, tokens: {}) {

    let secret: protos.google.cloud.secretmanager.v1.ISecret;
    
    // Retrieve the user's secret (or create one if none exists) 
    try {
      [secret] = await this.secretsClient.getSecret({
        name: 'projects/the-process-tool/secrets/'+uid,
      });

      functions.logger.info('Retrieved secret: ', secret);
    }
    catch {
      functions.logger.info(`Could not retrieve a secret for: ${uid}`);

      [secret] = await this.secretsClient.createSecret({
        parent: 'projects/the-process-tool',
        secretId: uid,
        secret: {
          name: uid,
          replication: autoReplication,
        },
      });

      functions.logger.info('Created secret: ', secret);
    }

    const [versions] = await this.secretsClient.listSecretVersions({
      parent: secret.name,
    });

    let tokensJson = {}; 
    if(versions.length > 0) {
      tokensJson = await this.retrieveCredentials(uid);
    }
    
    // update the json with the new data 
    tokensJson = { ...tokensJson, [provider]: tokens};

    // Add a version with a payload onto the secret.
    const [version] = await this.secretsClient.addSecretVersion({
      parent: secret.name,
      payload: {
        data: Buffer.from(JSON.stringify(tokensJson), 'utf8'),
      },
    });

    functions.logger.info(`Addeded secret version ${version.name}`);
  }

  // 
  async retrieveCredentials(uid: string) : Promise<{}> {
    // Access the secret.
    const [accessResponse] = await this.secretsClient.accessSecretVersion({
      name: 'projects/the-process-tool/secrets/'+uid+'/versions/latest',
    });

    const responsePayload = accessResponse.payload?.data?.toString();

    if(responsePayload == null) {
      throw Error(`When retrieving secret for ${uid}, response payload was null`);
    }

    const tokensJson = JSON.parse(responsePayload);
    
    functions.logger.log('Parsed json from responsePayload');

    return tokensJson;
  }
}

export const secretManager = new SecretManager();