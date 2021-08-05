import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:redfire/types.dart';
import 'package:test/test.dart';

import '../../test-doubles/app_state/app_state.dart';

const exampleAppStateJsonString = r'''
{"pages":[{"type":"_$_InitialPageData"},{"type":"_$_ProfilePageData"},{"problem":{"message":"message","trace":null},"type":"_$_ProblemPageData"}],"problems":[],"settings":{"darkTheme":{"colors":{"primary":4280391411,"secondary":4294953772,"error":4288217088},"brightness":"DARK"},"lightTheme":{"colors":{"primary":4280391411,"secondary":4294953772,"error":4288217088},"brightness":"LIGHT"},"brightnessMode":"LIGHT","platform":"UNKNOWN"},"auth":{"userData":null,"step":"WAITING_FOR_INPUT"},"profile":null}''';

void main() {
  group('List of PageData', () {
    test('should serialise and deserialise correctly when part of AppState',
        () async {
      /// Create example [AppState] with [AppState.pages] containing each type
      /// of [PageData].
      final appState = AppState.init().copyWith(
          pages: [
        InitialPageData(),
        ProfilePageData(),
        ProblemPageData(ProblemInfo('message'))
      ].lock);
      // Check the AppState matches the stored example.
      expect(jsonEncode(appState), exampleAppStateJsonString);

      // Recreate the app state from the example json.
      final appState2 =
          AppState.fromJson(jsonDecode(exampleAppStateJsonString) as JsonMap);
      // print(appState2.toJson());
      expect(appState2, appState);
    });
  });
}
