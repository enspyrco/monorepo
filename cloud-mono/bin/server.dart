import 'dart:ffi' as ffi;
import 'dart:io';
import 'dart:io' show Platform, Directory;

import 'package:path/path.dart' as path;
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart';

void main(List<String> args) async {
  var libraryPath =
      path.join(Directory.current.path, 'lib', 'discord_game_sdk.so');
  if (Platform.isMacOS) {
    libraryPath =
        path.join(Directory.current.path, 'lib', 'discord_game_sdk.dylib');
  }
  final dylib = ffi.DynamicLibrary.open(libraryPath);

  final HelloWorld hello = dylib
      .lookup<ffi.NativeFunction<hello_world_func>>('hello_world')
      .asFunction();

  hello();

  // Use any available host or container IP (usually `0.0.0.0`).
  final ip = InternetAddress.anyIPv4;

  // For running in containers, we respect the PORT environment variable.
  final port = int.parse(Platform.environment['PORT'] ?? '8080');

  // final server = await serve(_handler, ip, port);

  print('Server listening on port ${server.port}');
}
