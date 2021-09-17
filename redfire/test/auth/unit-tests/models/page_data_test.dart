import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:redfire/types.dart';
import 'package:test/test.dart';

import '../../../../../redfire_test/lib/src/test-doubles/redux/example_app_state.dart';

// when this gets out of date, we have run print(json.encode(ExampleAppState.init().toJson())); and updated the string
// TODO: change to just creating an ExampleAppState with relevant pages and going toJson and back
// then checking the first object matches the last
const exampleAppStateJsonString = r'''
{"pages":[{"type":"InitialPageData"},{"type":"ProfilePageData"},{"problem":{"message":"message","trace":null},"type":"ProblemPageData"}],"problems":[],"settings":{"darkTheme":{"colors":{"primary":4280391411,"secondary":4294953772,"error":4288217088},"brightness":"DARK"},"lightTheme":{"colors":{"primary":4280391411,"secondary":4294953772,"error":4288217088},"brightness":"LIGHT"},"brightnessMode":"LIGHT","platform":"UNKNOWN"},"auth":{"emailVM":{"email":null,"emailSignInStep":"WAITING_FOR_EMAIL"},"userData":null,"idTokenResult":null,"step":"WAITING_FOR_INPUT"},"profile":null}''';

void main() {
  group('List of PageData', () {
    test('should serialise and deserialise correctly', () async {
      // TODO: does the serialisation only work if pages is part of ExampleAppState?
      // if so, document

      /// Create [ExampleAppState] with [pages] containing each type
      /// of [PageData].
      final appState = ExampleAppState.init().copyWith(
          pages: [
        InitialPageData(),
        ProfilePageData(),
        ProblemPageData(ProblemInfo('message'))
      ].lock);
      // Check the AppState matches the stored example.
      expect(jsonEncode(appState), exampleAppStateJsonString);

      // setup the page transforms map
      // TODO: get rid of this when we change to creating at app start (see TODO at [addPageTransforms])
      addPageTransforms<ExampleAppState>(Container(), []);

      // Recreate the app state from the example json.
      final appState2 = ExampleAppState.fromJson(
          jsonDecode(exampleAppStateJsonString) as JsonMap);
      // print(appState2.toJson());
      expect(appState2, appState);
    });
  });
}
