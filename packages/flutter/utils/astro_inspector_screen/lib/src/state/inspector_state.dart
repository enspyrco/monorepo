import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_types/error_handling_types.dart';
import 'package:astro_types/json_types.dart';
import 'package:astro_types/state_types.dart';
import 'package:collection/collection.dart';

import '../enums/lineage_shape.dart';

/// The AppState for astro, named differently as the [AstroInspectorScreen] is
/// for visualising the AppState of apps.
class InspectorState implements AstroState, AppStateErrorHandling {
  InspectorState(
      {required this.error,
      required this.missionReports,
      required this.selectedIndex,
      required this.lineageFor,
      required this.indexFor});

  static InspectorState get initial => InspectorState(
        error: DefaultErrorHandlingState.initial,
        missionReports: UnmodifiableListView([]),
        selectedIndex: null,
        lineageFor: UnmodifiableMapView({}),
        indexFor: UnmodifiableMapView({}),
      );

  /// If there are errors (eg. decoding invalid json) we save an error message
  /// that the screen will display
  @override
  final DefaultErrorHandlingState error;

  /// The list of mission updates, added to each time [MissionControl.launch] or
  /// [MissionControl.land] is called
  final List<JsonMap> missionReports;

  /// [selectedIndex] is a nullable int, as 'nothing selected' is a valid state
  final int? selectedIndex;

  /// [indexFor] maps a mission's id to its index in the list
  final Map<int, int> indexFor;

  /// [lineageFor] maps a mission's index in the list to the appropriate lineage
  /// shape, which is drawn as part part of the list item
  final Map<int, LineageShape> lineageFor;

  /// Convenience getters to safely extract the current selected state and
  /// previous state from the [missionReports]
  JsonMap get selectedState =>
      (selectedIndex == null) ? {} : missionReports[selectedIndex!]['state'];
  Map<String, dynamic> get previousState =>
      (selectedIndex == null || selectedIndex == 0)
          ? {}
          : missionReports[selectedIndex! - 1]['state'];

  @override
  InspectorState copyWith(
      {DefaultErrorHandlingState? error,
      List<JsonMap>? missionReports,
      int? selectedIndex,
      Map<int, LineageShape>? lineageFor,
      Map<int, int>? indexFor}) {
    return InspectorState(
        error: error ?? this.error,
        missionReports: missionReports ?? this.missionReports,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        indexFor: indexFor ?? this.indexFor,
        lineageFor: lineageFor ?? this.lineageFor);
  }

  @override
  JsonMap toJson() => {
        'missionReports': (missionReports.isEmpty) ? {} : missionReports.first,
        'error': error,
        'selectedIndex': selectedIndex,
        'lineageForIndex': lineageFor,
        'indexForMissionId': indexFor
      };
}
