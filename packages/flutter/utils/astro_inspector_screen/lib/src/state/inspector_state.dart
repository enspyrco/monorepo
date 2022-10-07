import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:astro_state_interface/astro_state_interface.dart';
import 'package:collection/collection.dart';
import 'package:json_types/json_types.dart';

import '../enums/lineage_shape.dart';

/// The AppState for astro, named differently as the [AstroInspectorScreen] is
/// for visualising the AppState of apps.
class InspectorState with AstroState, ErrorHandlingState {
  InspectorState(
      {required this.errorMessages,
      required this.missionUpdates,
      required this.selectedIndex,
      required this.lineageFor,
      required this.indexFor});

  static InspectorState get initial => InspectorState(
        errorMessages: UnmodifiableListView([]),
        missionUpdates: UnmodifiableListView([]),
        selectedIndex: null,
        lineageFor: UnmodifiableMapView({}),
        indexFor: UnmodifiableMapView({}),
      );

  /// If there are errors (eg. decoding invalid json) we save an error message
  /// that the screen will display
  @override
  final List<ErrorReport> errorMessages;

  /// The list of mission updates, added to each time [MissionControl.launch] or
  /// [MissionControl.land] is called
  final List<JsonMap> missionUpdates;

  /// [selectedIndex] is a nullable int, as 'nothing selected' is a valid state
  final int? selectedIndex;

  /// [indexFor] maps a mission's id to its index in the list
  final Map<int, int> indexFor;

  /// [lineageFor] maps a mission's index in the list to the appropriate lineage
  /// shape, which is drawn as part part of the list item
  final Map<int, LineageShape> lineageFor;

  /// Convenience getters to safely extract the current selected state and
  /// previous state from the [missionUpdates]
  JsonMap get selectedState =>
      (selectedIndex == null) ? {} : missionUpdates[selectedIndex!]['state'];
  Map<String, dynamic> get previousState =>
      (selectedIndex == null || selectedIndex == 0)
          ? {}
          : missionUpdates[selectedIndex! - 1]['state'];

  @override
  InspectorState copyWith(
      {List<ErrorReport>? errorMessages,
      List<JsonMap>? missionUpdates,
      int? selectedIndex,
      Map<int, LineageShape>? lineageFor,
      Map<int, int>? indexFor}) {
    return InspectorState(
        errorMessages: errorMessages ?? this.errorMessages,
        missionUpdates: missionUpdates ?? this.missionUpdates,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        indexFor: indexFor ?? this.indexFor,
        lineageFor: lineageFor ?? this.lineageFor);
  }

  @override
  JsonMap toJson() => {
        'missionUpdates': (missionUpdates.isEmpty) ? {} : missionUpdates.first,
        'errorMessages': errorMessages,
        'selectedIndex': selectedIndex,
        'lineageForIndex': lineageFor,
        'indexForMissionId': indexFor
      };
}
