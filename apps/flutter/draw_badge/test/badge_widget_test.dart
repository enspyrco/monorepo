import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:draw_badge/badge_widget.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lcov_parser/lcov_parser.dart';

import 'utils/save_child_widget.dart';

void main() {
  testWidgets('Create a BadgeWidget for each package & save to a png file',
      (tester) async {
    await tester.runAsync(() async {
      const fontFamily = 'OpenSans-Regular';
      final fontFile = rootBundle.load('assets/fonts/$fontFamily.ttf');
      var loader = FontLoader(fontFamily)..addFont(fontFile);
      await loader.load();

      var coveragePath = '/coverage';
      // var coveragePath = 'test/data/coverage';
      final coverageDir = Directory(coveragePath);
      for (final entity in coverageDir.listSync()) {
        if (entity is Directory) {
          print('package: ${entity.path.split('/').last}');

          final projectType =
              File('${entity.path}/project_type.txt').readAsStringSync();
          final records = await Parser.parse('${entity.path}/lcov.info');
          var totalHits = 0, totalFinds = 0;
          for (var rec in records) {
            totalFinds += rec.lines?.found ?? 0;
            totalHits += rec.lines?.hit ?? 0;
          }
          final percentCovered = ((totalHits / totalFinds) * 100).round();

          final completer = Completer<Uint8List>();
          var widget = SaveChildWidget(
            font: fontFamily,
            child: BadgeWidget(percentCovered, projectType),
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
