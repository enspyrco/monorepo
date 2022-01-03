import 'dart:io';

import 'package:args/args.dart';
import 'package:firebase_hosting_api_client/client.dart';

/// A ServiceAccountKey is required to upload to Firebase Hosting.
/// See README for setup info.
///
/// The CWD of the app is set to the first found of the following:
///   - the --workdir flag
///   - the $GITHUB_WORKSPACE envvar
///   - otherwise the directory of the app is used
///

/// cli options
const keyArg = 'key';
const projectIdArg = 'projectId';
const localPathArg = 'localPath';
const remotePathArg = 'remotePath';

void main(List<String> arguments) async {
  exitCode = 0; // presume success
  final parser = ArgParser()
    ..addOption(keyArg,
        abbr: 'k',
        mandatory: true,
        help: 'A ServiceAccountKey used for uploading to Firebase Hosting')
    ..addOption(projectIdArg,
        abbr: 'p',
        mandatory: true,
        help: 'The ID of the Firebase project that will be uploaded to')
    ..addOption(localPathArg,
        abbr: 'l',
        defaultsTo: 'coverage',
        help:
            'Everything in the directory aat this path will be uploaded, defaults to ./coverage')
    ..addOption(remotePathArg,
        abbr: 'r',
        help: 'The uploaded files will be accessible at this path',
        defaultsTo: '');

  var results = parser.parse(arguments);

  await upload(results[keyArg], results[projectIdArg], results[localPathArg],
      results[remotePathArg]);
}

Future<void> upload(String serviceAccountKey, String projectId,
    String localPath, String remotePath) async {
  final uploadData = await UploadData.createFrom(path: localPath);

  var client = await FirebaseHostingApiClient.create(
      serviceAccountKey: serviceAccountKey, projectId: projectId);

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
