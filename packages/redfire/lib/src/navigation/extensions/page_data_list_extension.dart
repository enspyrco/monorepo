import 'package:flutter/material.dart';

import 'package:fast_immutable_collections/fast_immutable_collections.dart';

import '../../types/red_fire_state.dart';
import '../models/page_data.dart';

/// We are using extensions in order to keep models as PODOs and avoid other
/// dependencies in the app state.
extension PageDataListExtension on IList<PageData> {
  /// Creates a list of [MaterialPage] from a list of [PageData]
  /// - used as the history for [Navigator]
  List<Page> toPages<T extends RedFireState>() {
    return map<Page>(
        (pageData) => toMaterialPageMap[pageData.typeName]!(pageData)).toList();
  }
}
