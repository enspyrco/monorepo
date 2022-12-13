import 'dart:async';

import 'package:build/build.dart';

class AstroBuilder extends Builder {
  @override
  FutureOr<void> build(BuildStep buildStep) async {
    final inputId = buildStep.inputId;

    final newAssetId = inputId.changeExtension('.g.dart');
    final contents = await buildStep.readAsString(inputId);

    await buildStep.writeAsString(newAssetId, contents);
  }

  @override
  Map<String, List<String>> get buildExtensions => {
        '.dart': ['.g.dart']
      };
}
