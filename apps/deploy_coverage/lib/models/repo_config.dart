import 'dart:convert';
import 'dart:io';

import 'package:deploy_coverage/utils/locator.dart';

/// RepoConfig
///
/// Constructors
/// - single private named constructor (to force using the named constructor)
/// - single public named constructor: [detect]
///
/// Inputs:
/// - env var: INPUT_PACKAGES_PATH
/// - env var: INPUT_PACKAGE_NAME
///
class RepoConfig {
  // ignore: unused_element
  RepoConfig._();

  RepoConfig.detect() {
    var packagesPath = Locator.getEnvVar('INPUT_PACKAGES_PATH');
    var packageName = Locator.getEnvVar('INPUT_PACKAGE_NAME');

    print('packages path: $packagesPath, package name: $packageName');

    // add a trailing backslash to packagesPath if needed
    if (packagesPath.isNotEmpty && packageName.isNotEmpty) {
      isMultiPackage = true;
      // ensure packagesPath ends in /
      packagesPath =
          packagesPath.endsWith('/') ? packagesPath : '$packagesPath/';
      // ensure dirPath ends in /
      packageName = packageName.endsWith('/') ? packageName : '$packageName/';
      dirPath = packagesPath + packageName;
      print('Multi-package repo found. Package path = $dirPath');
    } else {
      isMultiPackage = false;
      dirPath = '';

      print('Single-package repo found.');
      // throw to give helpful error message
      if ((packagesPath.isNotEmpty) ^ (packageName.isNotEmpty)) {
        throw 'packageName and packagesPath must both be provided or neither.';
      }
    }

    // Get the projectId from an env var if present or from the .firebaserc
    final projectIdEnvVar = Locator.getEnvVar('INPUT_SITE_ID');
    if (projectIdEnvVar.isEmpty) {
      var firebasercString = File('$dirPath.firebaserc').readAsStringSync();
      projectId = jsonDecode(firebasercString)['projects']['default'];
    } else {
      projectId = projectIdEnvVar;
    }
  }

  late final bool isMultiPackage;

  /// Take the form eg. 'packages/redfire/'
  late final String dirPath;
  late final String projectId;
}
