import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:draw_badge/badge_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcov_parser/lcov_parser.dart';

import 'utils/save_child_widget.dart';

void main() {
  testWidgets('Save BadgeWidget to /tmp/out.png', (tester) async {
    await tester.runAsync(() async {
      const fontFamily = 'OpenSans-Regular';
      final fontFile = rootBundle.load('assets/fonts/$fontFamily.ttf');
      var loader = FontLoader(fontFamily)..addFont(fontFile);
      await loader.load();

      // The CWD is assumed to be / and the coverage dir is assumed to be /coverage
      final coverageDir = Directory('coverage');
      for (final entity in coverageDir.listSync()) {
        if (entity is Directory) {
          final records = await Parser.parse('${entity.path}/lcov.info');
          var totalHits = 0, totalFinds = 0;
          for (var rec in records) {
            totalFinds += rec.lines?.found ?? 0;
            totalHits += rec.lines?.hit ?? 0;
          }
          final percentCovered = ((totalHits / totalFinds) * 100).round();
          final packageName = entity.path.split('/').last;

          final completer = Completer<Uint8List>();
          var widget = SaveChildWidget(
            font: fontFamily,
            child: BadgeWidget(percentCovered, 'dart'),
            completer: completer,
          );

          await tester.pumpWidget(widget);

          final imageData = await completer.future;

          File('${entity.path}/badge.png').writeAsBytesSync(imageData);
        }
      }
    });
  });
}
