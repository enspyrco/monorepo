import 'package:file_selector/file_selector.dart';

class FileSelectorService {
  Future<String?> openDirectory() async {
    final String? directoryPath = await getDirectoryPath();
    if (directoryPath == null) {
      // Operation was canceled by the user.
      return null;
    }
    return directoryPath;
  }
}
