import 'package:deploy_coverage/models/repo_config.dart';
import 'package:deploy_coverage/utils/locator.dart';
import 'package:test/test.dart';

void main() {
  group('RepoConfig', () {
    /// Env Vars are set using the Locator as RepoConfig uses the Locator to
    /// retrieve them.
    test('.createFrom() reads in Env Var from Locator', () {
      Locator.setEnvVar('INPUT_PACKAGES_PATH', 'packages');
      Locator.setEnvVar('INPUT_PACKAGE_NAME', 'redfire');
      Locator.setEnvVar('INPUT_SITE_ID', 'enspyrco');

      var repo = RepoConfig.detect();

      expect(repo.isMultiPackage, true);
      expect(repo.dirPath, 'packages/redfire/');
      expect(repo.projectId, 'enspyrco');
    });

    test('.createFrom() gets project id from local .firebaserc if required',
        () {
      // Should read in .firebaserc when no input env var is present
      var repo = RepoConfig.detect();

      expect(repo.projectId, 'enspyrco');
    });
  });
}
