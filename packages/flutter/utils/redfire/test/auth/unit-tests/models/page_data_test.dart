import 'dart:convert';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';
import 'package:flutter/widgets.dart';
import 'package:json_types/json_types.dart';
import 'package:redfire/types.dart';
import 'package:redfire_test/redfire_test.dart';
import 'package:test/test.dart';

void main() {
  group('List of PageData', () {
    test('should serialise and deserialise correctly', () async {
      // TODO: does the serialisation only work if pages is part of ExampleAppState?
      // if so, document
      //  - one thing is that you can't just go toJson then fromJson, we have to
      //    perform the json encode/decode (so the JsonConverter can make the json correct

      /// Create [ExampleAppState] with [pages] containing each type
      /// of [PageData].
      final appState = ExampleAppState.init().copyWith(
          pages: [
        const InitialPageData(),
        const ProfilePageData(),
        ProblemPageData(ProblemInfo('message'))
      ].lock);

      // setup the page transforms map
      // TODO: get rid of this when we change to creating at app start (see TODO at [addPageTransforms])
      addPageTransforms<ExampleAppState>(Container(), ISet(), ISet());

      var json = jsonEncode(appState.toJson());

      // Convert app state to json then back to app state.
      var appState2 = ExampleAppState.fromJson(jsonDecode(json) as JsonMap);

      expect(appState2, appState);
    });
  });
}
