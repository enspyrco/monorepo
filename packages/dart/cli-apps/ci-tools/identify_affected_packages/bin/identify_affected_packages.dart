import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

void main(List<String> arguments) async {
  // read in json describing all packages and build convenience data structures
  var matrixFile = File('.github/matrix.json');
  var jsonString = matrixFile.readAsStringSync();
  var decodedJson = jsonDecode(jsonString) as Map<String, dynamic>;
  List<Map<String, dynamic>> packagesJson =
      (decodedJson['include'] as List<dynamic>).cast<Map<String, dynamic>>();
  List<String> monorepoPackagePaths =
      packagesJson.map((e) => e['path'] as String).toList();
  Map<String, dynamic> pathMap = {for (var e in packagesJson) e['path']: e};

  /// Use git to determine the paths of all changed files for the current PR

  ProcessResult result = await Process.run('git', [
    'diff',
    'HEAD~',
    '--name-only',
  ]);

  if (result.exitCode != 0) {
    stderr.write(result.stderr);
    exit(result.exitCode);
  }

  final changedFilePaths = (result.stdout as String).split('\n');

  stdout.writeln('${changedFilePaths.length} files were changed...\n\n');

  // remove packages that are not affected by the changes
  for (final packagePath in monorepoPackagePaths) {
    bool found = false;
    for (final changed in changedFilePaths) {
      stdout.write(packagePath);
      if (path.isWithin('packages/$packagePath', changed)) {
        stdout.writeln('is within $packagePath');
        found = true;
        break;
      }
    }
    if (!found) pathMap[packagePath] = null;
  }

  // write out the matrix file, minus the unaffected packages
  var updatedJson = <String, dynamic>{
    'include': pathMap.values.where((e) => e != null).toList()
  };
  matrixFile.writeAsStringSync(jsonEncode(updatedJson));

  stdout.writeln('\n\noutput: $matrixFile\n\n');
}
