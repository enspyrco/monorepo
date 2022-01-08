import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:draw_badge/badge_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

import 'utils/save_child_widget.dart';

void main() {
  testWidgets('Save BadgeWidget to /tmp/out.png', (tester) async {
    await tester.runAsync(() async {
      const fontFamily = 'Roboto-Regular';
      final fontFile = rootBundle.load('assets/fonts/$fontFamily.ttf');
      var loader = FontLoader(fontFamily)..addFont(fontFile);
      await loader.load();

      final completer = Completer<Uint8List>();
      var widget = SaveChildWidget(
        font: fontFamily,
        child: const BadgeWidget(),
        completer: completer,
      );

      await tester.pumpWidget(widget);

      final imageData = await completer.future;

      File('/tmp/out.png').writeAsBytesSync(imageData);
    });
  });
}
