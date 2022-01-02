import 'package:deploy_coverage/models/repo_config.dart';
import 'package:deploy_coverage/utils/locator.dart';
import 'package:firebase_hosting_api_client/client.dart';

/// The CWD of the app is assumed to be $GITHUB_WORKSPACE
/// This is true when run with the current entrypoint.sh
void main(List<String> arguments) async {
  final workspaceDir = Locator.getEnvVar('GITHUB_WORKSPACE');
  final key = Locator.getEnvVar('INPUT_SERVICE_ACCOUNT_KEY');
  if (key.isEmpty) throw 'key not found, check service_account_key input';

  var repo = RepoConfig.detect();
  final uploadData = await UploadData.createFrom(
      path: workspaceDir + '/' + repo.dirPath + 'coverage');

  var client = await FirebaseHostingApiClient.create(
      serviceAccountKey: key, projectId: repo.projectId);

  // Allow coverage data to be uploaded without overwriting by first downloading
  // info for current files & adding to UploadData
  if (repo.isMultiPackage) {
    var currentVersion = await client.getCurrentVersion();
    var currentFiles = await client.listFiles(versionName: currentVersion);
    uploadData.add(currentFiles);
  }

  var newVersion = await client.createNewVersion();

  var result = await client.populateFiles(
    json: uploadData.json,
    versionName: newVersion,
  );

  await client.uploadFiles(
    uploadUrl: result.uploadUrl,
    requiredHashes: result.requiredHashes,
    pathForHash: uploadData.pathForHash,
    bytesForHash: uploadData.bytesForHash,
  );

  await client.finalizeStatus(versionName: newVersion);
  await client.release(versionName: newVersion);

  client.close();
}
