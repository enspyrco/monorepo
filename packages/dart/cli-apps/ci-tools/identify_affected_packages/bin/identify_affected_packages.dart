import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart' as path;

void main(List<String> arguments) async {
  var jsonString = File('.github/matrix.json').readAsStringSync();
  var decodedJson = jsonDecode(jsonString) as Map<String, dynamic>;
  List<Map<String, dynamic>> packagesJson =
      (decodedJson['include'] as List<dynamic>).cast<Map<String, dynamic>>();
  List<String> packagePaths =
      packagesJson.map((e) => e['path'] as String).toList();

  ProcessResult result = await Process.run('git', [
    'diff',
    'HEAD~',
    '--name-only',
  ]);

  if (result.exitCode != 0) {
    stderr.write(result.stderr);
    exit(1);
  }
  // stdout.write(result.stdout);
  var pathNames = (result.stdout as String).split('\n');

  List<String> affected = [];

  for (var pathName in pathNames) {
    for (var packagePath in packagePaths) {
      if (path.isWithin(packagePath, pathName)) {
        affected.add(packagePath);
      }
    }
  }
}
