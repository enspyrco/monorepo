import 'package:astro/astro.dart';
import 'package:astro_error_handling/astro_error_handling.dart';
import 'package:collection/collection.dart';
import 'package:json_types/json_types.dart';

import '../enums/lineage_shape.dart';

/// The AppState for astro, named differently as the [AstroInspectorScreen] is
/// for visualising the AppState of apps.
class InspectorState extends RootState {
  InspectorState(
      {required this.errorMessages,
      required this.missionEvents,
      required this.selectedIndex,
      required this.lineageFor,
      required this.indexFor});

  static InspectorState get initial => InspectorState(
        errorMessages: UnmodifiableListView([]),
        missionEvents: UnmodifiableListView([]),
        selectedIndex: null,
        lineageFor: UnmodifiableMapView({}),
        indexFor: UnmodifiableMapView({}),
      );

  /// If there are errors (eg. decoding invalid json) we save an error message
  /// that the screen will display
  @override
  final List<ErrorMessage> errorMessages;

  /// The list of mission events, added to each time [MissionControl.launch] or
  /// [MissionControl.land] is called
  final List<JsonMap> missionEvents;

  /// [selectedIndex] is a nullable int, as 'nothing selected' is a valid state
  final int? selectedIndex;

  /// [indexFor] maps a mission's id to its index in the list
  final Map<int, int> indexFor;

  /// [lineageFor] maps a mission's index in the list to the appropriate lineage
  /// shape, which is drawn as part part of the list item
  final Map<int, LineageShape> lineageFor;

  /// Convenience getters to safely extract the current selected state and
  /// previous state from the [missionEvents]
  JsonMap get selectedState =>
      (selectedIndex == null) ? {} : missionEvents[selectedIndex!]['state'];
  Map<String, dynamic> get previousState =>
      (selectedIndex == null || selectedIndex == 0)
          ? {}
          : missionEvents[selectedIndex! - 1]['state'];

  @override
  InspectorState copyWith(
      {List<ErrorMessage>? errorMessages,
      List<JsonMap>? missionEvents,
      int? selectedIndex,
      Map<int, LineageShape>? lineageFor,
      Map<int, int>? indexFor}) {
    return InspectorState(
        errorMessages: errorMessages ?? this.errorMessages,
        missionEvents: missionEvents ?? this.missionEvents,
        selectedIndex: selectedIndex ?? this.selectedIndex,
        indexFor: indexFor ?? this.indexFor,
        lineageFor: lineageFor ?? this.lineageFor);
  }

  @override
  JsonMap toJson() => {
        'missionEvents': (missionEvents.isEmpty) ? {} : missionEvents.first,
        'errorMessages': errorMessages,
        'selectedIndex': selectedIndex,
        'lineageForIndex': lineageFor,
        'indexForMissionId': indexFor
      };
}
