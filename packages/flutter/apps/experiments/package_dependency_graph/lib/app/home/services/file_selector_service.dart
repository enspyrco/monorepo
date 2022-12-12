import 'package:file_selector/file_selector.dart';

class FileSelectorService {
  // Future<XFile?> openYaml() async {
  //   const typeGroup = XTypeGroup(
  //     label: 'yaml',
  //     extensions: ['yml', 'yaml'],
  //   );

  //   return openFile(acceptedTypeGroups: [typeGroup]);
  // }

  // Use with:
  // final XFile? xFile = await locate<FileSelectorService>().openYaml();

  Future<String?> openDirectory() async {
    final String? directoryPath = await getDirectoryPath();
    if (directoryPath == null) {
      // Operation was canceled by the user.
      return null;
    }
    return directoryPath;
  }
}
