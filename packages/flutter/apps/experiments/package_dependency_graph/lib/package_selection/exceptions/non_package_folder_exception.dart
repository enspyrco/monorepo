import 'package:astro_error_handling/astro_error_handling.dart';

class NonPackageFolderException extends AstroException {
  NonPackageFolderException({super.showStackTrace = false, required this.path});

  final String path;

  String get message =>
      'The folder you selected does not contain a pubspec.yaml file.\n\n'
      'path: $path';
}
