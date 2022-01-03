import 'dart:convert';
import 'dart:io';

import 'package:test/test.dart';

void main() {
  /// The test must be run from a directory with a coverage subdirectory or use
  /// the localPath arg.
  /// - hitting Run will run from the project directory
  /// The test also assumes a key.json is present in the current dir
  /// - there is info in the project notes (see README for link) on getting a
  ///   key
  test('', () async {
    final key = File('key.json').readAsStringSync();

    final path = 'bin/deploy_coverage.dart';
    final process =
        await Process.start('dart', [path, '-k', key, '-p', 'enspyrco']);

    // print everything in stdout
    await for (final line
        in process.stdout.transform(Utf8Decoder()).transform(LineSplitter())) {
      print(line);
    }

    // print everything in stderr
    await for (final line
        in process.stderr.transform(Utf8Decoder()).transform(LineSplitter())) {
      print(line);
    }

    print('exit code: ${await process.exitCode}');
  }, skip: 'Live test only used as optional final check before deploy');
}
