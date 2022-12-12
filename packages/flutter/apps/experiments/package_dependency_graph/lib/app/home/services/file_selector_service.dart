import 'package:file_selector/file_selector.dart';

class FileSelectorService {
  Future<XFile?> openYaml() async {
    const typeGroup = XTypeGroup(
      label: 'yaml',
      extensions: ['yml', 'yaml'],
    );

    return openFile(acceptedTypeGroups: [typeGroup]);
  }
}
