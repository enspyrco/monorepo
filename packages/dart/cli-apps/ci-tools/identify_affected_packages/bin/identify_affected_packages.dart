import 'dart:io';

void main(List<String> arguments) async {
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
  var paths = (result.stdout as String).split('\n');

  for (var path in paths) {
    if (path.isNotEmpty) {}
    print('-->$fileName');
  }
}
